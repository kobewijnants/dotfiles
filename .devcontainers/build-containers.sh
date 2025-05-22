#!/bin/bash

distro=$1

if [ -z "$distro" ]; then
    docker build -t dev-ubuntu ~/.devcontainers -f ~/.devcontainers/ubuntu.Dockerfile
    docker build -t dev-debian ~/.devcontainers -f ~/.devcontainers/debian.Dockerfile
    docker build -t dev-alpine ~/.devcontainers -f ~/.devcontainers/alpine.Dockerfile
    docker build -t dev-arch ~/.devcontainers -f ~/.devcontainers/arch.Dockerfile
    docker build -t dev-fedora ~/.devcontainers -f ~/.devcontainers/fedora.Dockerfile
    docker build -t dev-opensuse-leap ~/.devcontainers -f ~/.devcontainers/opensuse-leap.Dockerfile
    docker build -t dev-opensuse-tumbleweed ~/.devcontainers -f ~/.devcontainers/opensuse-tumbleweed.Dockerfile
    exit 0
else
    docker build -t dev-$distro ~/.devcontainers -f ~/.devcontainers/$distro.Dockerfile
fi
