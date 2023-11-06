# リリース手順

## セットアップ

```bash
# 環境変数の設定(共通)
source "$(git rev-parse --show-toplevel)/2_non-business/00_common/tools/general_settings.sh"

# 環境名の設定
export ENV=

# 環境変数の設定(スタック固有)
source "$(git rev-parse --show-toplevel)/2_non-business/01_audit/00_common/tools/0101_setup.sh" "${ENV}"
```

## 変更セットの作成

```bash
bash "$(git rev-parse --show-toplevel)/2_non-business/01_audit/00_common/tools/0111_create_audit-bucket_changeset.sh"
```

## 変更セットの確認

GUI

## 変更セットの実行

```bash
bash "$(git rev-parse --show-toplevel)/2_non-business/01_audit/00_common/tools/0112_execute_audit-bucket_changeset.sh"
```

## 変更セットの削除

```bash
bash "$(git rev-parse --show-toplevel)/2_non-business/01_audit/00_common/tools/0115_delete_audit-bucket_changeset.sh"
```

## スタックの削除

```bash
bash "$(git rev-parse --show-toplevel)/2_non-business/01_audit/00_common/tools/0191_delete_audit-bucket_stack.sh"
```