package mycompany_claims

import (
	"errors"
	"os"
	"strconv"
	"strings"
	"time"

	utils "github.com/celsosantos/edge-proxy/pkg/utils/jwt"
	"github.com/golang-jwt/jwt/v4"
)

var ttl time.Duration = 7200 // Default TTL: 7200s = 2h

// MyCompanyClaims represents a MyCompanyJWT token object
type MyCompanyClaims struct {
	Name           string   `json:"https://mycompany.com/name"`
	Email          string   `json:"https://mycompany.com/email"`
	Phone          string   `json:"https://mycompany.com/phone_number,omitempty"`
	OrganizationID string   `json:"https://mycompany.com/organization_id"`
	ParentToken    string   `json:"https://mycompany.com/parent_token,omitempty"`
	UserRoles      []string `json:"https://mycompany.com/user_roles"`
	ZoneInfo       string   `json:"https://mycompany.com/zoneinfo"`
	Audience       []string `json:"aud"`
	jwt.StandardClaims
}

// CreateToken creates a MyCompanyJWT token from a given set of params
func (claims MyCompanyClaims) CreateToken(
	userID string,
	fullName string,
	email string,
	phone string,
	organizationID string,
	parentToken string,
	userRoles []string,
	zoneInfo string,
) (string, error) {

	if t, err := strconv.Atoi(os.Getenv("TTL")); err != nil {
		ttl = time.Duration(t)
	}

	// IssuedAt
	iat := time.Now()
	// ExpiresAt
	exp := iat.Add(time.Second * ttl)

	mycompanyClaims := &MyCompanyClaims{
		Name:           fullName,
		Email:          email,
		Phone:          phone,
		OrganizationID: organizationID,
		ParentToken:    parentToken,
		UserRoles:      userRoles,
		ZoneInfo:       zoneInfo,
		Audience:       strings.Split(os.Getenv("AUDIENCE"), ","),
		StandardClaims: jwt.StandardClaims{
			Subject:   userID,
			Issuer:    os.Getenv("ISSUER"),
			IssuedAt:  iat.Unix(),
			ExpiresAt: exp.Unix(),
		},
	}

	if token, err := utils.SignToken(mycompanyClaims); err == nil {
		t := *token
		return t, nil
	} else if err != nil {
		return "", err
	}

	return "", errors.New("Can't create token")
}
