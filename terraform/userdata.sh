#!/bin/bash

# Run everything as root
exec > /var/log/userdata.log 2>&1

apt-get update -y
apt-get install -y git curl nginx build-essential

# Install Node 18 safely
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
apt-get install -y nodejs

# Install PM2
npm install -g pm2

# Create project directory
mkdir -p /home/ubuntu/todo_app_main
chown -R ubuntu:ubuntu /home/ubuntu/todo_app_main

# Start nginx
systemctl enable nginx
systemctl restart nginx

