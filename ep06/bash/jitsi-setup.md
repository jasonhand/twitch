# TODO

Turn all of the below in to a bash script

#!/usr/bin/env bash

# Script to prepare VM and install Jitsi

sudo vi /etc/hosts

#and add

#IP address (ex. 40.121.146.119) 
#plus
#localhost
#plus
#DNS
#(ex. meet.cloudavision.com)

# Install Jitsi

`sudo apt-get -y install jitsi-meet`

# Update DNS registart with new CNAME (ex. meet.cloudavision.com)

make change at GoDadday (or wherever you manage your DNS)

# Enter CNAME as the hostname in the Package Configuration

type meet.cloudavision.com

# Generate a certificate

`sudo apt-get -y install jitsi-meet`

# Let's Encrypt

`sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh`