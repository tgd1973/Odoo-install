#!/bin/bash
################################################################################
# Script for installing Odoo on Ubuntu 16.04, 18.04 and 20.04 
# (could be used for other version too)
#-------------------------------------------------------------------------------
# This script will install Odoo on your Ubuntu server. It can install 
# multiple Odoo instances in one Ubuntu because of the different xmlrpc_ports
#-------------------------------------------------------------------------------
# Run with command:
# sudo chmod +x odoo-install.sh
# Execute the script to install Odoo:
# sudo ./odoo-install.sh
################################################################################

sudo apt-get install git -y
cd /tmp/
sudo git clone https://github.com/tgd1973/Odoo-install/
cd /tmp/Odoo-install/install/
sudo chmod +x run.sh && sudo ./run.sh
