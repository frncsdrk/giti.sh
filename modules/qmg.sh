#!/usr/bin/env bash
#
# qmg module

CURRENT_BRANCH=$BRANCH
DEST_BRANCH="master"
SOURCE_BRANCH=$CURRENT_BRANCH

CREATE_TAG_COMMIT=1
GIT_REMOTE=$REMOTE

mod_qmg_usage() {
  cat << EOF
giti.sh qmg

Usage:
  giti.sh qmg [-d|--destination <branch name>] [-s|--source <branch name>]
  [--skip-tag-commit] [-t|--tag <tag name>] [-r|--remote <remote name>]
  [-h|--help]

Options:
  -h|--help
          show this message

Examples:
  giti.sh qmg
          run module

  giti.sh qmg -h
          display this message

  giti.sh qmg -d master

  giti.sh qmg -d master -r origin

  giti.sh qmg -d master -r origin -s develop

  giti.sh qmg -t v0.1.0

  giti.sh qmg -t v0.1.0 --skip-tag-commit

EOF
}

mod_qmg_get_args() {
  local POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
    local key=$1

    case $key in
      -d|--destination)
        DEST_BRANCH=$2
        shift 2
        ;;
      -h|--help)
        mod_qmg_usage
        exit 0
        ;;
      -r|--remote)
        GIT_REMOTE=$2
        shift 2
        ;;
      -s|--source)
        SOURCE_BRANCH=$2
        shift 2
        ;;
      --skip-tag-commit)
        CREATE_TAG_COMMIT=0
        shift
        ;;
      -t|--tag)
        TAG_NAME=$2
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

mod_qmg_action() {
  mod_qmg_get_args "$@"

  if [[ ! -z "$TAG_NAME" ]]; then
    if [[ $CREATE_TAG_COMMIT -gt 0 ]]; then
      git commit -m "$TAG_NAME"
    fi

    git tag "$TAG_NAME"
    git push origin "$TAG_NAME"
  fi

  git checkout "$DEST_BRANCH"
  git merge "$SOURCE_BRANCH" --commit --no-edit
  git push origin "$DEST_BRANCH"
  git checkout "$SOURCE_BRANCH"
}
