#!/bin/bash
echo "======================================="
echo "  Instalasi Environment Mobile Flutter "
echo "======================================="

# Update repo
sudo apt-get update -y && sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa
# ---------------------------
# Download & Install Flutter SDK
# ---------------------------
echo ">> Mengunduh Flutter SDK..."
cd $HOME
if [ -d "$HOME/flutter" ]; then
  echo ">> Flutter sudah ada, hapus dulu folder lama..."
  rm -rf $HOME/flutter
fi

cd $HOME
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.25.4-stable.tar.xz
tar xf flutter_linux_3.35.4-stable.tar.xz
rm flutter_linux_3.35.4-stable.tar.xz

# ---------------------------
# Setup PATH Flutter
# ---------------------------
if ! grep -q 'export PATH="$PATH:$HOME/flutter/bin"' ~/.bashrc; then
  echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc
fi
source ~/.bashrc

# ---------------------------
# Install Android Studio
# ---------------------------
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

# ---------------------------
# Jalankan flutter doctor
# ---------------------------
echo ">> Menjalankan flutter doctor..."
$HOME/flutter/bin/flutter doctor

echo ">> Instalasi Flutter selesai"
echo "Buka ulang terminal agar PATH Flutter aktif."
