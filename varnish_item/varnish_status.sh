#!/bin/bash  
###################################  
#zabbix monitoring script
#available from varnishstat
###################################
#date:20131217  by lsy

#zabbix item name
ITEM_NAME="$1"

#error info
ERROR_WRONG_PARAM="-0.9900"
ERROR_DATA="-0.9901"

VARNISH_ITEM=`/usr/local/varnish/bin/varnishstat -1 -f $ITEM_NAME|awk '{print $2}'`

if [ $? -ne 0 -o -z "$VARNISH_ITEM" ]; then
	echo $ERROR_DATA
	exit 1
fi
echo $VARNISH_ITEM
exit 0