#!/bin/bash

# Variables
WEBSITE_URL="https://www.tooplate.com/zip-templates/2133_moso_interior.zip"
TEMP_DIR="/tmp/webfiles"
WEB_DIR="/var/www/html"

echo
echo "#############################################"
echo "Setting up website"
echo "############################################"
echo

# Updating OS
echo "Updating OS"
sudo yum update -y > /dev/null || { echo "Error updating OS"; exit 1; }

echo
# Installing packages
echo "Installing packages"
sudo yum install wget unzip httpd -y > /dev/null || { echo "Error installing packages"; exit 1; }

# Start & Enable Service
echo "###########################################"
echo "Start & Enable HTTP Service"
echo "###########################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

echo
echo "##########################################"
echo "Start Artifact Deployment"
echo "#########################################"
mkdir -p $TEMP_DIR
cd $TEMP_DIR
echo

# Downloading website files
echo "Downloading website files"
wget $WEBSITE_URL || { echo "Error downloading website files"; exit 1; }
unzip -q 2133_moso_interior.zip
sudo cp -r 2133_moso_interior/* $WEB_DIR || { echo "Error copying files to $WEB_DIR"; exit 1; }

echo
# Files downloaded and unzipped
echo "Files downloaded and unzipped successfully"
sudo systemctl restart httpd

# Clean up
echo "Cleaning up"
rm -rf $TEMP_DIR

echo
echo "Website setup completed"
