#!/usr/bin/env bash
#
# download script for giti.sh

INSTALL_DIRECTORY_PATH="/opt"

source "./src/settings.sh"

download() {
  if [[ ! -d /tmp ]] ; then
    mkdir /tmp
  fi

  cd /tmp

  if [[ ! -x "$(command -v wget)" ]]; then
    printf '%s\n' "please install wget to download ${INSTALLABLE_NAME}"
  fi

  if [[ ! -d "${INSTALLABLE_NAME}" ]]; then
    mkdir "${INSTALLABLE_NAME}"
  fi

  local TAR_TARGET="${INSTALLABLE_NAME}.tar.gz"
  wget -q "${DOWNLOAD_URL}" -O "${TAR_TARGET}"
  tar -xzf "${TAR_TARGET}"
  rm "${TAR_TARGET}"

  printf '%s\n' "installing to ${INSTALL_DIRECTORY_PATH}"
  
  if [[ ! -d "${INSTALL_DIRECTORY_PATH}" ]]; then
    mkdir -p "${INSTALL_DIRECTORY_PATH}"
  fi

  if [[ -d "${INSTALL_DIRECTORY_PATH}/${INSTALLABLE_NAME}" ]]; then
    rm -r "${INSTALL_DIRECTORY_PATH}/${INSTALLABLE_NAME}"
  fi
  mv "${EXTRACTED_DIR_NAME}" "${INSTALL_DIRECTORY_PATH}/${INSTALLABLE_NAME}"

  cd "${INSTALL_DIRECTORY_PATH}/${INSTALLABLE_NAME}"
  ./setup.sh i

  printf '%s\n' "DONE"
}

main() {
  download
}

main "$@"
exit 0
