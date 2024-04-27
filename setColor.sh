#!/bin/bash

# Fungsi untuk menata teks dengan warna tertentu
styling_string() {
    local color=$1
    local string=$2

    # Reset ANSI escape sequence
    local reset="\e[0m"

    # Definisikan kode ANSI escape sequence untuk warna yang dipilih
    case "$color" in
        "red")
            local color_code="\e[31m" ;;  # Merah
        "green")
            local color_code="\e[32m" ;;  # Hijau
        "yellow")
            local color_code="\e[33m" ;;  # Kuning
        "blue")
            local color_code="\e[34m" ;;  # Biru
        "cyan")
            local color_code="\e[36m" ;;  # Cyan
        "magenta")
            local color_code="\e[35m" ;;  # Magenta
        *)
            local color_code="\e[39m" ;;  # Warna default (putih)
    esac

    # Cetak teks dengan warna yang dipilih dan reset setelahnya
    echo -e "${color_code}${string}${reset}"
}

# Contoh penggunaan fungsi styling_string
styled_text=$(styling_string "red" "Ini adalah teks berwarna merah!")
echo "$styled_text"



