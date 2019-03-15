#!/usr/bin/env bash
#
# rebase

rebase_usage() {
  cat << EOF
giti.sh rebase

Usage:
  giti.sh rb|rebase [-h|--help]

Options:
  -h|--help
          show this message

Examples:
  giti.sh rb -h
          display this message

  giti.sh rb
          git rebase

EOF
}

rebase_get_args() {
  if [[ -z $1 ]]; then
    rebase_usage
    exit 0
  fi

  local POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
    local key=$1

    case $key in
      -h|--help)
        rebase_usage
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

rebase_action() {
  git rebase "$@"
}

rebase_main() {
  rebase_get_args "$@"
  rebase_action "$@"
}
