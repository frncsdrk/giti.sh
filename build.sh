#!/usr/bin/env bash
#
# build script for docker image

IMAGE_NAME="giti.sh"

docker build -t "${IMAGE_NAME}" . "$@"
