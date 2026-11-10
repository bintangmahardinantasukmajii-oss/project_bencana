# Tanggap Lampung — Vercel Ready

Paket ini disiapkan agar UI `index.html` dapat dideploy sebagai static site di Vercel.

## Deploy dari GitHub

1. Buat repository baru di GitHub.
2. Upload **seluruh isi folder ini** ke repository. `vercel.json` harus berada satu level dengan `index.html`.
3. Di Vercel pilih **Add New → Project** lalu import repository tersebut.
4. Pengaturan:
   - Framework Preset: `Other`
   - Root Directory: `./`
   - Build Command: kosong
   - Output Directory: `.`
   - Install Command: kosong
5. Klik **Deploy**.

## Deploy dengan Vercel CLI

Dari folder project:

```bash
npm i -g vercel
vercel
```

Untuk production:

```bash
vercel --prod
```

## Catatan penting

Paket ini mendeploy **UI/static website**. Backend Rust pada `src/main.rs` dan PostgreSQL/PostGIS pada folder `migrations` tidak dijalankan oleh Vercel static deployment.

Jika aplikasi membutuhkan API/database sungguhan, backend Rust perlu dideploy ke layanan yang mendukung proses server/container yang berjalan, dan database PostgreSQL/PostGIS ditempatkan pada layanan database yang sesuai. URL API kemudian dapat dihubungkan dari frontend.

## Struktur utama

```text
.
├── index.html
├── vercel.json
├── .vercelignore
├── Cargo.toml
├── Dockerfile
├── docker-compose.yml
├── .env.example
├── src/
├── templates/
└── migrations/
```
