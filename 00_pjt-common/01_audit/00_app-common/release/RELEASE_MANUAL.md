# リリース手順

## セットアップ

```bash
# 環境変数の設定(共通)
source "$(git rev-parse --show-toplevel)/00_pjt-common/tools/0100_general_setup.sh"

# 環境名の設定
export ENV=

# 環境変数の設定(スタック固有)
source "$(git rev-parse --show-toplevel)/00_pjt-common/01_audit/00_app-common/tools/0101_setup.sh" "${ENV}"
```

## 変更セットの作成

```bash
bash "$(git rev-parse --show-toplevel)/00_pjt-common/tools/0111_create_changeset.sh"
```

## 変更セットの確認

GUI

## 変更セットの実行

```bash
bash "$(git rev-parse --show-toplevel)/00_pjt-common/tools/0112_execute_changeset.sh"
```

## 変更セットの削除

```bash
bash "$(git rev-parse --show-toplevel)/00_pjt-common/tools/0115_delete_changeset.sh"
```

## スタックの削除

```bash
bash "$(git rev-parse --show-toplevel)/00_pjt-common/tools/0191_delete_stack.sh"
```