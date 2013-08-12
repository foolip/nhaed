#!/bin/sh -e

echo "root: philip" >> /etc/aliases
echo "$(hostname)" > /etc/mailname
sed -i "s/^\(dc_eximconfig_configtype\)=.*/\1='internet'/;s/^\(dc_other_hostnames\)=.*/\1='$(hostname)'/" /etc/exim4/update-exim4.conf.conf
update-exim4.conf
service exim4 restart
echo philip@foolip.org > ~philip/.forward
chown philip:philip ~philip/.forward
echo | mail -s "$(hostname) test mail" root
