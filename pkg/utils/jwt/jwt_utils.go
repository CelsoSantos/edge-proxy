package jwt_utils

import (
	"crypto/rsa"
	"errors"
	"fmt"
	"io/ioutil"
	"os"

	jwt "github.com/golang-jwt/jwt/v4"
	jwk "github.com/lestrrat-go/jwx/jwk"
)

// location of the files used for signing and verification
const privKeyPath = "/etc/keys/private.json"

// init runs before all other methods and validates a key exists
func init() {

	set, err := getKeySet()
	if err != nil {
		fmt.Println(err)
		os.Exit(1) // Return code 1: KeySet invalid
	}

	fmt.Println("Number of keys:", len(set.Keys))
	fmt.Println("Key[0] KeyID:", set.Keys[0].KeyID())
	fmt.Println("Key[0] Type:", set.Keys[0].KeyType().String())
	fmt.Println("Algorithm:", set.Keys[0].Algorithm())
	fmt.Println("Usage:", set.Keys[0].KeyUsage())

	_, err = getSignKey(*set)
	if err != nil {
		fmt.Printf("failed to create RAW private key: %s\n", err)
		os.Exit(2) // Return code 2: PrivateKey invalid
	}
}

// getKeySet reloads KeySet from filesystem
func getKeySet() (*jwk.Set, error) {
	b, err := ioutil.ReadFile(privKeyPath)
	if err != nil {
		fmt.Println(err)
	}

	return jwk.ParseBytes(b)
}

// getSignKey returns a rsa.PrivateKey for signing the token
func getSignKey(set jwk.Set) (*rsa.PrivateKey, error) {
	signKey := rsa.PrivateKey{}

	if err := set.Keys[0].Raw(&signKey); err != nil {
		return nil, err
	}
	return &signKey, nil
}

// getExternalKey retrieves a remote JWKS
func getExternalKey(token *jwt.Token) (interface{}, error) {
	// TODO: cache response so we don't have to make a request every time
	// we want to verify a JWT with a JWKS
	set, err := jwk.Fetch(os.Getenv("JWKS_URL"))
	if err != nil {
		fmt.Printf("failed to parse JWK: %s", err)
		return nil, err
	}

	keyID, ok := token.Header["kid"].(string)
	if !ok {
		return nil, errors.New("expecting JWT header to have string kid")
	}

	keys := set.LookupKeyID(keyID)
	if len(keys) == 0 { //TODO: This seems a bit redundant...
		fmt.Printf("failed to lookup key: %s", err)
		return nil, errors.New("expecting JWT header to have string kid")
	}

	var key interface{} // publickey
	if err := keys[0].Raw(&key); err != nil {
		fmt.Printf("failed to create public key: %s", err)
		return nil, fmt.Errorf("unable to find key %q", keyID)
	}

	return key, nil
}

// ParseToken parses a given token string into a jwt.Claims interface
func ParseToken(tokenString string, claims jwt.Claims) (*jwt.Token, error) {
	// ParseWithClaims takes the token string and a function for looking up the key,
	// according to a given token format (claims)
	return jwt.ParseWithClaims(tokenString, claims, getExternalKey)
}

// SignToken creates a new token object, specifying signing method and the claims
func SignToken(item interface{}) (*string, error) {
	claims := item.(jwt.Claims) // Cast parameter to type claims
	token := jwt.NewWithClaims(jwt.SigningMethodRS256, claims)
	if token == nil {
		return nil, errors.New("Error generating jwt with provided Claims")
	}

	// Reload for every request the keySet...
	// https://github.com/celsosantos/edge-proxy/issues/24
	set, err := getKeySet()
	if err != nil {
		fmt.Println(err)
		return nil, err
	}
	if val, present := os.LookupEnv("DEBUG"); present && val == "true" {
		fmt.Println("Key[0] KeyID:", set.Keys[0].KeyID())
	}
	// ...and create sign key
	signKey, err := getSignKey(*set)
	if err != nil {
		fmt.Println(err)
		return nil, err
	}

	// Force the presence of the KeyID property on the jwt header
	// https://github.com/celsosantos/edge-proxy/issues/27
	token.Header["kid"] = set.Keys[0].KeyID();

	// Sign and get the complete encoded token as a string using the secret
	ss, err := token.SignedString(signKey)
	if val, present := os.LookupEnv("DEBUG"); present && val == "true" {
		fmt.Println("Signed-String:", ss)
	}

	switch {
	case err != nil:
		return nil, err
	case len(ss) == 0:
		return nil, errors.New("Token is empty")
	default:
		return &ss, nil
	}
}

func DerefString(s *string) string {
	if s != nil {
		return *s
	}

	return ""
}
