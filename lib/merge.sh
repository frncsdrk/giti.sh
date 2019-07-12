#!/usr/bin/env bash
#
# merge

merge_usage() {
  cat << EOF
giti.sh merge

Usage:
  giti.sh m|merge [-h|--help]

Options:
  -h|--help
          show this message

Examples:
  giti.sh m -h
          display this message

  giti.sh m
          git merge

EOF
}

merge_get_args() {
  if [[ -z $1 ]]; then
    merge_usage
    exit 0
  fi

  local POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
    local key=$1

    case $key in
      -h|--help)
        merge_usage
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

merge_action() {
  git merge "$@"
}

merge_main() {
  merge_get_args "$@"
  merge_action "$@"
}
