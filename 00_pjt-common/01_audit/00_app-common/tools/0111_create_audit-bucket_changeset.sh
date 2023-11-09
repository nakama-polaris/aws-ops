#!/bin/bash
set -eux

# スタックの存在確認
stack_exists=$( \
    aws cloudformation list-stacks \
        --stack-status-filter \
            CREATE_COMPLETE \
            UPDATE_COMPLETE \
            UPDATE_ROLLBACK_COMPLETE \
            IMPORT_COMPLETE \
            IMPORT_ROLLBACK_COMPLETE \
        --query "StackSummaries[?StackName=='${CFN_STACK_NAME}'].StackName" \
        --output text \
    )

# 変更セットの種類を決定
export CFN_CHANGE_SET_TYPE
if [ -n "${stack_exists}" ]; then
    CFN_CHANGE_SET_TYPE="UPDATE"
else
    CFN_CHANGE_SET_TYPE="CREATE"
fi

# 変更セットを作成
aws cloudformation create-change-set \
  --stack-name "${CFN_STACK_NAME}" \
  --change-set-name "${CFN_CHANGE_SET_NAME}" \
  --template-body "file:///${CFN_TEMPLATE_ABSOLUTE_PATH}" \
  --parameters "file:///${CFN_PARAMETER_ABSOLUTE_PATH}" \
  --change-set-type "${CFN_CHANGE_SET_TYPE}" \
  --capabilities CAPABILITY_NAMED_IAM