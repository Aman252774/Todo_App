#!/bin/bash
# Ye script EC2 ke boot hone ke time chalti hai.

apt-get update -y
apt-get install -y git curl nginx build-essential

# Install Node.js LTS
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

# PM2 globally install
npm install -g pm2

# Project directory create
mkdir -p /var/www/todo_app-main
chown -R ubuntu:ubuntu /var/www/todo_app-main

systemctl enable nginx
systemctl start nginx
