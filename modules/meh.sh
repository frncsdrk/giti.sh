#!/usr/bin/env bash
#
# meh module

mod_meh_usage() {
  cat << EOF
giti.sh meh

Usage:
  giti.sh meh

Options:
  -h|--help
          show this message

Examples:
  giti.sh meh
          run module

EOF
}

mod_meh_get_args() {
  local POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
    local key=$1

    case $key in
      -h|--help)
        mod_meh_usage
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

mod_meh_action() {
  mod_meh_get_args "$@"
  git reset HEAD
}
