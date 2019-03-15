#!/usr/bin/env bash
#
# nah module

mod_nah_usage() {
  cat << EOF
giti.sh nah

Usage:
  giti.sh nah

Options:
  -h|--help
          show this message

Examples:
  giti.sh nah
          run module

EOF
}

mod_nah_get_args() {
  local POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
    local key=$1

    case $key in
      -h|--help)
        mod_nah_usage
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

mod_nah_action() {
  mod_nah_get_args "$@"
  git reset HEAD --hard
}
