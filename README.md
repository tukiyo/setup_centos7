centos7setup
============

centos7用当り障りのない共通設定

# 使い方

## 1. kickstartでOSインストール

ks/[sv]da.ks を利用。
OSインストールが終わったら次へ。

## 2. ansibleインストール

rootでログイン。パスワードは先ほどのkickstartに書いてある。

    yum install git
    git clone https://github.com/tukiyo/centos7setup.git
    cd centos7setup/1_install_ansible_remi
    ./run.sh
