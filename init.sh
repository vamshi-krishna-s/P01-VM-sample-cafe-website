#!/bin/bash

echo "-----------------------Login as a sudo User: vagrant-----------------------------"
sudo -i


echo "-----------------------update the deb package repository list and install dependencies-----------------------------"
apt-get update
apt-get install -y apache2 wget unzip


echo "-----------------------start and enable apache web service-----------------------------"
systemctl start apache2
systemctl enable apache2
systemctl status --no-pager apache2

echo "-----------------------go to the tmp directory and download html templates with wget-----------------------------"
cd /tmp
pwd
rm -rf html-templates.zip
wget https://www.tooplate.com/zip-templates/2129_crispy_kitchen.zip -O html-templates.zip

echo "-----------------------unzip the downlaoded templates and move templates to /var/www/http/-----------------------------"
cd /tmp
rm -rf html-templates
ls -l | grep html-templates
unzip html-templates.zip -d html-templates
cd html-templates
cd *
pwd
rm -rf *
mv -f * /var/www/html/

echo "-----------------------restart the apache service-----------------------------"
systemctl restart apache2

echo "ip address: "
ip addr show




