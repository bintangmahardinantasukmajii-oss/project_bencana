CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TYPE hazard_type AS ENUM ('banjir', 'gempa');
CREATE TYPE alert_status AS ENUM ('draf', 'menunggu_persetujuan', 'disetujui', 'ditolak', 'terkirim', 'dicabut');
CREATE TYPE staff_role AS ENUM ('operator', 'supervisor', 'admin');

CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  phone_enc BYTEA NOT NULL,
  phone_hash BYTEA NOT NULL UNIQUE,
  home_location GEOGRAPHY(Point, 4326) NOT NULL,
  home_subdistrict TEXT,
  push_token TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE staff_users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  role staff_role NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE alerts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  hazard_type hazard_type NOT NULL,
  severity SMALLINT NOT NULL,
  title TEXT NOT NULL,
  message TEXT NOT NULL,
  recommended_action TEXT NOT NULL,
  status alert_status NOT NULL DEFAULT 'draf',
  created_by UUID NOT NULL REFERENCES staff_users(id),
  approved_by UUID REFERENCES staff_users(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  approved_at TIMESTAMPTZ,
  sent_at TIMESTAMPTZ
);

CREATE TABLE shelters (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  address TEXT NOT NULL,
  location GEOGRAPHY(Point, 4326) NOT NULL,
  capacity INT NOT NULL,
  occupied INT DEFAULT 0,
  is_active BOOLEAN DEFAULT true
);

CREATE TABLE audit_logs (
  id BIGSERIAL PRIMARY KEY,
  actor_id UUID NOT NULL REFERENCES staff_users(id),
  action TEXT NOT NULL,
  details JSONB,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
