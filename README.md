# Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences (OJS 3.3)

Repositori resmi konfigurasi, aset tema hijau (*Green Academic Pro*), basis data (`ojs_db.sql`), dan portal web **Hortus Journal** untuk Tugas Terstruktur 10 Mata Kuliah Open Access.

## Susunan Tim Editorial
- **Pemimpin Redaksi**: Lidya Amalia Rahmania, S.Kom, M.Kom
- **Journal Manager & Managing Editor**: Mohammad Yanuar Rizky (250911718423)
- **Section Editors**: Nirmala Dwi Lestari (250911723861)
- **Layout Editor, Copyeditor & Production Team**: Nayla Syukurillah (250911721564)

## Struktur Direktori
- `public_site/` — Portal publik statis *Hortus Journal* (siap di-deploy ke **Vercel** untuk akses baca 24 jam).
- `database/ojs_db.sql` — Dump database MySQL/MariaDB lengkap (mencakup konfigurasi jurnal, *Review Form*, akun *Users & Roles*, dan simulasi 5 tahap alur kerja naskah).
- `ojs_custom/` — Template frontend kustom (`header.tpl`, `indexJournal.tpl`, `footer.tpl`), stylesheet (`styleSheet.css`), aset visual, dan berkas naskah (`ojs_files/`).
- `share-online.sh` — Skrip 1-klik untuk mempublikasikan OJS XAMPP lokal secara interaktif ke internet menggunakan SSH Tunnel (`localhost.run`).
