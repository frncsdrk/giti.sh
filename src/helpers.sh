#!/usr/bin/env bash
#
# helpers

usage() {
  cat << EOF
giti.sh

Usage:
  giti.sh [-h|--help] [-v|--version]

  giti.sh up|upgrade

Options:
  -h|--help
          show this message

  -v|--version
          version

  pl|pull
          git pull

  up|upgrade
          upgrade giti.sh

Examples:
  giti.sh -h
          display this message

  giti.sh -v
          display version

  giti.sh upgrade
          upgrade giti.sh to latest version

EOF
}

get_args() {
  if [[ -z $1 ]]; then
    usage
    exit 0
  fi

  local POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
    local key=$1

    case $key in
      -h|--help)
        usage
        exit 0
        ;;
      -v|--version)
        printf '%s\n' "$VERSION"
        exit 0
        ;;
      pl|pull)
        pull_main "$@"
        exit 0
        ;;
      up|upgrade)
        upgrade
        exit 0
        ;;
      *)
        # get operator
        if [[ $1 =~ ^.+@.+$ ]]; then
          OPERATOR="$1"
        fi
        POSITIONAL+=("$1")
        shift
        ;;
    esac
  done
  set -- "${POSITIONAL[@]}"
}
