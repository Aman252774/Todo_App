#!/bin/bash
exec > /var/log/userdata.log 2>&1

# Update packages
sudo apt update -y
sudo apt install -y git curl nginx build-essential

# Install Node.js 18
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs npm

# Ensure npm path (for ubuntu user)
export PATH=$PATH:/usr/bin:/usr/local/bin

# Install PM2 globally
sudo npm install -g pm2

# Create project directory and set ownership to ubuntu
sudo mkdir -p /home/ubuntu/todo_app_main
sudo chown -R ubuntu:ubuntu /home/ubuntu/todo_app_main

# Switch to ubuntu user for project-related commands
sudo -i -u ubuntu bash << 'EOF'
cd /home/ubuntu/todo_app_main

# Optional: initialize npm if not done yet
if [ ! -f package.json ]; then
    npm init -y
fi
EOF

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl restart nginx

