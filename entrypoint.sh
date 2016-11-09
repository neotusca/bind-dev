#!/bin/sh

UUID_FULL=`grep secrets /proc/1/mountinfo | awk -F'/' '{print $6}'`
UUID=${UUID_FULL:0:12}


echo "sed -e 's/\/data\/named/\/data\/named\/"$UUID"/'  /etc/named/named.conf > /etc/named/named-"$UUID".conf" > named-conf-change.sh
chmod +x named-conf-change.sh
./named-conf-change.sh

mkdir /data/named/$UUID
mkdir /data/named/$UUID/log  /data/named/$UUID/syslog
chown -R named:named /data/named/$UUID

#/usr/sbin/named -c /etc/named/named-$UUID.conf -g -u named
/usr/sbin/named -c /etc/named/named-$UUID.conf -f -u named
