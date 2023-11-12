#!/bin/bash
#
# Describe all resources in a stack.
#
# Globals:
#   None
# Arguments:
#   Stack name
# Outputs:
#   None
#######################################
set -u
stack_name=$1

# "論理ID\t物理ID\tリソースタイプ" のリストを作成
readarray -t lid_pid_rtype_list < <(\
  aws cloudformation list-stack-resources \
    --stack-name "${stack_name}" \
    --query 'StackResourceSummaries[*].[LogicalResourceId,PhysicalResourceId,ResourceType]' \
    --output 'text' \
    --no-cli-pager \
)

for lid_pid_rtype in "${lid_pid_rtype_list[@]}"; do
  # "論理ID\t物理ID\tリソースタイプ" を分解
  set -- $lid_pid_rtype
  logical_resource_id=$1
  physical_resource_id=$2
  resource_type=$3

  # 各リソースの詳細を表示
  echo "${logical_resource_id} - ${resource_type}"
  aws cloudcontrol get-resource \
    --type-name "${resource_type}" \
    --identifier "${physical_resource_id}" \
    --query 'ResourceDescription.Properties' \
    --output 'yaml' \
    --no-cli-pager \
      | jq 'fromjson' \
      | jq -S 'walk(if type == "array" then sort else . end)' \
      | yq -P
  echo ''
done
