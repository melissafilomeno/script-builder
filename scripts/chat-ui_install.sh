#!/bin/bash

# install dnf-plugins
sudo dnf -y install dnf-plugins-core

# add docker repository
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

# verify docker repository is added
sudo dnf repolist -v

# install docker community edition
sudo dnf install docker-ce

# enable docker
sudo systemctl enable --now docker

# check status
sudo systemctl status docker

#============
# list available version of nodejs
sudo dnf module list nodejs

# Note : no default nodejs was set and install nodejs is failing, hence need to do the following steps
# reset version
sudo dnf module reset nodejs

# switch to version
sudo dnf module -y enable nodejs:22

# install Node.js 22
sudo dnf module -y install nodejs:22/common

# verify
node -v

#============
# clone chat-ui repository
git clone https://github.com/huggingface/chat-ui
cd chat-ui

# create .env.local with the following contents :
MODELS=`[
  {
    "name": "microsoft/Phi-3-mini-4k-instruct",
    "endpoints": [{
      "type" : "llamacpp",
      "baseURL": "http://localhost:8080"
    }],
  },
]`
MONGODB_URL=mongodb://localhost:27017

# install chat-ui
npm install

# rename tailwind config from cjs to mjs
mv tailwind.config.cjs tailwind.config.mjs

# enable network access to UI
vi package.json
# update scripts > dev and add --host to the value

# update firewall settings, add port 5173 and http
sudo firewall-cmd --zone=public --add-service=http --permanent 
sudo firewall-cmd --zone=public --permanent --add-port=5173/tcp

# reload firewall
sudo firewall-cmd --reload

# verify firewall config
sudo firewall-cmd --zone=public --list-all 