#!/bin/sh -e

apt-get install git
git clone --recursive https://github.com/foolip/nhaed.git /home/philip/www
chown --recursive philip:philip /home/philip/www

apt-get install nginx-light
echo "include /home/philip/www/.nginx.conf;" > /etc/nginx/sites-available/default
service nginx restart
