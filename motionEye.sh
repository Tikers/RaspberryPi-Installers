clear
echo "Starting Motioneye Installation"
sleep 1
clear

cd ~

# ffmpeg is missing from the official Debian repos. Moreover, 
# the variant offered by deb-multimedia.org no longer works with Raspbian after recent updates.
# download this prebuilt package and install
sudo wget https://github.com/ccrisan/motioneye/wiki/precompiled/ffmpeg_3.1.1-1_armhf.deb
sudo dpkg -i ffmpeg_3.1.1-1_armhf.deb
sudo rm -rf ffmpeg_3.1.1-1_armhf.deb

# remove previously added the deb-multimedia repo incase they are installed
sudo apt-get remove libavcodec-extra-56 libavformat56 libavresample2 libavutil54

# Install the dependencies from the repositories
sudo apt-get install python-pip python-dev curl libssl-dev libcurl4-openssl-dev libjpeg-dev libx264-142 libavcodec56 libavformat56 libmysqlclient18 libswscale3 libpq5 v4l-utils -y

# Install motion
sudo wget https://github.com/Motion-Project/motion/releases/download/release-4.0.1/pi_jessie_motion_4.0.1-1_armhf.deb
sudo dpkg -i pi_jessie_motion_4.0.1-1_armhf.deb
sudo rm -rf pi_jessie_motion_4.0.1-1_armhf.deb

# Install motioneye, which will automatically pull Python dependencies 
# (tornado, jinja2, pillow and pycurl)
sudo pip install motioneye

# Prepare the configuration directory
sudo mkdir -p /etc/motioneye
sudo cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf

# Prepare the media directory
sudo mkdir -p /var/lib/motioneye

# Add an init script, configure it to run at startup and start the motionEye server
sudo cp /usr/local/share/motioneye/extra/motioneye.systemd-unit-local /etc/systemd/system/motioneye.service
sudo systemctl daemon-reload
sudo systemctl enable motioneye
sudo systemctl start motioneye

# To upgrade to the newest version of motionEye
sudo pip install motioneye --upgrade
sudo systemctl restart motioneye

# enable camera
echo "bcm2835-v4l2" | sudo tee -a /etc/modules


# reboot
clear
echo "Installation Finished"
sudo shutdown -r now "Rebooting after installation"