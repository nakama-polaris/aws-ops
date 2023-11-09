#!/bin/bash
set -eux

# 変更セットを実行
aws cloudformation delete-change-set \
  --stack-name "${CFN_STACK_NAME}" \
  --change-set-name "${CFN_CHANGE_SET_NAME}"
