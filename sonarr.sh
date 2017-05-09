# Install Sonarr Raspberry Pi 2 with Latest Stable Mono
# Add the Xamarin mono repository to make sure we get the latest stable mono (source)
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update

# Enable apt-get to install from https sources or you
sudo apt-get install apt-transport-https -y --force-yes
#Add sources to install Sonarr on Raspbian
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
echo "deb https://apt.sonarr.tv/ master main" | sudo tee -a /etc/apt/sources.list.d/sonarr.list
# Update repository list of packages
sudo apt-get update
# Install Sonarr (NzbDrone)
sudo apt-get install nzbdrone -y
#Take ownership of the Sonarr installation so updates will work properly
sudo chown -R pi:pi /opt/NzbDrone

