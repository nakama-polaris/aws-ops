# aws-ops

## 概要

AWSの実運用を想定したリポジトリ

## 思想

### 用語集

#### Project

プロジェクト

#### Function

プロジェクトスコープ内の機能  
要求単位

#### Application

機能を実現するためのアプリケーション
アプリケーション単位

#### Product

プロダクト(≠Project)

#### Environment

環境

#### Code

コード

### ディレクトリの切り方

- トップレベルからのパスは、 `XX_Project/YY_Function/ZZ_Application` を基本とする。
- `XX`, `YY`, `ZZ` それぞれ `00` は `pjt-common`, `fnc-common`, `app-common` とする。

### リソース配置の考え方

特定のPJに所属する想定のリソースか？ -No-> `00_pjt-common` 
↓ Yes
特定の機能に所属する想定のリソースか？ -No-> `00_fnc-common`
↓ Yes
特定のアプリケーションに所属するリソースか？ -No-> `00_app-common`

## 構成

### 00_pjt-common

全プロジェクト共通となる前提のコンテンツを格納する
例)
- Trailの設定
- Costの確認

### 01_sample-pjt

サンプルプロジェクトのコンテンツを格納する

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
