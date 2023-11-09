#!/bin/bash
set -eux

# 変更セットを実行
aws cloudformation delete-stack \
  --stack-name "${CFN_STACK_NAME}"

