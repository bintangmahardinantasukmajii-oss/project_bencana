# Tanggap Lampung - Sistem Peringatan Dini & Informasi Darurat Bencana

Sistem Peringatan Dini Bencana (Banjir & Gempa) berbasis Rust, PostgreSQL + PostGIS, dan HTMX.
Kerjasama BPBD Kota Bandar Lampung & Universitas Teknokrat Indonesia.

## Deploy UI ke Vercel

Paket ini sudah dilengkapi `vercel.json` untuk deployment UI sebagai static site.

- Framework Preset: `Other`
- Root Directory: `./`
- Build Command: kosong
- Output Directory: `.`
- Install Command: kosong

Lihat `README-VERCEL.md` untuk langkah lengkap.

## Jalankan lokal

### Demo UI

Buka `index.html` di browser.

### Full-stack Docker

```bash
docker compose up -d --build
```

Akses `http://localhost:3000`.

## Catatan deployment

Deployment Vercel pada paket ini menjalankan UI/static site. Server Rust di `src/main.rs` dan PostgreSQL/PostGIS di `migrations` tetap disiapkan untuk deployment backend terpisah.

## Pengembang
- **Mahasiswa:** Bintang Mahardinanta Sukmaji
- **Dosen Pembimbing:** Dr. Erliyan Redy Susanto, M.Kom

## Hak Cipta
Copyright©2026 by Bintang Mahardinanta Sukmaji dan Dr. Erliyan Redy Susanto, M.Kom
