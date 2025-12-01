#!/bin/bash
set -e

echo "🚀 Starting Deployment..."

cd /home/ubuntu/todo_app_main

echo "📦 Installing Backend..."
cd todo-backend
npm install
pm2 start start.js --name backend || pm2 restart backend
cd ..

echo "🎨 Building Frontend..."
cd todo-frontend
npm install
npm run build
cd ..

echo "🔧 Applying Nginx Config..."
sudo cp /home/ubuntu/todo_app_main/deploy/nginx.conf /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx

echo "🔥 Saving PM2..."
pm2 save

echo "✅ Deployment Completed Successfully!"


echo "✅ Deployment Completed Successfully!"
