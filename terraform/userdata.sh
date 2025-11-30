#!/bin/bash

# Update & Install essentials
apt-get update -y
apt-get install -y git curl nginx build-essential

# Install Node.js 18
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

# Install PM2 globally
npm install -g pm2

# Create project directory for ubuntu user
mkdir -p /home/ubuntu/todo_app_main
chown -R ubuntu:ubuntu /home/ubuntu/todo_app_main
chmod -R 775 /home/ubuntu/todo_app_main

# Enable Nginx
systemctl enable nginx
systemctl start nginx
