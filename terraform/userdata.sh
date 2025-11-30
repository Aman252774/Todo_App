#!/bin/bash
apt-get update -y
apt-get install -y git curl nginx build-essential

curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

npm install -g pm2

mkdir -p /home/ubuntu/todo_app_main
chown -R ubuntu:ubuntu /home/ubuntu/todo_app_main

systemctl enable nginx
systemctl start nginx
