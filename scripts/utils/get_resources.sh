#!/bin/bash -x
#
# Get Resource Information from the inputs

# declare global variable
declare -r GIT_ROOT_ABSOLITE_PATH="$(git rev-parse --show-toplevel)"
declare -r SCRIPT_ABSOLUTE_PATH="${GIT_ROOT_ABSOLITE_PATH}/scripts"
# declare -r DESTINATION_RELATIVE_PATH="_local/result/000102"

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
  local -a lid_pid_rtype_array
  readarray -t lid_pid_rtype_array < <(echo -e "${1}")
  for lid_pid_rtype in "${lid_pid_rtype_array[@]}"; do
    # "論理ID\t物理ID\tリソースタイプ" を分解
    set -- $lid_pid_rtype
    local logical_resource_id="$1"
    local physical_resource_id="$2"
    local resource_type="$3"
    echo "---"
    echo -e "Logical_Resouce_ID \t Physical_Resource_ID \t Resource_Type"
    echo -e "${logical_resource_id} \t ${physical_resource_id} \t ${resource_type}"
    . "${SCRIPT_ABSOLUTE_PATH}/utils/get_resource.sh" "${physical_resource_id}" "${resource_type}"
  done
}

function main() {
  local lid_pid_rtype_str="$1"
  get_resources_info "${lid_pid_rtype_str}"
}

main "$@"
