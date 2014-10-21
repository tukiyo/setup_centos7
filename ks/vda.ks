# インストールCDは以下を利用する。
# http://ftp.tsukuba.wide.ad.jp/Linux/centos/7/isos/x86_64/CentOS-7.0-1406-x86_64-Minimal.iso

# Esc押して
# linux text ks=http://<serverip>:<port>/vda.ks
# kickstart manual: http://goo.gl/2O7dlM

auth --enableshadow --passalgo=sha512

cdrom
text
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=vda
keyboard --vckeymap=jp106 --xlayouts='jp106'
lang en_US.UTF-8
firewall --disabled
selinux --disabled

# Network information
network --noipv4 --noipv6
network --hostname=localhost.localdomain

#root の password はインストール後必ず変更と、アカウントロックすること！！
#rootpw --lock
rootpw --plaintext AiviaT5d

skipx
timezone Asia/Tokyo --isUtc
# System bootloader configuration
bootloader --location=mbr --boot-drive=vda
#autopart --type=plain #xfs
#autopart --type=ext4
# Partition clearing information
clearpart --all --initlabel --drives=vda
part / --fstype=xfs --grow --asprimary --size=1
part swap --fstype=swap --size=2048
reboot

%packages
@core
%end

%pre
%end

%post
%end
