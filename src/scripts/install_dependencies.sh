#!/bin/bash

# Update package lists
apt-get update

# Install necessary packages (example for a Node.js application)
apt-get install -y nodejs npm

# Install application dependencies (example for a Node.js application)
cd /path/to/your/application
npm install

echo "Dependencies installed successfully."