#!/bin/bash
# coding: utf-8
################################################################
# @@ScriptName: ssh_mail.sh
# @@Author: lsy <88919695@qq.com>
# @@Modify Date: 2014-05-29 22:06
# @@Description:
################################################################

ZABBIX_SER=192.168.5.66
ZABBIX_PORT=10051

local_ip=`ifconfig |grep "inet addr"|grep "192.168"|cut -d: -f2|cut -d" " -f1`
login_user=$USER
login_ip=${SSH_CLIENT%% *}
local_date=$(date +%F-%H:%M)

echo "$local_date" >>/var/log/zabbix/zabbix_sender.log
zabbix_sender -z $ZABBIX_SER -k user_login -o "$local_date $login_user login from $login_ip" -s "$local_ip" >>/var/log/zabbix/zabbix_sender.log

