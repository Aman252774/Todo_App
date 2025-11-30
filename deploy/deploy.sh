#!/bin/bash

APP_DIR="/var/www/todo_app_main"
BACKEND_DIR="$APP_DIR/todo-backend"
FRONTEND_DIR="$APP_DIR/todo-frontend"
NGINX_CONF="$APP_DIR/deploy/nginx.conf"

echo "Starting Deployment..."

# ---------------- BACKEND ----------------
echo "Installing backend dependencies..."
cd $BACKEND_DIR
npm install

# PM2 setup
echo "Starting backend with PM2..."
pm2 stop todo-app || true
pm2 start start.js --name todo-app
pm2 save

# ---------------- FRONTEND ----------------
echo "Setting up frontend..."
sudo rm -rf /var/www/html/*
sudo cp -r $FRONTEND_DIR/dist/* /var/www/html/

# ---------------- NGINX ----------------
echo "Updating Nginx config..."
sudo cp $NGINX_CONF /etc/nginx/nginx.conf

sudo systemctl restart nginx

echo "Deployment Completed Successfully!"
