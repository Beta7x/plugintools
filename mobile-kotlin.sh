#!/bin/bash
echo "======================================="
echo "  Instalasi Environment Mobile Kotlin  "
echo "======================================="

# Update repo & install dependencies
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y curl git unzip tar libglu1-mesa

# Download Android Studio
echo ">> Download Android Studio..."
cd ~
curl -LO https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2025.1.3.7/android-studio-2025.1.3.7-linux.tar.gz

# Ekstrak ke home
echo ">> Ekstrak Android Studio..."
tar -xzf android-studio-2025.1.3.7-linux.tar.gz
rm android-studio-2025.1.3.7-linux.tar.gz

# Buat symlink ke /usr/local/bin biar gampang akses
echo ">> Setup PATH Android Studio..."
sudo ln -sf ~/android-studio/bin/studio.sh /usr/local/bin/android-studio

# Jalankan Android Studio pertama kali
echo ">> Menjalankan Android Studio..."
nohup android-studio >/dev/null 2>&1 &

echo "======================================="
echo ">> Instalasi Mobile Kotlin selesai"
echo "======================================="
