setup_centos7
============

CentOS7用 共通設定

# 使い方

## 1. kickstartでOSインストール

ks/[sv]da.ks を利用。
OSインストールが終わったら次へ。


## 2. ansibleインストール

rootでログイン。パスワードは先ほどのkickstartに書いてある。

    yum install -y git
    git clone https://github.com/tukiyo/setup_centos7.git
    cd ~/setup_centos7/first/
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

    cd ~/setup_centos7/lampp/
    ./run.sh

> もしCentOS6からの移行であれば、phpは5.3から5.4に上がります。
> [PHP: 下位互換性のない変更点 - Manual](http://php.net/manual/ja/migration54.incompatible.php)を参照のこと。
> remiリポジトリを追加していますのでphp5.5や5.6を入れられますが、
> 本番にはremiリポジトリのものを使わないこと。

設定ファイルは以下を利用。

* /etc/php.d/php_custom.ini
* /etc/my.cnf.d/my_custom.cnf


## 5. Zabbix Server, WebUI インストール

    cd ~/setup_centos7/zabbixserver/
    ./run.sh

* なおZabbix Server, WebUIが必要な場合以下を一読してから実行。
* [CentOS7にZabbix2.2をインストール - Qiita](http://qiita.com/tukiyo3/items/e974627fbb393037fa8a)
* mysql = root : パスワードなしを想定。
* Zabbixデータベース
  * user : pass = zabbix : zabbixpassword
* ZabbixWebUI URL = http://<IP>/zabbix
* ZabbixWebUI = Admin : zabbix
