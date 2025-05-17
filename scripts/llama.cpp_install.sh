#!/bin/bash

# install git
sudo dnf install git

# install cmake
sudo dnf install cmake

# install C++ compiler
sudo dnf groupinstall 'Development Tools'

# install hiredis
# download rpm 
wget https://dl.fedoraproject.org/pub/epel/9/Everything/x86_64/Packages/h/hiredis-1.0.2-2.el9.x86_64.rpm
# install hiredis epel-release rpm
rpm -Uvh hiredis-1.0.2-2.el9.x86_64.rpm
# install rpm package
sudo dnf install hiredis

# install ccache
# download rpm
wget https://dl.fedoraproject.org/pub/epel/9/Everything/x86_64/Packages/c/ccache-4.5.1-2.el9.x86_64.rpm
# install ccache epel-release rpm
rpm -Uvh ccache-4.5.1-2.el9.x86_64.rpm
# install rpm package
sudo dnf install ccache

# install curl
sudo dnf install curl -y
curl --version

# install libcurl
sudo dnf install libcurl-devel -y

# Clone the llama git repository
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp

# build using cmake
cmake -B build
cmake --build build --config Release