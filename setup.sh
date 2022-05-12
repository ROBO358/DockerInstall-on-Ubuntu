#!/bin/sh

cd "dirname $0"

echo "SETUP Starting..."
# https://docs.docker.com/engine/install/ubuntu/

# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Set up the repository
sudo apt-get update

sudo apt install ca-certificates curl gnupg lsb-release

if ! grep -q "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs)" /etc/apt/sources.list.d/docker.list; then
	echo "add apt source"
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	cat /etc/apt/sources.list.d/docker.list
fi

# Install Docker Engine
sudo apt-get update & sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
echo "Done"
