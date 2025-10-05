#!/bin/bash
echo "======================================="
echo "   Instalasi Environment Laravel "
echo "======================================="

# ---------------------------
# Update repo
# ---------------------------
sudo apt-get update -y && sudo apt-get upgrade -y

# ---------------------------
# Install Git
# ---------------------------
echo ">> Install Git..."
sudo apt-get install -y git

# ---------------------------
# Install XAMPP (opsional, GUI DB & Apache)
# ---------------------------
echo ">> Download XAMPP..."
cd $HOME
wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run
chmod +x xampp-linux-x64-8.2.12-0-installer.run
sudo ./xampp-linux-x64-8.2.12-0-installer.run
echo ">> XAMPP terinstal. Jalankan dengan: sudo /opt/lampp/manager-linux-x64.run"

# ---------------------------
# Install PHP (multi version support)
# ---------------------------
echo ">> Tambah repository PHP (Ondrej)..."
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update

echo ">> Install PHP 8.2 & 8.3..."
sudo apt install -y php8.2 php8.2-cli php8.2-fpm php8.2-mysql php8.2-mbstring php8.2-xml php8.2-curl
sudo apt install -y php8.3 php8.3-cli php8.3-fpm php8.3-mysql php8.3-mbstring php8.3-xml php8.3-curl

echo ">> Atur versi default PHP..."
sudo update-alternatives --set php /usr/bin/php8.3

php -v

# ---------------------------
# Install Composer
# ---------------------------
echo ">> Install Composer..."
cd $HOME
curl -sS https://getcomposer.org/installer -o composer-setup.php
EXPECTED_SIGNATURE=$(curl -s https://composer.github.io/installer.sig)
ACTUAL_SIGNATURE=$(php -r "echo hash_file('sha384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]; then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php
composer -V

# ---------------------------
# Install Laravel Installer
# ---------------------------
echo ">> Install Laravel Installer..."
composer global require laravel/installer

# Tambahkan PATH ke bashrc (gunakan .config/composer/vendor/bin)
if ! grep -q 'export PATH="$HOME/.config/composer/vendor/bin:$PATH"' ~/.bashrc; then
  echo 'export PATH="$HOME/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc
fi
source ~/.bashrc

# ---------------------------
# Install Node.js (via NVM)
# ---------------------------
echo ">> Install NVM untuk Node.js..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo ">> Install Node versi LTS & versi lain..."
nvm install --lts
nvm install 20

echo ">> Versi Node aktif:"
nvm current
node -v
npm -v

# ---------------------------
# Install VS Code
# ---------------------------
echo ">> Install VS Code..."
sudo apt install -y apt-transport-https curl gpg
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install -y code

# ---------------------------
# Cek hasil
# ---------------------------
echo "======================================="
echo " Instalasi selesai! Cek dengan perintah:"
echo " - php -v"
echo " - composer -V"
echo " - laravel --version"
echo " - node -v && npm -v"
echo " - git --version"
echo " - code"
echo "======================================="
