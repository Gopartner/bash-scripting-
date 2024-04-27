import subprocess

def jalankan_script_bash(nama_file):
    try:
        # Jalankan skrip Bash menggunakan subprocess
        hasil = subprocess.run(['bash', nama_file], check=True, text=True, capture_output=True)
        
        # Ambil output dari skrip Bash
        output = hasil.stdout.strip()
        
        return output
    except subprocess.CalledProcessError as e:
        # Tangani jika terjadi error saat menjalankan skrip Bash
        print(f"Error: {e}")
        return None

# Contoh pemanggilan fungsi untuk menjalankan skrip Bash dari file
output_skrip = jalankan_script_bash('update_upgrade_ifAvailable.sh')
print("Output dari skrip Bash:")
print(output_skrip)

