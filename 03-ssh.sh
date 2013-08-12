#!/bin/sh -e

apt-get install openssh-server

cat >> /etc/ssh/sshd_config <<EOF

Match User philip
PasswordAuthentication no
EOF

cat /etc/ssh/sshd_config

service ssh restart
