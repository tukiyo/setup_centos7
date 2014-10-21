centos7setup
============

CentOS7用 共通設定

# 使い方

## 1. kickstartでOSインストール

ks/[sv]da.ks を利用。
OSインストールが終わったら次へ。

## 2. ansibleインストール

rootでログイン。パスワードは先ほどのkickstartに書いてある。

    yum install -y git
    git clone https://github.com/tukiyo/centos7setup.git
    cd centos7setup/1_install_ansible_remi/
    ./run.sh
    # 10分くらいかかるので待つ。

終わったらOSを再起動。
kernel のバージョンが 2014/10/21 では 3.10.0-123.8.1 になった。

## 3. ネットワーク設定

### IP固定

* /etc/sysconfig/network-scripts/ifcfg-eth0 を編集。
  * templates/ifcfg-eth0 を参考。
* 設定反映
  * systemctl restart network

### IPv6無効

IPv6が有効だと名前解決の速度が下がるため無効にする。

* /etc/sysctl.conf を編集
  * templates/sysctl.conf を参考。
* 設定反映
  * sysctl -p
* 確認
  * sysctl -a | grep disable_ipv6
  * ip a コマンドで ipv6の項目がなくなっていることでも確認ができる。
