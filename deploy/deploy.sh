#!/bin/bash

echo "Deployment started..."

cd /var/www/todo_app

echo "Pulling latest code..."
git pull origin main

echo "Installing backend dependencies..."
cd todo-backend
npm install

echo "Restarting backend using PM2..."
pm2 restart backend || pm2 start server.js --name backend

echo "Building frontend..."
cd ../todo-frontend
npm install
npm run build

echo "Deploying frontend build..."
rm -rf /var/www/html/*
cp -r dist/* /var/www/html/

echo "Restarting Nginx..."
systemctl restart nginx

echo "Deployment Complete!"
