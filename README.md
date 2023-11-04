# aws-ops

## 概要

AWSの実運用を想定したリポジトリ

## 構成

### business

主にビジネス利用されるアプリケーションに関わるコンテンツを格納する

### non-business

主にビジネスに直接関わらないが、運用のために必要なコンテンツを格納する

### .devcontainer

開発用コンテナ
基本的にbusyboxをカスタマイズしてがんばる
必要に応じてDockerimageを切り替えることで特定用途のDevContainerを起動する

### .vscode

vscode関連のファイル
必要なExtensionなどの設定はルート直下に全部入れる。

### _local

gitignoreで無視しているディレクトリ
手元でなにか動かしたいがgit管理したくない場合にローカルでディレクトリ作成して利用する。
