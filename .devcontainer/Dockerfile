###############################################################################
# .devcontainer/Dockerfile.go                                                 #
#                                                                             #
# Description: Docker image used by VSCode for building a Golang development  #
#              sandbox.                                                       #
# See:         https://code.visualstudio.com/docs/remote/containers           #
###############################################################################


# -----------------------------------------------------------------------------
# BUILD-TIME VARIABLES
#
# Unfortunately, build-time arguments cannot be given in the devcontainer.json 
# file. This feature will certainly be available soon... so let's be prepared.
# -----------------------------------------------------------------------------

ARG USE_BAZEL_VERSION=5.0.0
ARG ARG_TASK_VERSION=3.3.0
ARG SOPS_VERSION=3.6.1

# -----------------------------------------------------------------------------
# SANDBOX STAGE
# -----------------------------------------------------------------------------
# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.195.0/containers/go/.devcontainer/base.Dockerfile
# [Choice] Go version (use -bullseye variants on local arm64/Apple Silicon): 1, 1.16, 1.17, 1-bullseye, 1.16-bullseye, 1.17-bullseye, 1-buster, 1.16-buster, 1.17-buster
ARG VARIANT=1.16
FROM mcr.microsoft.com/vscode/devcontainers/go:0-${VARIANT}

# FROM golang:1.16-stretch

ARG USE_BAZEL_VERSION
ARG ARG_TASK_VERSION
ARG SOPS_VERSION

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive
ENV KEY_HERE=${KEY_HERE}

# Configure APT, install packages and tools
RUN apt-get update \
  && apt-get install -y \
  build-essential \
  apt-utils \
  bash-completion \
  curl \
  g++ \
  git \
  lsb-release \
  patch \
  procps \
  unzip \
  zlib1g-dev \
  libunwind-dev \
  apt-transport-https \
  ca-certificates \
  gnupg2
#
# Install Bazel
RUN curl -LO "https://github.com/bazelbuild/bazel/releases/download/${USE_BAZEL_VERSION}/bazel_${USE_BAZEL_VERSION}-linux-x86_64.deb" \
  && dpkg -i bazel_*.deb \
  && rm -rf bazel_*.deb
#
# Install Docker CE CLI
RUN curl -fsSL https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | apt-key add - 2>/dev/null \
  && echo "deb [arch=amd64] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list \
  && apt-get update \
  && apt-get install -y docker-ce-cli
#
# Install Docker Compose
RUN apt-get install -y docker-compose
#
# Install kubectl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
  && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
  && apt-get update \
  && apt-get install -y kubectl
#
# Install Task
# For Installation To /usr/local/bin for userwide access with debug logging
RUN curl -sL "https://github.com/go-task/task/releases/download/v${ARG_TASK_VERSION}/task_linux_amd64.tar.gz" -o /tmp/task.tgz \
  && tar zxf /tmp/task.tgz -C /usr/local/bin/
#
# Install SOPS
RUN curl -sSL -o /usr/local/bin/sops https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux \
  && chmod +x /usr/local/bin/sops
#
# Install jq
RUN apt-get install -y jq
#
# Install various Go tools
# RUN export GO111MODULE=on \
RUN go get -u -v \
  github.com/bazelbuild/buildtools/buildifier \
  github.com/bazelbuild/bazel-gazelle/cmd/gazelle \
  github.com/cweill/gotests/... \
  github.com/sqs/goreturns \
  github.com/josharian/impl \
  github.com/davidrjenni/reftools/cmd/fillstruct \
  github.com/acroca/go-symbols \
  github.com/godoctor/godoctor \
  github.com/rogpeppe/godef \
  github.com/zmb3/gogetdoc \
  github.com/fatih/gomodifytags
#
# golangci-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/local/bin 2>&1
#
# Clean up
RUN apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*
