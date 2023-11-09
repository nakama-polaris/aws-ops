#!/bin/bash

## ユーザ設定値
# プロダクト名
export CFN_PRODUCT="allpdt"
# 環境名
export CFN_ENVIRONMENT="$1"
# 機能コード
export CFN_CODE="000001"
# テンプレートファイル名(拡張子抜き)
export CFN_TEMPLATE_NAME="s3-access-log-bucket"


## 自動設定値
# スタック名
export CFN_STACK_NAME="${CFN_PRODUCT}-${CFN_ENVIRONMENT}-${CFN_CODE}-${CFN_TEMPLATE_NAME}-stack"

# 変更セット名(実行時のコミットID)
export CFN_CHANGE_SET_NAME="commit-$(git show --format='%h' --no-patch)"

# テンプレートファイル名
export CFN_TEMPLATE_FILE="${CFN_PRODUCT}/${CFN_ENVIRONMENT}/${CFN_CODE}/${CFN_TEMPLATE_NAME}.yaml"

# パラメータファイル名
export CFN_PARAMETER_FILE="${CFN_PRODUCT}/${CFN_ENVIRONMENT}/${CFN_CODE}/${CFN_TEMPLATE_NAME}.parameters.json"

# リポジトリのディレクトリの絶対パス
export CFN_REPOSITORY_ABSOLUTE_PATH="$(git rev-parse --show-toplevel)"

# リポジトリ以降テンプレートファイルまでのパス
export CFN_FILE_PREFIX=$(find "${CFN_REPOSITORY_ABSOLUTE_PATH}" -path "*${CFN_TEMPLATE_FILE}")

# テンプレートの絶対パス
export CFN_TEMPLATE_ABSOLUTE_PATH=$(find "${CFN_REPOSITORY_ABSOLUTE_PATH}" -path "*${CFN_TEMPLATE_FILE}")

# パラメータの絶対パス
export CFN_PARAMETER_ABSOLUTE_PATH=$(find "${CFN_REPOSITORY_ABSOLUTE_PATH}" -path "*${CFN_PARAMETER_FILE}")

## 設定結果の出力
env | grep CFN_ | sort