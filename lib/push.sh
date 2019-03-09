#!/usr/bin/env bash
#
# push

push_usage() {
  cat << EOF
giti.sh push

Usage:
  giti.sh ph|push [-h|--help]

Options:
  b|branch <branch name>
          select branch

  -h|--help
          show this message

  r|remote <remote name>
          select remote

Examples:
  giti.sh -h
          display this message

  giti.sh ph r gh b feature/x
          push to specific remote and branch

EOF
}

push_get_args() {
  if [[ -z $1 ]]; then
    push_usage
    exit 0
  fi

  local POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
    local key=$1

    case $key in
      b|branch)
        BRANCH=$2
        shift 2
        ;;
      -h|--help)
        push_usage
        exit 0
        ;;
      r|remote)
        REMOTE=$2
        shift 2
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

push_action() {
  git push "$REMOTE" "$BRANCH"
}

push_main() {
  push_get_args "$@"
  push_action
}
