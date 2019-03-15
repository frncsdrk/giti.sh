#!/usr/bin/env bash
#
# pull

pull_usage() {
  cat << EOF
giti.sh pull

Usage:
  giti.sh pl|pull [-h|--help]

Options:
  -b|--branch <branch name>
          select branch

  -h|--help
          show this message

  -r|--remote <remote name>
          select remote

Examples:
  giti.sh -h
          display this message

  giti.sh pl r gh b feature/x
          pull from specific remote and branch

EOF
}

pull_get_args() {
  if [[ -z $1 ]]; then
    pull_usage
    exit 0
  fi

  local POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
    local key=$1

    case $key in
      -b|--branch)
        BRANCH=$2
        shift 2
        ;;
      -h|--help)
        pull_usage
        exit 0
        ;;
      -r|--remote)
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

pull_action() {
  git pull "$REMOTE" "$BRANCH" "$@"
}

pull_main() {
  pull_get_args "$@"
  pull_action "$@"
}
