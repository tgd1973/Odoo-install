#!/bin/bash
################################################################################
# Script for installing Odoo on Ubuntu 16.04, 18.04 and 20.04 or Debian 10
# (could be used for other version too)
#-------------------------------------------------------------------------------
# This script will install Odoo on your Ubuntu/Debian server. It can install 
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
sudo chmod +x run.sh 
echo "  
------------------------------------
 Time for modify options install's
------------------------------------
"
while true; do
        echo "If you want to use the default settings with Odoo-v15. & PostgreSQL-v14 continue."
        read -p 'If you want to make changes, stop here. Continue ? (y/n)' yn
        case $yn in
        [Yy]*) break ;;
        [Nn]*) exit ;;
        *) echo "Please answer Yes or No." ;;
        esac
done
sudo ./run.sh
