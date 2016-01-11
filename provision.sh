#!/usr/bin/env bash

# Update / Upgrade
apt-get -qq update && apt-get -qq upgrade -y

# Install git & nginx
apt-get -qq install -y git nginx

# Download Node.js
# Get link to newest version: https://nodejs.org/en/download/stable
cd ~
wget https://nodejs.org/dist/v5.4.0/node-v5.4.0-linux-x64.tar.gz

# Extract Node.js to "~/node" dir
mkdir node
tar xvf node-v*.tar.gz --strip-components=1 -C ./node

# Configure Node.js
mkdir node/etc
# Prefix: Install global items in "/usr/local"
echo 'prefix=/usr/local' > node/etc/npmrc

# Move Node.js binaries to /opt/node & make root user owner
mv node /opt/
chown -R root: /opt/node

# Create symbolic links to binaries in "/usr/local/bin"
ln -s /opt/node/bin/node /usr/local/bin/node
ln -s /opt/node/bin/npm /usr/local/bin/npm

# Install PM2 Node.js process manager
npm install -g pm2

# Add PM2 startup script to OS
pm2 startup ubuntu

# Install dependencies & Start Node.js application
cd /home/vagrant/app
npm i
pm2 start /home/vagrant/app/app.js

# Copy Nginx vhost
cp /home/vagrant/app/default.nginx /etc/nginx/sites-available/default

# Restart nginx
service nginx restart
