#!/bin/bash
echo "======================================="
echo "  Instalasi Environment Backend Golang"
echo "======================================="

# ---------------------------
# Update repo & install tools dasar
# ---------------------------
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y \
  curl git wget unzip xz-utils software-properties-common \
  apt-transport-https ca-certificates

# ---------------------------
# Install Golang
# ---------------------------
echo ">> Menginstall Golang..."
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install -y golang-go

echo ">> Mengecek versi Golang..."
go version

# ---------------------------
# Install Docker
# ---------------------------
echo ">> Menginstall Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce
systemctl status docker

# ---------------------------
# Docker rootless
# ---------------------------
sudo usermod -aG docker ${USER}
groups

# ---------------------------
# Install VS Code
# ---------------------------
echo ">> Menginstall VS Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt-get update -y
sudo apt-get install -y code

# ---------------------------
# Install Postman
# ---------------------------
echo ">> Menginstall Postman..."
sudo snap install postman

echo "======================================="
echo ">> Instalasi Backend Golang selesai"
echo "======================================="
echo "Go version: $(node -v)"
echo "Docker version: $(docker -v)"
echo "Go, Docker, VS Code, dan Postman sudah siap digunakan."
