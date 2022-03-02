#! /bin/bash

# This script can be used to uninstall Docker and Docker Compose on
# a Debian derived Linux host.

# This script requires root privileges to run

# Revision history
# Harold Andrews / cyber-front / v 0.0.1 / 2022-02-28

# Remove any versions of Docker which may have already been installed

# This next section enables the docker daemon to restart when the host
# restarts.  If you prefer not to have that functionality, you can comment
# these lines out before running the script
systemctl disable containerd.service
systemctl disable docker.service

rm -f /usr/bin/docker-compose
rm -f /usr/local/bin/docker-compose

apt remove -y docker-ce docker-ce-cli containerd.io

rm -f /etc/apt/sources.list.d/docker.list
rm -f /usr/share/keyrings/docker-archive-keyring.gpg
