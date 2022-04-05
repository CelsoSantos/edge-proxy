# edge-proxy

This repository contains a reference implementation of [Envoy's Exth Authz server](https://www.envoyproxy.io/docs/envoy/latest/intro/arch_overview/security/ext_authz_filter#arch-overview-ext-authz) and a set of utilities that you can (and should!) use when building your own ext authz servers.

## WARNINGS

There are currently a couple of issues on this repo which are being worked on...

- issue 1: bazel gazelle breaking the WORKSPACE (see [Issue 1](#issue-1))
- issue 2: building go_binary will result in multiple copies of package passed to linker (see [debug.log](debug.log))

---

## Requirements

- [Go](https://golang.org/) (v1.16.x)
- [Bazel](https://www.bazel.build/) (v3.7.2)
- [Docker & Docker-Compose](https://docs.docker.com/get-docker/)
- [Visual Studio Code](https://code.visualstudio.com/download)
- [Task](https://taskfile.dev/#/) (v3.3.0) (Already installed on the devcontainer)

---

## Devcontainer

This repo contains a [Devcontainer](https://code.visualstudio.com/docs/remote/containers) (particularly suited to Visual Studio Code Remote Development Plugin) which is a container ready to write Go code (including code-completions) and all the tools and plugins required to work with Go.

Additionally, the Devcontainer is linked to your host Docker daemon, meaning you can run and interact with additional containers on your system.
The Devcontainer configuration can be modified to include additional Docker containers or additional docker-compose files that must start with the Devcontainer.

Start by creating a `devcontainer.json` file inside your local `.devcontainer` directory. You can use the [`devcontainer.json.sample`](.devcontainer/devcontainer.json.sample) file to get started.

---

## Taskfile

This repo includes a Taskfile which includes all the targets required for both Development as well as building and releasing the Edge Proxy Plugins.

> :warning: **You SHOULD use `task` (included in the devcontainer) to perform most of the tasks required**

For detailed information regarding the use of `task` please refer to the original docs at [Task.dev](https://taskfile.dev/#/).

## Issues

### Issue 1

When running `task update-modules`, this will update the go modules, however, it will also produce a 4-line entry on the `WORKSPACE` that **MUST** be removed before continuing to run bazel commands. These inserted lines already exist elsewhere on the `WORKSPACE` The lines to remove are these and are inserted around lines 138-141:

```bazel
load("//:./bazel/private/repositories.bzl", "proxy_dependencies")

# gazelle:repository_macro ./bazel/private/repositories.bzl%proxy_dependencies
proxy_dependencies()
```

I have not yet been able to figure out why this is happening, but the solution is known.

### Issue 2

Any target that is dependent on `envoyproxy/go-control-plane` v3 API will fail to build.
To reproduce the issue, from within the devcontainer, see the output of the build of the `api` or `pkg/domains/clientcompany/auth` in the two different versions.
v2 builds work fine but v3 builds fail.

Here's the sample output of running the builds for `api/v2` and `api/v3`:


- v2 envoy API

```shell
$ bazel build //api/v2:api

WARNING: Download from https://mirror.bazel.build/github.com/googleapis/googleapis/archive/9acf39829240ef41f5adb762a29b87bc6eeee728.zip failed: class java.io.FileNotFoundException GET returned 404 Not Found
DEBUG: /root/.cache/bazel/_bazel_root/eab0d61a99b6696edb3d2aff87b585e8/external/bazel_gazelle/internal/go_repository.bzl:262:18: org_golang_x_net: gazelle: finding module path for import golang.org/x/sys/windows: finding module path for import golang.org/x/sys/windows: package golang.org/x/sys/windows: build constraints exclude all Go files in /root/.cache/bazel/_bazel_root/eab0d61a99b6696edb3d2aff87b585e8/external/bazel_gazelle_go_repository_cache/pkg/mod/golang.org/x/sys@v0.0.0-20220405052023-b1e9470b6e64/windows
gazelle: finding module path for import golang.org/x/sys/windows: finding module path for import golang.org/x/sys/windows: package golang.org/x/sys/windows: build constraints exclude all Go files in /root/.cache/bazel/_bazel_root/eab0d61a99b6696edb3d2aff87b585e8/external/bazel_gazelle_go_repository_cache/pkg/mod/golang.org/x/sys@v0.0.0-20220405052023-b1e9470b6e64/windows
gazelle: finding module path for import golang.org/x/sys/windows: finding module path for import golang.org/x/sys/windows: package golang.org/x/sys/windows: build constraints exclude all Go files in /root/.cache/bazel/_bazel_root/eab0d61a99b6696edb3d2aff87b585e8/external/bazel_gazelle_go_repository_cache/pkg/mod/golang.org/x/sys@v0.0.0-20220405052023-b1e9470b6e64/windows
WARNING: Download from https://mirror.bazel.build/github.com/golang/sys/archive/b874c991c1a50803422b257fb721b0b2dee3cf72.zip failed: class java.io.FileNotFoundException GET returned 404 Not Found
INFO: Analyzed target //api/v2:api (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
Target //api/v2:api up-to-date:
  bazel-bin/api/v2/api.a
INFO: Elapsed time: 0.584s, Critical Path: 0.01s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
```

- v3 envoy API

```shell
$ bazel build //api/v3:api

ERROR: /workspace/api/v3/BUILD.bazel:5:11: no such package '@com_github_envoyproxy_go_control_plane//envoy/service/auth/v3': BUILD file not found in directory 'envoy/service/auth/v3' of external repository @com_github_envoyproxy_go_control_plane. Add a BUILD file to a directory to mark it as a package. and referenced by '//api/v3:api'
ERROR: Analysis of target '//api/v3:api' failed; build aborted: Analysis failed
INFO: Elapsed time: 0.446s
INFO: 0 processes.
FAILED: Build did NOT complete successfully (0 packages loaded, 0 targets configured)
```
