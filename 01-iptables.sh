#!/bin/sh -e

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport ssh -j ACCEPT
iptables -A INPUT -p tcp --dport http -j ACCEPT
iptables -A INPUT -p tcp --dport 8731 -j ACCEPT # html-mirror
iptables -A INPUT -p icmp -j ACCEPT
iptables -P INPUT DROP

apt-get install iptables-persistent
cat /etc/iptables/rules.*
