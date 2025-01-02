#!/bin/bash

# Update all package repositories
sudo apt update -y

# Install Apache Web Server
sudo apt install -y apache2

# Start and enable Apache Web Server
sudo systemctl start apache2.service
sudo systemctl enable apache2.service

# Install stress for testing EC2 instance under stress workloads
sudo apt install -y stress

# Add custom webpage HTML code to "index.html"
echo "<html><body><h1>Welcome to Aderinto.com.ng!</h1></body><html>" > /var/www/html/index.html
