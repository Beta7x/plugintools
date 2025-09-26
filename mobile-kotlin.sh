#!/bin/bash
echo "======================================="
echo "  Instalasi Environment Mobile Kotlin  "
echo "======================================="

# Update repo
sudo apt update -y

echo ">> Menginstall Android Studio..."
sudo snap install android-studio --classic

echo ">> Membuka Android Studio dan Discord..."
nohup android-studio >/dev/null 2>&1 &

echo ">> Instalasi Mobile Kotlin selesai"
