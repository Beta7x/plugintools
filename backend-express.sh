#!/bin/bash
echo "======================================="
echo "  Instalasi Environment Backend Express"
echo "======================================="

# ---------------------------
# Update repo & install tools dasar
# ---------------------------
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y curl git wget unzip xz-utils software-properties-common apt-transport-https

# ---------------------------
# Install Node.js (LTS) + npm
# ---------------------------
echo ">> Menginstall Node.js LTS..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

echo ">> Mengecek versi Node.js & npm..."
node -v
npm -v

# ---------------------------
# Install XAMPP
# ---------------------------
echo ">> Mengunduh dan menginstall XAMPP..."
cd /tmp
wget https://www.apachefriends.org/xampp-files/8.2.12/xampp-linux-x64-8.2.12-0-installer.run
chmod +x xampp-linux-x64-8.2.12-0-installer.run
sudo ./xampp-linux-x64-8.2.12-0-installer.run --mode unattended
rm xampp-linux-x64-8.2.12-0-installer.run

# Start service Apache & MySQL
echo ">> Menjalankan Apache & MySQL..."
sudo /opt/lampp/lampp start

# ---------------------------
# Install VS Code
# ---------------------------
echo ">> Menginstall VS Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
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
echo ">> Instalasi Backend Express selesai"
echo "======================================="
echo "Node.js version: $(node -v)"
echo "npm version: $(npm -v)"
echo "VS Code, XAMPP, dan Postman sudah siap digunakan."
