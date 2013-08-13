#!/bin/sh -e

apt-get install openssh-server

cat >> /etc/ssh/sshd_config <<EOF

Match User philip
PasswordAuthentication no
EOF

cat /etc/ssh/sshd_config

cat > /etc/ssh/sshrc <<"EOF"
IP="$(echo $SSH_CONNECTION | awk '{print $1}')"
KNOWN_IPS="$HOME/.ssh/known_ips"
if ! grep -Fqsx $IP $KNOWN_IPS; then
  echo $IP >> $KNOWN_IPS
  echo "$IP added to $KNOWN_IPS" | \
    mail -s "ssh $USER@$(hostname) from $IP" philip@foolip.org
fi
EOF

cat /etc/ssh/sshrc

service ssh restart
