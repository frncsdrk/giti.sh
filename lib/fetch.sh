#!/usr/bin/env bash
#
# fetch

fetch_usage() {
  cat << EOF
giti.sh fetch

Usage:
  giti.sh f|fetch [a|all] [-h|--help]

Options:
  -h|--help
          show this message

Examples:
  giti.sh -h
          display this message

  giti.sh f
          git fetch

  giti.sh fa
          git fetch --all

EOF
}

fetch_get_args() {
  if [[ -z $1 ]]; then
    fetch_usage
    exit 0
  fi

  local POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
    local key=$1

    case $key in
      a|all)
        fetch_all_action "$@"
        exit 0
        ;;
      -h|--help)
        fetch_usage
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

fetch_action() {
  git fetch
}

fetch_all_action() {
  git fetch --all
}

fetch_main() {
  fetch_get_args "$@"
  fetch_action
}
