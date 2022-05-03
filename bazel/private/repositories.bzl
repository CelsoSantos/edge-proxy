load("@bazel_gazelle//:deps.bzl", "go_repository")

def proxy_dependencies():
    go_repository(
        name = "ag_pack_amqp",
        importpath = "pack.ag/amqp",
        sum = "h1:4PfqFQ28BTzS1ghmnaADX14yktqA+iU8H5t4lkTZxaA=",
        version = "v0.12.2",
    )
    go_repository(
        name = "co_honnef_go_tools",
        build_file_proto_mode = "disable_global",
        importpath = "honnef.co/go/tools",
        sum = "h1:/hemPrYIhOhy8zYrNj+069zDB68us2sMGsfkFJO0iZs=",
        version = "v0.0.0-20190523083050-ea95bdfd59fc",
    )
    go_repository(
        name = "com_github_antihax_optional",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/antihax/optional",
        sum = "h1:xK2lYat7ZLaVVcIuj82J8kIro4V6kDe0AUDFboUCwcg=",
        version = "v1.0.0",
    )

    go_repository(
        name = "com_github_burntsushi_toml",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/BurntSushi/toml",
        sum = "h1:WXkYYl6Yr3qBf1K79EBnL4mak0OimBfB0XUf9Vl28OQ=",
        version = "v0.3.1",
    )
    go_repository(
        name = "com_github_census_instrumentation_opencensus_proto",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/census-instrumentation/opencensus-proto",
        sum = "h1:glEXhBS5PSLLv4IXzLA5yPRVX4bilULVyxxbrfOtDAk=",
        version = "v0.2.1",
    )
    go_repository(
        name = "com_github_cespare_xxhash_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cespare/xxhash/v2",
        sum = "h1:6MnRN8NT7+YBpUIWxHtefFZOKTAPgGjpQSxqLNn0+qY=",
        version = "v2.1.1",
    )

    go_repository(
        name = "com_github_client9_misspell",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/client9/misspell",
        sum = "h1:ta993UF76GwbvJcIo3Y68y/M3WxlpEHPWIGDkJYwzJI=",
        version = "v0.3.4",
    )
    go_repository(
        name = "com_github_cncf_udpa_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cncf/udpa/go",
        sum = "h1:hzAQntlaYRkVSFEfj9OTWlVV1H155FMD8BTKktLv0QI=",
        version = "v0.0.0-20210930031921-04548b0d99d4",
    )
    go_repository(
        name = "com_github_cncf_xds_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cncf/xds/go",
        sum = "h1:zH8ljVhhq7yC0MIeUL/IviMtY8hx2mK8cN9wEYb8ggw=",
        version = "v0.0.0-20211011173535-cb28da3451f1",
    )

    go_repository(
        name = "com_github_davecgh_go_spew",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/davecgh/go-spew",
        sum = "h1:ZDRjVQ15GmhC3fiQ8ni8+OwkZQO4DARzQgrnXU1Liz8=",
        version = "v1.1.0",
    )
    go_repository(
        name = "com_github_decred_dcrd_crypto_blake256",
        importpath = "github.com/decred/dcrd/crypto/blake256",
        sum = "h1:/8DMNYp9SGi5f0w7uCm6d6M4OU2rGFK09Y2A4Xv7EE0=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_decred_dcrd_dcrec_secp256k1_v4",
        importpath = "github.com/decred/dcrd/dcrec/secp256k1/v4",
        sum = "h1:1iy2qD6JEhHKKhUOA9IWs7mjco7lnw2qx8FsRI2wirE=",
        version = "v4.0.0-20210816181553-5444fa50b93d",
    )

    go_repository(
        name = "com_github_envoyproxy_go_control_plane",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/envoyproxy/go-control-plane",
        sum = "h1:xvqufLtNVwAhN8NMyWklVgxnWohi+wtMGQMhtxexlm0=",
        version = "v0.10.2-0.20220325020618-49ff273808a1",
    )
    go_repository(
        name = "com_github_envoyproxy_protoc_gen_validate",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/envoyproxy/protoc-gen-validate",
        sum = "h1:EQciDnbrYxy13PgWoY8AqoxGiPrpgBZ1R8UNe3ddc+A=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_ghodss_yaml",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ghodss/yaml",
        sum = "h1:wQHKEahhL6wmXdzwWG11gIVCkOv05bNOh+Rxn0yngAk=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_goccy_go_json",
        importpath = "github.com/goccy/go-json",
        sum = "h1:5/4CtRQdtsX0sal8fdVhTaiMN01Ri8BExZZ8iRmHQ6E=",
        version = "v0.9.6",
    )

    go_repository(
        name = "com_github_golang_glog",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golang/glog",
        sum = "h1:VKtxabqXZkF25pY9ekfRL6a582T4P37/31XEstQ5p58=",
        version = "v0.0.0-20160126235308-23def4e6c14b",
    )
    go_repository(
        name = "com_github_golang_jwt_jwt_v4",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golang-jwt/jwt/v4",
        sum = "h1:pC5DB52sCeK48Wlb9oPcdhnjkz1TKt1D/P7WKJ0kUcQ=",
        version = "v4.4.1",
    )

    go_repository(
        name = "com_github_golang_mock",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golang/mock",
        sum = "h1:G5FRp8JnTd7RQH5kemVNlMeyXQAztQ3mOWV95KxsXH8=",
        version = "v1.1.1",
    )
    go_repository(
        name = "com_github_golang_protobuf",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golang/protobuf",
        sum = "h1:ROPKBNFfQgOUMifHyP+KYbvpjbdoFNs+aK7DXlji0Tw=",
        version = "v1.5.2",
    )
    go_repository(
        name = "com_github_google_go_cmp",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/go-cmp",
        sum = "h1:BKbKCqvP6I+rmFHt06ZmyQtvB8xAkWdhFyr0ZUNZcxQ=",
        version = "v0.5.6",
    )
    go_repository(
        name = "com_github_google_uuid",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/uuid",
        sum = "h1:EVhdT+1Kseyi1/pUmXKaFxYsDNy9RQYkMWRH68J/W7Y=",
        version = "v1.1.2",
    )
    go_repository(
        name = "com_github_grpc_ecosystem_grpc_gateway",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/grpc-ecosystem/grpc-gateway",
        sum = "h1:gmcG1KaJ57LophUzW0Hy8NmPhnMZb4M0+kPpLofRdBo=",
        version = "v1.16.0",
    )

    go_repository(
        name = "com_github_iancoleman_strcase",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/iancoleman/strcase",
        sum = "h1:dJBk1m2/qjL1twPLf68JND55vvivMupZ4wIzE8CTdBw=",
        version = "v0.1.3",
    )
    go_repository(
        name = "com_github_kr_fs",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kr/fs",
        sum = "h1:Jskdu9ieNAYnjxsi0LbQp1ulIKZV1LAFgK1tWhpZgl8=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_lestrrat_go_backoff_v2",
        importpath = "github.com/lestrrat-go/backoff/v2",
        sum = "h1:oNb5E5isby2kiro9AgdHLv5N5tint1AnDVVf2E2un5A=",
        version = "v2.0.8",
    )
    go_repository(
        name = "com_github_lestrrat_go_blackmagic",
        importpath = "github.com/lestrrat-go/blackmagic",
        sum = "h1:XzdxDbuQTz0RZZEmdU7cnQxUtFUzgCSPq8RCz4BxIi4=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_lestrrat_go_httpcc",
        importpath = "github.com/lestrrat-go/httpcc",
        sum = "h1:ydWCStUeJLkpYyjLDHihupbn2tYmZ7m22BGkcvZZrIE=",
        version = "v1.0.1",
    )

    go_repository(
        name = "com_github_lestrrat_go_iter",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/lestrrat-go/iter",
        sum = "h1:FvnrqecqX4zT0wOIbYK1gNgTm0677INEWiFY8UEYggY=",
        version = "v0.0.0-20200422075355-fc1769541911",
    )
    go_repository(
        name = "com_github_lestrrat_go_jwx",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/lestrrat-go/jwx",
        sum = "h1:8bVUGXXkR3+YQNwuFof3lLxSJMLtrscHJfGI6ZIBRD0=",
        version = "v1.0.5",
    )
    go_repository(
        name = "com_github_lestrrat_go_option",
        importpath = "github.com/lestrrat-go/option",
        sum = "h1:WqAWL8kh8VcSoD6xjSH34/1m8yxluXQbDeKNfvFeEO4=",
        version = "v1.0.0",
    )

    go_repository(
        name = "com_github_lestrrat_go_pdebug",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/lestrrat-go/pdebug",
        sum = "h1:aEZT3f1GGg5RIlHMAy4/4fe4ciOi3SCwYoaURphcB4k=",
        version = "v0.0.0-20200204225717-4d6bd78da58d",
    )
    go_repository(
        name = "com_github_lyft_protoc_gen_star",
        build_file_proto_mode = "disable_global",
        # build_file_proto_mode = "default",
        importpath = "github.com/lyft/protoc-gen-star",
        sum = "h1:ICQPpOr4uO46eme1Y5Jj0fnJkc9/upQ9xxt0+2AmUDQ=",
        version = "v0.5.2",
    )
    go_repository(
        name = "com_github_pkg_errors",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pkg/errors",
        sum = "h1:FEBLx1zS214owpjy7qsBeixbURkuhQAwrK5UwLGTwt4=",
        version = "v0.9.1",
    )
    go_repository(
        name = "com_github_pkg_sftp",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pkg/sftp",
        sum = "h1:VasscCm72135zRysgrJDKsntdmPN+OuU3+nnHYA9wyc=",
        version = "v1.10.1",
    )

    go_repository(
        name = "com_github_pmezard_go_difflib",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pmezard/go-difflib",
        sum = "h1:4DBwDE0NGyQoBHbLQYPwSUPoCMWR5BEzIk/f1lZbAQM=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_prometheus_client_model",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/prometheus/client_model",
        sum = "h1:gQz4mCbXsO+nc9n1hCxHcGA3Zx3Eo+UHZoInFGUIXNM=",
        version = "v0.0.0-20190812154241-14fe0d1b01d4",
    )
    go_repository(
        name = "com_github_rogpeppe_fastuuid",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/rogpeppe/fastuuid",
        sum = "h1:Ppwyp6VYCF1nvBTXL3trRso7mXMlRrw9ooo375wvi2s=",
        version = "v1.2.0",
    )

    go_repository(
        name = "com_github_spf13_afero",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/spf13/afero",
        sum = "h1:xoax2sJ2DT8S8xA2paPFjDCScCNeWsg75VG0DLRreiY=",
        version = "v1.6.0",
    )

    go_repository(
        name = "com_github_stretchr_objx",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/stretchr/objx",
        sum = "h1:4G4v2dO3VZwixGIRoQ5Lfboy6nUhCyYzaqnIAPPhYs4=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_stretchr_testify",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/stretchr/testify",
        sum = "h1:nwc3DEeHmmLAfoZucVR881uASk0Mfjw8xYJ99tb5CcY=",
        version = "v1.7.0",
    )
    go_repository(
        name = "com_github_yuin_goldmark",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/yuin/goldmark",
        sum = "h1:nqDD4MMMQA0lmWq03Z2/myGPYLQoXtmi0rGVs95ntbo=",
        version = "v1.1.27",
    )
    go_repository(
        name = "com_google_cloud_go",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go",
        sum = "h1:eOI3/cP2VTU6uZLDYAoic+eyzzB9YyGmJ7eIjl8rOPg=",
        version = "v0.34.0",
    )
    go_repository(
        name = "in_gopkg_check_v1",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/check.v1",
        sum = "h1:yhCVgyC4o1eVCa2tZl7eS0r+SDo693bJlVdllGtEeKM=",
        version = "v0.0.0-20161208181325-20d25e280405",
    )
    go_repository(
        name = "in_gopkg_yaml_v2",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/yaml.v2",
        sum = "h1:fvjTMHxHEw/mxHbtzPi3JCcKXQRAnQTBRo6YCJSVHKI=",
        version = "v2.2.3",
    )
    go_repository(
        name = "in_gopkg_yaml_v3",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/yaml.v3",
        sum = "h1:dUUwHk2QECo/6vqA44rthZ8ie2QXMNeKRTHCNY2nXvo=",
        version = "v3.0.0-20200313102051-9f266ea9e77c",
    )
    go_repository(
        name = "io_opentelemetry_go_proto_otlp",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/proto/otlp",
        sum = "h1:rwOQPCuKAKmwGKq2aVNnYIibI6wnV7EvzgfTCzcdGg8=",
        version = "v0.7.0",
    )

    go_repository(
        name = "org_golang_google_appengine",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/appengine",
        sum = "h1:/wp5JvzpHIxhs/dumFmF7BXTf3Z+dd4uXta4kVyO508=",
        version = "v1.4.0",
    )
    go_repository(
        name = "org_golang_google_genproto",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/genproto",
        sum = "h1:hrbNEivu7Zn1pxvHk6MBrq9iE22woVILTHqexqBxe6I=",
        version = "v0.0.0-20220502173005-c8bf987b8c21",
    )
    go_repository(
        name = "org_golang_google_grpc",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/grpc",
        sum = "h1:oCjezcn6g6A75TGoKYBPgKmVBLexhYLM6MebdrPApP8=",
        version = "v1.46.0",
    )
    go_repository(
        name = "org_golang_google_protobuf",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/protobuf",
        sum = "h1:w43yiav+6bVFTBQFZX0r7ipe9JQ1QsbMgHwbBziscLw=",
        version = "v1.28.0",
    )
    go_repository(
        name = "org_golang_x_crypto",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/crypto",
        sum = "h1:psW17arqaxU48Z5kZ0CQnkZWQJsqcURM6tKiBApRjXI=",
        version = "v0.0.0-20200622213623-75b288015ac9",
    )
    go_repository(
        name = "org_golang_x_exp",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/exp",
        sum = "h1:c2HOrn5iMezYjSlGPncknSEr/8x5LELb/ilJbXi9DEA=",
        version = "v0.0.0-20190121172915-509febef88a4",
    )
    go_repository(
        name = "org_golang_x_lint",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/lint",
        sum = "h1:XQyxROzUlZH+WIQwySDgnISgOivlhjIEwaQaJEJrrN0=",
        version = "v0.0.0-20190313153728-d0100b6bd8b3",
    )
    go_repository(
        name = "org_golang_x_mod",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/mod",
        sum = "h1:KU7oHjnv3XNWfa5COkzUifxZmxp1TyI7ImMXqFxLwvQ=",
        version = "v0.2.0",
    )
    go_repository(
        name = "org_golang_x_net",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/net",
        sum = "h1:4nGaVu0QrbjT/AK2PRLuQfQuh6DJve+pELhqTdAj3x0=",
        version = "v0.0.0-20210405180319-a5a99cb37ef4",
    )
    go_repository(
        name = "org_golang_x_oauth2",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/oauth2",
        sum = "h1:TzXSXBo42m9gQenoE3b9BGiEpg5IG2JkU5FkPIawgtw=",
        version = "v0.0.0-20200107190931-bf48bf16ab8d",
    )
    go_repository(
        name = "org_golang_x_sync",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/sync",
        sum = "h1:vcxGaoTs7kV8m5Np9uUNQin4BrLOthgV7252N8V+FwY=",
        version = "v0.0.0-20190911185100-cd5d95a43a6e",
    )
    go_repository(
        name = "org_golang_x_sys",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/sys",
        sum = "h1:gG67DSER+11cZvqIMb8S8bt0vZtiN6xWYARwirrOSfE=",
        version = "v0.0.0-20210510120138-977fb7262007",
    )
    go_repository(
        name = "org_golang_x_term",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/term",
        sum = "h1:v+OssWQX+hTHEmOBgwxdZxK4zHq3yOs8F9J7mk0PY8E=",
        version = "v0.0.0-20201126162022-7de9c90e9dd1",
    )

    go_repository(
        name = "org_golang_x_text",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/text",
        sum = "h1:i6eZZ+zk0SOf0xgBpEpPD18qWcJda6q1sxt3S0kzyUQ=",
        version = "v0.3.5",
    )
    go_repository(
        name = "org_golang_x_tools",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/tools",
        sum = "h1:NXNmtp0ToD36cui5IqWy95LC4Y6vT/4y3RnPxlQPinU=",
        version = "v0.0.0-20200417140056-c07e33ef3290",
    )
    go_repository(
        name = "org_golang_x_xerrors",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/xerrors",
        sum = "h1:go1bK/D/BFZV2I8cIQd1NKEZ+0owSTG1fDTci4IqFcE=",
        version = "v0.0.0-20200804184101-5ec99f83aff1",
    )
