-- Ejecuta esto en el SQL Editor de tu proyecto Supabase
-- Ve a: tu proyecto → SQL Editor → New query → pega esto → Run

-- Tabla para manga/manhwa/manhua
CREATE TABLE IF NOT EXISTS otaku_mangas (
  id TEXT PRIMARY KEY,
  type TEXT NOT NULL DEFAULT 'manga',
  "titleEs" TEXT NOT NULL,
  "titleEn" TEXT,
  chapter INTEGER DEFAULT 0,
  pct INTEGER DEFAULT 0,
  season INTEGER,
  "where" TEXT,
  start TEXT,
  "end" TEXT,
  rating INTEGER DEFAULT 0,
  img TEXT,
  genres JSONB DEFAULT '[]',
  completado BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabla para anime
CREATE TABLE IF NOT EXISTS otaku_animes (
  id TEXT PRIMARY KEY,
  type TEXT DEFAULT 'anime',
  subtype TEXT DEFAULT 'serie',
  "titleEs" TEXT NOT NULL,
  "titleEn" TEXT,
  year TEXT,
  chapter INTEGER DEFAULT 0,
  pct INTEGER DEFAULT 0,
  season INTEGER,
  "where" TEXT,
  rating INTEGER DEFAULT 0,
  img TEXT,
  genres JSONB DEFAULT '[]',
  completado BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Habilitar acceso público (sin autenticación)
ALTER TABLE otaku_mangas ENABLE ROW LEVEL SECURITY;
ALTER TABLE otaku_animes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow all" ON otaku_mangas FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all" ON otaku_animes FOR ALL USING (true) WITH CHECK (true);

-- Confirmar
SELECT 'Tablas creadas correctamente ✓' AS resultado;
