#!/usr/bin/env bash
#
# wip module

mod_wip_usage() {
  cat << EOF
giti.sh wip

Usage:
  giti.sh wip

Options:
  -h|--help
          show this message

Examples:
  giti.sh wip
          run module

EOF
}

mod_wip_get_args() {
  local POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
    local key=$1

    case $key in
      -h|--help)
        mod_wip_usage
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

mod_wip_action() {
  mod_wip_get_args "$@"
  git add -A && git commit -m "WIP"
}
