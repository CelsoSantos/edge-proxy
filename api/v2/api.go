package api_v2

import (
	envoyapiv2core "github.com/envoyproxy/go-control-plane/envoy/api/v2/core"
	envoyauthv2 "github.com/envoyproxy/go-control-plane/envoy/service/auth/v2"
	envoytypev2 "github.com/envoyproxy/go-control-plane/envoy/type"
	"github.com/golang/protobuf/ptypes/wrappers"
	"google.golang.org/genproto/googleapis/rpc/code"
	"google.golang.org/genproto/googleapis/rpc/status"
)

// Minimal OK response
func AuthorizedResponse() *envoyauthv2.CheckResponse {
	return &envoyauthv2.CheckResponse{
		Status: &status.Status{
			Code: int32(code.Code_OK),
		},
	}
}

// OK response with Token
func AuthorizedResponseWithToken(jwt string) *envoyauthv2.CheckResponse {
	return &envoyauthv2.CheckResponse{
		HttpResponse: &envoyauthv2.CheckResponse_OkResponse{
			OkResponse: &envoyauthv2.OkHttpResponse{
				Headers: []*envoyapiv2core.HeaderValueOption{
					{
						Append: &wrappers.BoolValue{Value: false},
						Header: &envoyapiv2core.HeaderValue{
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
func UnauthorizedResponse() *envoyauthv2.CheckResponse {
	return &envoyauthv2.CheckResponse{
		Status: &status.Status{
			Code: int32(code.Code_PERMISSION_DENIED),
		},
	}
}

// Minimal UNAUTHORIZED (401) response
func UnauthenticatedResponse() *envoyauthv2.CheckResponse {
	return &envoyauthv2.CheckResponse{
		Status: &status.Status{
			Code: int32(code.Code_UNAUTHENTICATED),
		},
		HttpResponse: &envoyauthv2.CheckResponse_DeniedResponse{
			DeniedResponse: &envoyauthv2.DeniedHttpResponse{
				Status: &envoytypev2.HttpStatus{
					Code: envoytypev2.StatusCode_Unauthorized,
				},
			},
		},
	}
}

func InternalServerErrorResponse() *envoyauthv2.CheckResponse {
	resp := UnauthorizedResponse()
	resp.HttpResponse = &envoyauthv2.CheckResponse_DeniedResponse{
		DeniedResponse: &envoyauthv2.DeniedHttpResponse{
			Status: &envoytypev2.HttpStatus{
				Code: envoytypev2.StatusCode_InternalServerError,
			},
		},
	}
	return resp
}
