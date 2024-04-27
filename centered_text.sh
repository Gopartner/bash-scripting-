#!/bin/bash

# Fungsi untuk menampilkan data secara rata tengah berdasarkan posisi yang ditentukan
# Parameter 1: Posisi (opsi: 'center-top', 'center', 'center-down')
# Parameter 2: Data atau fungsi yang mengembalikan data

tampilkan_rata_tengah() {
    local posisi="$1"
    local data="$2"

    local lebar_terminal=$(tput cols)  # Mendapatkan lebar terminal
    local tinggi_terminal=$(tput lines)  # Mendapatkan tinggi terminal

    local panjang_data=${#data}

    if [ "$posisi" = "center-top" ]; then
        # Rata tengah secara vertikal (center-top)
        local posisi_y=0  # Mulai dari paling atas
        local posisi_x=$(( ($lebar_terminal - $panjang_data) / 2 ))  # Rata tengah secara horizontal
        echo -ne "\033[${posisi_y};${posisi_x}H"  # Pindahkan kursor ke posisi rata tengah
        echo "$data"
    elif [ "$posisi" = "center" ]; then
        # Rata tengah secara vertikal (center)
        local posisi_y=$(( ($tinggi_terminal - 1) / 2 ))  # Rata tengah secara vertikal
        local posisi_x=$(( ($lebar_terminal - $panjang_data) / 2 ))  # Rata tengah secara horizontal
        echo -ne "\033[${posisi_y};${posisi_x}H"  # Pindahkan kursor ke posisi rata tengah
        echo "$data"
    elif [ "$posisi" = "center-down" ]; then
        # Rata tengah secara vertikal (center-down)
        local posisi_y=$(( $tinggi_terminal - 1 ))  # Mulai dari paling bawah
        local posisi_x=$(( ($lebar_terminal - $panjang_data) / 2 ))  # Rata tengah secara horizontal
        echo -ne "\033[${posisi_y};${posisi_x}H"  # Pindahkan kursor ke posisi rata tengah
        echo "$data"
    else
        echo "Error: Posisi tidak valid. Gunakan 'center-top', 'center', atau 'center-down'."
        return 1
    fi
}

# Contoh penggunaan:
clear  # Membersihkan layar sebelum menampilkan data

# Menampilkan teks "Hello, world!" secara rata tengah atas (center-top)
tampilkan_rata_tengah "center-top" "Hello, world!"

# Menampilkan teks "Ini adalah contoh" secara rata tengah (center)
tampilkan_rata_tengah "center" "Ini adalah contoh"

# Menampilkan teks "Fungsi Bash" secara rata tengah bawah (center-down)
tampilkan_rata_tengah "center-down" "Fungsi Bash"

echo   # Mencetak baris kosong untuk pemisahan

