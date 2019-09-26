#! /bin/bash
wget https://github.com/protocolbuffers/protobuf/archive/v3.4.0.tar.gz
tar xzf protobuf-3.4.0.tar.gz
cd protobuf-3.4.0
sudo apt-get update
sudo apt-get install build-essential
sudo ./configure
sudo make
sudo make check
sudo make install 
sudo ldconfig
protoc --version

