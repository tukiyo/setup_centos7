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

* 終わったらOSを再起動。2014/10/21 で kernel 3.10.0-123.8.1 になった。


## 3. ネットワーク設定

### IP固定

* /etc/sysconfig/network-scripts/ifcfg-eth0 を編集。
  * templates/ifcfg-eth0 を参考。
* 設定反映
  * systemctl restart network

## 4. LAMP環境

    cd centos7setup/lampp/
    ./run.sh

もしCentOS6からの移行であれば、phpは5.3から5.4に上がります。
[PHP: 下位互換性のない変更点 - Manual](http://php.net/manual/ja/migration54.incompatible.php)を参照のこと。
remiリポジトリを追加していますのでphp5.5や5.6を入れられますが、
本番にはremiリポジトリのものを使わないこと。
