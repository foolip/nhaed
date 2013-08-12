#!/bin/sh -e

apt-get install sysstat
echo 'ENABLED="true"' > /etc/default/sysstat
service sysstat restart
