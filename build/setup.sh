#!/bin/bash
[[ ! -f /etc/debian_version && ! -f /etc/ubuntu_version ]] && exit 1
sudo apt-get install -y python3-pip curl graphviz default-jdk-headless git ca-certificates
[[ ! -d ~/sdnc-yang ]] && git clone --recursive https://github.com/cowdrey-net/sdnc-yang
[[ ! -f /usr/local/bin/pyang ]] && sudo pip3 install pyang

pyang -v
java -jar ~/sdnc-yang/build/plantuml.jar -version
