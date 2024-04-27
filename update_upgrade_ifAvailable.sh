#!/bin/bash

# Clear terminal screen
clear

# Mendapatkan dimensi terminal
rows=$(tput lines)
cols=$(tput cols)

# Mengecek ketersediaan pembaruan paket
updates_available=$(apt list --upgradable 2>/dev/null)

# Memeriksa apakah string updates_available mengandung kata "Listing" atau kosong
if [[ "$updates_available" == *Listing* || -z "$updates_available" ]]; then
    # Tidak ada pembaruan paket yang tersedia
    clear  # Membersihkan layar sebelum menampilkan pesan
    message="Semua paket sudah terbaru."
    message_row=$(( ($rows - 1) / 2 ))
    tput cup $message_row $(( ($cols - ${#message}) / 2 ))
    echo "$message"
    echo ""
else
    # Terdapat pembaruan paket
    # Mendapatkan jumlah baris di daftar pembaruan
    updates_rows=$(echo "$updates_available" | wc -l)

    # Menampilkan pesan selamat datang di tengah layar
    welcome_message="Selamat Datang di Cek Pembaruan Paket"
    welcome_row=$(( ($rows - $updates_rows - 6) / 2 ))
    tput cup $welcome_row $(( ($cols - ${#welcome_message}) / 2 ))
    echo "$welcome_message"
    echo ""

    # Menampilkan daftar pembaruan
    echo "Terdapat paket yang dapat diperbarui:"
    echo ""
    echo "$updates_available"
    echo ""

    # Menampilkan prompt untuk memperbarui paket di tengah layar
    prompt_message="Apakah Anda ingin memperbarui paket? (y/n): "
    prompt_row=$(( $welcome_row + $updates_rows + 3 ))
    tput cup $prompt_row $(( ($cols - ${#prompt_message}) / 2 ))
    read -p "$prompt_message" choice

    if [ "$choice" == "y" ]; then
        echo ""
        echo "Memperbarui paket..."
        echo ""
        apt upgrade
    else
        echo ""
        echo "Pembaruan paket dibatalkan."
        echo ""
    fi
fi

# Menampilkan pesan penutup di tengah layar
closing_message="Semua paket sudah terbaru."
sleep 2
clear
closing_message="Proses program berikutnya..."

closing_row=$(( $rows - 1 ))
tput cup $closing_row $(( ($cols - ${#closing_message}) / 2 ))
echo "$closing_message"
echo ""

# Mengembalikan kursor ke posisi default
tput cup $rows $cols

