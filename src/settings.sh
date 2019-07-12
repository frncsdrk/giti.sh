#!/usr/bin/env bash
#
# settings

INSTALLABLE_NAME="giti.sh"
INSTALL_DIRECTORY_PATH="/opt"
DOWNLOAD_URL="https://github.com/frncsdrk/${INSTALLABLE_NAME}/archive/master.tar.gz"
EXTRACTED_DIR_NAME="${INSTALLABLE_NAME}-master"

REMOTE="origin"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
