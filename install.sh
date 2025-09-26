#!/bin/bash

# Ganti dengan URL repo GitHub kamu
BASE_URL="https://raw.githubusercontent.com/komunitas/installer/main"

echo "======================================="
echo "   Setup Environment Komunitas Squad   "
echo "======================================="
echo "Pilih environment yang ingin diinstall:"
echo "1) Mobile Kotlin"
echo "2) Laravel Backend"
echo "3) Keluar"
echo "======================================="

read -p "Masukkan pilihan (1/2/3): " choice

case $choice in
  1)
    echo ">> Download & jalankan installer Mobile Kotlin..."
    curl -s $BASE_URL/mobile-kotlin.sh | bash
    ;;
  2)
    echo ">> Download & jalankan installer Laravel Backend..."
    curl -s $BASE_URL/laravel.sh | bash
    ;;
  3)
    echo "Keluar."
    exit 0
    ;;
  *)
    echo "Pilihan tidak valid!"
    ;;
esac

