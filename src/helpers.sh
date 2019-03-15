#!/usr/bin/env bash
#
# helpers

usage() {
  cat << EOF
giti.sh

Usage:
  giti.sh [-h|--help] [-v|--version]
    f|fetch|pl|pull|ph|push

  giti.sh up|upgrade

Options:
  -h|--help
          show this message

  -v|--version
          version

Commands:
  f|fetch
          git fetch

  m|merge
          git merge

  pl|pull
          git pull

  ph|push
          git push

  rb|rebase
          git rebase

  up|upgrade
          upgrade giti.sh

Modules:
  meh
          git reset HEAD

  nah
          git reset HEAD --hard

  qmg
          quick merge current branch into another branch with the option to add a tag beforehand

  wip
          git add -A && git commit -m "WIP"

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
      f|fetch)
        shift
        fetch_main "$@"
        exit 0
        ;;
      m|merge)
        shift
        merge_main "$@"
        exit 0
        ;;
      pl|pull)
        shift
        pull_main "$@"
        exit 0
        ;;
      ph|push)
        shift
        push_main "$@"
        exit 0
        ;;
      rb|rebase)
        shift
        rebase_main "$@"
        exit 0
        ;;
      meh)
        mod_meh_action "$@"
        exit 0
        ;;
      nah)
        mod_nah_action "$@"
        exit 0
        ;;
      qmg)
        mod_qmg_action "$@"
        exit 0
        ;;
      wip)
        mod_wip_action "$@"
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
