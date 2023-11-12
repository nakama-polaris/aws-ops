#!/bin/bash -x
#
# Get Resource Information from the inputs

# declare global variable
declare -r GIT_ROOT_ABSOLITE_PATH="$(git rev-parse --show-toplevel)"
declare -r SCRIPT_ABSOLUTE_PATH="${GIT_ROOT_ABSOLITE_PATH}/scripts"
declare -r DESTINATION_RELATIVE_PATH="_local/result/000102"

#######################################
# Get Resource Information from the input array
#
# Globals:
#   None
# Arguments:
#   array of (resource identifier, resource type)
# Outputs:
#   None
#######################################
function get_resources_info() {
  local -a rid_rtype_list_array
  readarray -t rid_rtype_list_array < <(echo -e "${1}")
  local resource_identifier
  local resource_type
  for rid_rtype in "${rid_rtype_list_array[@]}"; do
    rid_rtype="$(echo "${rid_rtype}" | tr -d "'")"
    echo "${rid_rtype}"
    set -- ${rid_rtype}
    resource_identifier="$1"
    resource_type="$2"
    # . "${SCRIPT_ABSOLUTE_PATH}/utils/get_resource.sh" "${resource_identifier}" "${resource_type}"
  done
}

function main() {
  local rid_rtype_list_str="$1"
  # rid_rtype_list="$(cat "$1")"
  # # while read -r line; do
  # #   rid_rtype_list="${rid_rtype_list}\n${line}"
  # # done < "$1"
  # echo "rid_rtype_list: \n${rid_rtype_list}"
  get_resources_info "${rid_rtype_list_str}"
}

main "$@" | tee "${GIT_ROOT_ABSOLITE_PATH}/${DESTINATION_RELATIVE_PATH}/manual.log"
