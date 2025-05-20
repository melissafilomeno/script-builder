#!/bin/bash

# update
sudo dnf update

# enable EPEL repository
yes | sudo dnf config-manager --set-enabled crb && dnf install https://dl.fedoraproject.org/pub/epel/epel{,-next}-release-latest-9.noarch.rpm

# install sqlite
yum install libsqlite3x-devel.x86_64

# install python 3.10 pre-requisites
sudo dnf install wget yum-utils make gcc openssl-devel bzip2-devel libffi-devel zlib-devel

# download python 3.10 source code
wget https://www.python.org/ftp/python/3.10.17/Python-3.10.17.tgz

# install tar
sudo dnf install tar

# extract archive
tar xzf Python-3.10.17.tgz

# cd to source
cd Python-3.10.17 

# configure
./configure --enable-loadable-sqlite-extensions --enable-optimizations

# install
make
make install

# Note : 
# full path to python : /usr/local/bin/python3
# full path to pip3 : /usr/local/bin/pip3

# install llama-cpp-python
/usr/local/bin/pip3 install llama-cpp-python

# install huggingface-hub (download Llama models in gguf format)
/usr/local/bin/pip3 install huggingface-hub