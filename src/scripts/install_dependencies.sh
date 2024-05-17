#!/bin/bash

# Create the application directory if it doesn't exist
mkdir -p /var/www/myapp

# Update package lists and install dependencies using yum
sudo yum update -y
sudo yum install -y nodejs npm

# Install pm2 globally
sudo npm install -g pm2

# Navigate to the application directory
cd /var/www/myapp

# Install Node.js dependencies
npm install

echo "Dependencies installed successfully."
