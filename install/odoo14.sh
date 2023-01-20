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

if [ $PYTHON_VERSION = "3" ]; then
#----------------- Python 3 ------------------
    if [ $(which python3.6) ] || [ $(which python3.7) ] || [ $(which python3.8) ] || [ $(which python3.9) ]; then
        sudo apt-get install -y python3-pip python3-dev python3-setuptools python3-venv python3-wheel pip3 install codicefiscale
pip3 install python-telegram-bot --upgrade
    else
        echo "System has wrong python version! Odoo supports only 3.6+ python"
        exit 1
    fi

else
#------------------ Python 2 -------------------
    sudo apt-get install -y python-dev python-virtualenv python-setuptools python-pip
fi

echo -e "\n---- Odoo Web Dependencies ----" && sleep 3

sudo apt-get install -y nodejs npm
sudo apt-get install -y node-less node-clean-css

sudo npm install -g less less-plugin-clean-css

#--------------------------------------------------
# Install Wkhtmltopdf if needed
#--------------------------------------------------

INSTALL_WKHTMLTOPDF_VERSION=`wkhtmltopdf --version`
if [ $INSTALL_WKHTMLTOPDF = "True" ] && [ -z "$INSTALL_WKHTMLTOPDF_VERSION" ]; then
  echo -e "\n---- Install wkhtml and place shortcuts on correct place for ODOO $OE_VERSION ----"  && sleep 3

  OS_RELEASE=`lsb_release -sc`
  if [ "`getconf LONG_BIT`" == "64" ];then
      _url=https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1."$OS_RELEASE"_amd64.deb
  else
      _url=https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1."$OS_RELEASE"_i386.deb
  fi
  wget $_url
  sudo dpkg -i `basename $_url`
  sudo apt-get install -f -y
else
  echo "Wkhtmltopdf isn't installed due to the choice of the user!"
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
