#!/bin/sh -e

apt-get install unattended-upgrades
dpkg-reconfigure unattended-upgrades
cat >> /etc/apt/apt.conf.d/50unattended-upgrades <<EOF

Unattended-Upgrade::Mail "root";
Unattended-Upgrade::Automatic-Reboot "true";
EOF

cat /etc/apt/apt.conf.d/50unattended-upgrades
