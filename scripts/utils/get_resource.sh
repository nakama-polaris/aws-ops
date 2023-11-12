#!/bin/bash
#
# Get Resource Information from the inputs
#
# Globals:
#   None
# Arguments:
#   - resource_identifier resource_type
#     ex: "sample-table AWS::DynamoDB::Table"
# Outputs:
#   None
#######################################

set -u

#######################################
# Get Resource Information from the inputs
#
# Globals:
#   None
# Arguments:
#   resource identifier
#   resource type
# Outputs:
#   None
#######################################
function get_resource_info() {
  local -r resource_identifier="$1"
  local -r resource_type="$2"
  aws cloudcontrol get-resource \
    --identifier "${resource_identifier}" \
    --type-name "${resource_type}" \
    --query 'ResourceDescription.Properties' \
    --output 'yaml' \
    --no-cli-pager \
      | jq 'fromjson' \
      | jq -S 'walk(if type == "array" then sort else . end)' \
      | yq -P
  echo ''
}

function main() {
    get_resource_info "$@"
}

main "$@"