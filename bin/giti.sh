#!/usr/bin/env bash
#
# giti - *git* *i*ntelligence

# call parameters
__script_params=("$@")

if [[ "$OSTYPE" == "linux-gnu" ]] || [[ "$OSTYPE" == "linux-musl" ]] ; then
  # store name of the script and directory call
  readonly _init_name="$(basename "$0")"
  readonly _init_directory=$(dirname "$(readlink -f "$0" || echo "$(echo "$0" | sed -e 's,\\,/,g')")")
else
  printf '%s\n' "Unsupported system"
  exit 1
fi

# set root directory
readonly _rel="${_init_directory}/.."

# directories
readonly _lib="${_rel}/lib"

source "${_lib}/installer.sh"

readonly _mods="${_rel}/modules"

readonly _src="${_rel}/src"

source "${_src}/settings.sh"
source "${_src}/helpers.sh"

source "${_lib}/fetch.sh"
source "${_lib}/merge.sh"
source "${_lib}/pull.sh"
source "${_lib}/push.sh"
source "${_lib}/rebase.sh"

source "${_mods}/meh.sh"
source "${_mods}/nah.sh"
source "${_mods}/qmg.sh"
source "${_mods}/wip.sh"

source "${_src}/main.sh"

readonly VERSION="v0.1.1"

main "${__script_params[@]}"

exit 0
