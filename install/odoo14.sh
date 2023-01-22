#!/bin/bash
################################################################################
# Script for installing Odoo on Ubuntu 14.04, 15.04 and 16.04 (could be used for other version too)
# Author: Yenthe Van Ginneken
#-------------------------------------------------------------------------------
# This script will install Odoo on your Ubuntu 14.04 server. It can install multiple Odoo instances
# in one Ubuntu because of the different xmlrpc_ports
#-------------------------------------------------------------------------------
# Make a new file:
# nano odoo-install.sh
# Place this content in it and then make the file executable:
# chmod +x odoo-install.sh
# Execute the script to install Odoo:
# ./odoo-install
################################################################################

 echo -e "\n---- Python Dependencies ----" && sleep 3


 sudo apt-get install -y python3-pip python3-dev python3-setuptools python3-venv python3-wheel python3-pypdf2 

pip3 install codicefiscale
pip3 install python-telegram-bot --upgrade
pip3 install xmlschema
pip3 install openupgradelib
pip3 install asn1crypto
pip3 install Unidecode
 


echo -e "\n---- Odoo Web Dependencies ----" && sleep 3

sudo apt-get install -y nodejs npm
sudo apt-get install -y node-less node-clean-css

sudo npm install -g less less-plugin-clean-css

#--------------------------------------------------
# Install Wkhtmltopdf if needed
#--------------------------------------------------

INSTALL_WKHTMLTOPDF_VERSION=`wkhtmltopdf --version`
if [ $INSTALL_WKHTMLTOPDF = "True" ] && [ -z "$INSTALL_WKHTMLTOPDF_VERSION" ]; then
sudo apt-get install -y wkhtmltopdf

else
  echo "Wkhtmltopdf isn't installed due to the choice of the user!" && sleep 3
fi

  
echo -e "\n---- Create Log directory ----" && sleep 3
mkdir -p $OE_LOG_PATH
#--------------------------------------------------
# Install ODOO
#--------------------------------------------------
echo -e "\n---- Install Odoo v14.0 ----" sleep 3
wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
echo "deb http://nightly.odoo.com/14.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list
apt-get update && apt-get install odoo -y
sudo systemctl enable odoo
sudo systemctl restart odoo
sudo systemctl stop odoo
sudo systemctl start odoo

echo -e "\n---- Installed Odoo v14.0 and Dependence ----" sleep 3
