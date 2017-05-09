#!/bin/bash
# install sabnzb

# install par2 for repairing RAR files (this is for Jessie)
sudo apt-get install python-gdbm python-cheetah python-openssl par2 unzip -y

# Add the Sabnzbd repository and add the necessary keys.
# We can use the ubuntu repository since python is cross-platform
echo "deb http://ppa.launchpad.net/jcfp/ppa/ubuntu precise main" | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net:11371 --recv-keys 0x98703123E0F52B2BE16D586EF13930B14BB9F05F

# install the proper unrar for arm7 to fix this Sabnzbd error
wget http://sourceforge.net/projects/bananapi/files/unrar_5.2.6-1.arm6_armhf.deb

# Install the unrar package
sudo dpkg -i unrar_5.2.6-1.arm6_armhf.deb

# update
sudo apt-get update

# install sabnzb
sudo apt-get install sabnzbdplus -y

