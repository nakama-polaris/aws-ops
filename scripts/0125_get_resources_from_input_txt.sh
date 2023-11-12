#!/bin/bash -x

declare -r GIT_ROOT_ABSOLITE_PATH="$(git rev-parse --show-toplevel)"
declare -r SCRIPT_ABSOLUTE_PATH="${GIT_ROOT_ABSOLITE_PATH}/scripts"
declare -r DESTINATION_RELATIVE_PATH="_local/result/000102"

function main() {
  local input_file="$1"
  local rid_rtype_list="$(cat "${input_file}")"
  . "${SCRIPT_ABSOLUTE_PATH}/utils/get_resources.sh" "${rid_rtype_list}"
}

main "$@" | tee "${GIT_ROOT_ABSOLITE_PATH}/${DESTINATION_RELATIVE_PATH}/manual.log"
