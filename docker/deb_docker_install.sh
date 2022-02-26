#! /bin/bash

# This script can be used to install Docker and Docker Compose onto
# a Debian derived Linux host.  It puts into a script the instructions
# available on on Docker's documentation page for installing Docker 
# on Debian https://docs.docker.com/engine/install/debian/

# This script requires root privileges to run

# In cases where your organization uses a proxy server, make sure
# you have the HTTP_PROXY and HTTPS_PROXY environment variables
# set to the URL for your proxy server.

# Revision history
# Harold Andrews / cyber-front / v 0.0.1 / 2022-02-26

# Remove any versions of Docker which may have already been installed
apt remove -y docker docker-engine docker.io containerd runc

# Update the installation
apt update -y
apt upgrade -y

# Install some dependencies for running this script
apt install -y ca-certificates curl gnupg lsb-release

# Download and install the GPG key to safely pull from Docker's apt repo
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add apt repo to pull packages from Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update again, this time including the Docker apt repo
apt update -y
apt upgrade -y

# Install the Docker components 
apt install -y docker-ce docker-ce-cli containerd.io

# This next section will install Docker Compose using the instructions
# available from https://docs.docker.com/compose/install/

# The instructions include pulling from Docker's git repo with the release
# version hard coded in the curl request.  Maybe there's a clever way to 
# determine that version, but I'm fine with periodically editing this
# to update the version in the curl request.

# I don't really like this approach, but this is what the Docker
# authorities consider safe and effective... so who am I to disagree?
curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Make docker-compose executable
chmod +x /usr/local/bin/docker-compose

# Create a soft link into the path, just to be sure
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Verify the version of Docker and Docker-Compose
echo "Verifying successful installation... you should see the versions of docker and docker-compose below"
docker --version
docker-compose --version

