#!/bin/bash

# this script is only tested on ubuntu xenial

# install java 8
sudo apt update
sudo apt install -y openjdk-8-jdk

# download jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y jenkins
systemctl status jenkins

# show firewall
sudo ufw allow 8080
sudo ufw status
