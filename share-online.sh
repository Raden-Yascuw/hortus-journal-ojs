#!/bin/bash
# Script untuk membagikan OJS lokal (XAMPP) secara online agar anggota kelompok
# bisa login ke dashboard OJS dan upload artikel dummy secara real-time.
echo "Memastikan Apache & MySQL XAMPP berjalan..."
sudo /opt/lampp/lampp start
echo ""
echo "Membuka tunnel publik ke http://localhost:80 ..."
echo "Bagikan URL https://....lhr.life/ojs/index.php/Horsju yang muncul di bawah ke anggota kelompok Anda:"
ssh -R 80:localhost:80 nokey@localhost.run
