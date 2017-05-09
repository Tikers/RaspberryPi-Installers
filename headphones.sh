#!/bin/bash
# install headphones

# update programs and Upgrade any software packages
echo 'Start update and upgrade'
sudo apt-get update -y && sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install git-core -y

# Git clone the Headphones installation into Raspbian
echo 'Download from github'
sudo git clone https://github.com/rembo10/headphones.git /opt/headphones

# Make pi the owner (change to desired user if wanted)
sudo chown -R pi:pi /opt/headphones

# set to listen external machines aswell (otherwise only local)
sed -i "/http_host = /c\http_host = 0.0.0.0" /opt/headphones/config.ini

#auto start by init.d file
echo 'auto start file settings'
cat > /etc/default/headphones <<EOF
HP_USER=pi
HP_HOME=/opt/headphones
HP_PORT=8181
EOF

#copy the defailt init.d script
sudo cp /opt/headphones/init-scripts/init.ubuntu /etc/init.d/headphones

# make executeable
sudo chmod +x /etc/init.d/headphones

# Update init to use the headphones script
sudo update-rc.d headphones defaults

echo 'finished installation'
