387 lines (356 sloc)  15.5 KB

#!/bin/bash
################################################################################
# Script for installing Odoo on Ubuntu 16.04, 18.04 and 20.04 (could be used for other version too)
#-------------------------------------------------------------------------------
# This script will install Odoo on your Ubuntu server. It can install multiple Odoo instances
# in one Ubuntu because of the different xmlrpc_ports
#-------------------------------------------------------------------------------
# Make a new file:
# sudo nano odoo-install.sh
# Place this content in it and then make the file executable:
# sudo chmod +x odoo-install.sh
# Execute the script to install Odoo:
# ./odoo-install
################################################################################

sudo apt-get install git -y
cd /tmp
sudo git clone https://github.com/tgd1973/Odoo-install/install
cd /tmp/install
