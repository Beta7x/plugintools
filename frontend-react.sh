#!/bin/bash
echo "======================================="
echo "   Instalasi Environment Frontend React"
echo "======================================="

# ---------------------------
# Update & install dependencies
# ---------------------------
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y curl git wget software-properties-common

# ---------------------------
# Install Node.js + npm (LTS)
# ---------------------------
echo ">> Menginstall Node.js LTS..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs build-essential

# Verifikasi Node.js & npm
node -v
npm -v

# ---------------------------
# Install VS Code
# ---------------------------
echo ">> Menginstall Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update -y
sudo apt-get install -y code
rm -f packages.microsoft.gpg

# ---------------------------
# Install XAMPP
# ---------------------------

echo ">> Download XAMPP..."
cd $HOME
wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run
chmod +x xampp-linux-x64-8.2.12-0-installer.run
sudo ./xampp-linux-x64-8.2.12-0-installer.run
echo ">> XAMPP terinstal. Jalankan dengan: sudo /opt/lampp/manager-linux-x64.run"

# ---------------------------
# Jalankan aplikasi
# ---------------------------
echo ">> Menjalankan VS Code..."
nohup code >/dev/null 2>&1 &

echo ">> Menjalankan XAMPP..."
sudo /opt/lampp/lampp start
