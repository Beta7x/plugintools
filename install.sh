#!/bin/bash

# URL repo GitHub kamu
BASE_URL="https://raw.githubusercontent.com/Kresa12/plugintools/main"

echo "======================================="
echo "   Setup Environment Plugin   "
echo "======================================="
echo "Pilih environment yang ingin diinstall:"
echo "1) Mobile Kotlin"
echo "2) Mobile Flutter"
echo "3) Frontend React"
echo "4) Backend Express"
echo "5) Laravel"
echo "6) Keluar"
echo "======================================="

# Pakai /dev/tty supaya bisa input walau dijalankan via pipe
read -p "Masukkan pilihan (1/2/3/4/5/6): " choice </dev/tty

case $choice in
  1)
    echo ">> Download & jalankan installer Mobile Kotlin..."
    curl -s $BASE_URL/mobile-kotlin.sh | bash
    ;;
  2)
    echo ">> Download & jalankan installer Mobile Flutter..."
    curl -s $BASE_URL/mobile-flutter.sh | bash
    ;;
  3)
    echo ">> Download & jalankan installer Frontend React..."
    curl -s $BASE_URL/frontend-react.sh | bash
    ;;
  4)
    echo ">> Download & jalankan installer Backend Express..."
    curl -s $BASE_URL/backend-express.sh | bash
    ;;
  5)
    echo ">> Download & jalankan installer Laravel..."
    curl -s $BASE_URL/laravel.sh | bash
    ;;
  6)
    echo "Keluar."
    exit 0
    ;;
  *)
    echo "Pilihan tidak valid!"
    ;;
esac
