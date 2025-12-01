#!/bin/bash
exec > /var/log/userdata.log 2>&1

# Update packages
apt-get update -y
apt-get install -y git curl nginx build-essential

# Install Node.js 18
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

# Ensure npm path (just in case)
export PATH=$PATH:/usr/bin:/usr/local/bin

# Install PM2
npm install -g pm2

# Create project directory
mkdir -p /home/ubuntu/todo_app_main
chown -R ubuntu:ubuntu /home/ubuntu/todo_app_main

# Start nginx
systemctl enable nginx
systemctl restart nginx

