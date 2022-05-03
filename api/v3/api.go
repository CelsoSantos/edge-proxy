package api_v3

import (
	envoyapiv3core "github.com/envoyproxy/go-control-plane/envoy/config/core/v3"
	envoyauthv3 "github.com/envoyproxy/go-control-plane/envoy/service/auth/v3"
	envoytypev3 "github.com/envoyproxy/go-control-plane/envoy/type/v3"
	"github.com/golang/protobuf/ptypes/wrappers"
	"google.golang.org/genproto/googleapis/rpc/code"
	"google.golang.org/genproto/googleapis/rpc/status"
)

// Minimal OK response
func AuthorizedResponse() *envoyauthv3.CheckResponse {
	return &envoyauthv3.CheckResponse{
		Status: &status.Status{
			Code: int32(code.Code_OK),
		},
	}
}

// OK response with Token
func AuthorizedResponseWithToken(jwt string) *envoyauthv3.CheckResponse {
	return &envoyauthv3.CheckResponse{
		HttpResponse: &envoyauthv3.CheckResponse_OkResponse{
			OkResponse: &envoyauthv3.OkHttpResponse{
				Headers: []*envoyapiv3core.HeaderValueOption{
					{
						Append: &wrappers.BoolValue{Value: false},
						Header: &envoyapiv3core.HeaderValue{
							Key:   "authorization",
							Value: "Bearer " + jwt,
						},
					},
				},
			},
		},
		Status: &status.Status{
			Code: int32(code.Code_OK),
		},
	}
}

// Minimal FORBIDDEN (403) response
func UnauthorizedResponse() *envoyauthv3.CheckResponse {
	return &envoyauthv3.CheckResponse{
		Status: &status.Status{
			Code: int32(code.Code_PERMISSION_DENIED),
		},
	}
}

// Minimal UNAUTHORIZED (401) response
func UnauthenticatedResponse() *envoyauthv3.CheckResponse {
	return &envoyauthv3.CheckResponse{
		Status: &status.Status{
			Code: int32(code.Code_UNAUTHENTICATED),
		},
		HttpResponse: &envoyauthv3.CheckResponse_DeniedResponse{
			DeniedResponse: &envoyauthv3.DeniedHttpResponse{
				Status: &envoytypev3.HttpStatus{
					Code: envoytypev3.StatusCode_Unauthorized,
				},
			},
		},
	}
}

func InternalServerErrorResponse() *envoyauthv3.CheckResponse {
	resp := UnauthorizedResponse()
	resp.HttpResponse = &envoyauthv3.CheckResponse_DeniedResponse{
		DeniedResponse: &envoyauthv3.DeniedHttpResponse{
			Status: &envoytypev3.HttpStatus{
				Code: envoytypev3.StatusCode_InternalServerError,
			},
		},
	}
	return resp
}
