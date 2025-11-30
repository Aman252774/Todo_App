#!/bin/bash

echo "🚀 Starting Deployment..."

cd /home/ubuntu/todo_app_main

echo "📦 Installing Backend..."
cd todo-backend
npm install
pm2 restart backend || pm2 start start.js --name backend
cd ..

echo "🎨 Building Frontend..."
cd todo-frontend
npm install
npm run build
cd ..

echo "🔧 Applying Nginx Config..."
sudo cp deploy/nginx.conf /etc/nginx/nginx.conf
sudo systemctl restart nginx

echo "✅ Deployment Completed Successfully!"
