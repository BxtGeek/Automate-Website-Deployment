#!/bin/bash
#Using this script you can host a static site on your centos server
#You can select website from Business, Blog, Resume and ecommerce category

#Variables 
PACKAGE="wget unzip httpd"
SVC="httpd"

#Updating System

#Installting Recommended programs
sudo yum install $PACKAGE -y &> /dev/null

#Initilizaing the httpd service
sudo systemctl enable $SVC
sudo systemctl enable $SVC

#Selecting the Website category
echo "Select the Website category:"
echo "1 - Business"
echo "2 - Blog"
echo "3 - Resume"
echo "4 - ecommerce"
read category;
#deleting /var/www/html/ dir
sudo rm -rf /var/www/html/*
if [ $category -eq 1 ];
then
	cd /tmp
	sudo mkdir webfiles
	cd webfiles
	sudo wget https://www.free-css.com/assets/files/free-css-templates/download/page282/leadmark.zip &> /dev/null
	sudo unzip leadmark.zip &> /dev/null
	cd leadmark
	cp -r * /var/www/html/
    systemctl restart $SVC
    # deleting temp File
    cd /tmp
	sudo rm -rf webfiles 
    echo "website deploy sucessfully"
    echo "Check from the URL: http://192.168.0.52/public_html/"
elif [ $category -eq 2 ];
then
    cd /tmp
	sudo mkdir webfiles
	cd webfiles
	sudo wget https://www.free-css.com/assets/files/free-css-templates/download/page281/biznews.zip &> /dev/null
	sudo unzip biznews.zip &> /dev/null
	cd free-news-website-template
	cp -r * /var/www/html/
    systemctl restart $SVC
    # deleting temp File
    cd /tmp
	sudo rm -rf webfiles 
    echo "website deploy sucessfully"
    echo "Check from the URL: http://192.168.0.52/"
elif [ $category -eq 3 ];
then
    cd /tmp
	sudo mkdir webfiles
	cd webfiles
	sudo wget https://www.free-css.com/assets/files/free-css-templates/download/page263/above.zip &> /dev/null
	sudo unzip above.zip &> /dev/null
	cd above
	cp -r * /var/www/html/
    systemctl restart $SVC
    # deleting temp File
    cd /tmp
	sudo rm -rf webfiles 
    echo "website deploy sucessfully"
    echo "Check from the URL: http://192.168.0.52/"
elif [ $category -eq 4 ];
then
    cd /tmp
	sudo mkdir webfiles
	cd webfiles
	sudo wget https://www.free-css.com/assets/files/free-css-templates/download/page281/romofyi.zip &> /dev/null
	sudo unzip romofyi.zip &> /dev/null
	cd romofyi-html
	cp -r * /var/www/html/
    systemctl restart $SVC
    # deleting temp File
    cd /tmp
	sudo rm -rf webfiles 
    echo "website deploy sucessfully"
    echo "Check from the URL: http://192.168.0.52/"
else
echo "Did not select the proper option"
echo "********Program Ending********"
fi