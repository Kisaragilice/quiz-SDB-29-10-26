CREATE DATABASE IF NOT EXISTS klinik_putra_akbar_alrafshyanjani;
USE klinik_putra_akbar_alrafshyanjani;

CREATE TABLE pasien (
    id_pasien      INT PRIMARY KEY,
    nama_pasien    VARCHAR(100) NOT NULL,
    jenis_kelamin  VARCHAR(15),
    alamat         VARCHAR(150),
    no_hp          VARCHAR(15)
);

CREATE TABLE dokter (
    id_dokter      INT PRIMARY KEY,
    nama_dokter    VARCHAR(100) NOT NULL,
    spesialisasi   VARCHAR(100),
    no_hp          VARCHAR(15)
);

CREATE TABLE pemeriksaan (
    id_pemeriksaan  INT PRIMARY KEY,
    id_pasien       INT,
    id_dokter       INT,
    tanggal_periksa DATE NOT NULL,
    keluhan         VARCHAR(200),
    biaya           DECIMAL(12,2),
    CONSTRAINT fk_pemeriksaan_pasien
        FOREIGN KEY (id_pasien) REFERENCES pasien (id_pasien),
    CONSTRAINT fk_pemeriksaan_dokter
        FOREIGN KEY (id_dokter) REFERENCES dokter (id_dokter)
);

INSERT INTO pasien (id_pasien, nama_pasien, jenis_kelamin, alamat, no_hp) VALUES
(1, 'Andi Saputra',  'Laki-laki', 'Bandar Lampung', '081234567801'),
(2, 'Bunga Lestari', 'Perempuan', 'Metro',          '081234567802'),
(3, 'Citra Amelia',  'Perempuan', 'Pringsewu',      '081234567803'),
(4, 'Dimas Pratama', 'Laki-laki', 'Pesawaran',      '081234567804'),
(5, 'Eka Putri',     'Perempuan', 'Bandar Lampung', '081234567805');

INSERT INTO dokter (id_dokter, nama_dokter, spesialisasi, no_hp) VALUES
(101, 'dr. Rina',  'Umum',  '082234567801'),
(102, 'dr. Budi',  'Gigi',  '082234567802'),
(103, 'dr. Sinta', 'Anak',  '082234567803'),
(104, 'dr. Andi',  'Umum',  '082234567804'),
(105, 'dr. Maya',  'Kulit', '082234567805');

INSERT INTO pemeriksaan (id_pemeriksaan, id_pasien, id_dokter, tanggal_periksa, keluhan, biaya) VALUES
(1, 1, 101, '2026-10-01', 'diare',        200000.00),
(2, 2, 102, '2026-10-02', 'gigi berlubang', 1200000.00),
(3, 1, 103, '2026-10-03', 'demam',        320000.00),
(4, 3, 101, '2026-10-04', 'tipes',        1200000.00),
(5, 4, 105, '2026-10-05', 'cacar',        420000.00),
(6, 5, 104, '2026-10-06', 'dbd',          220000.00);

-- 3. SELECT
SELECT * FROM pasien;

SELECT * FROM dokter
WHERE spesialisasi = 'Umum';

SELECT * FROM pemeriksaan
WHERE biaya > 100000;

SELECT * FROM pemeriksaan
WHERE tanggal_periksa = '2026-10-02';

SELECT
    p.nama_pasien,
    d.nama_dokter,
    pr.tanggal_periksa,
    pr.keluhan,
    pr.biaya
FROM pemeriksaan pr
JOIN pasien p ON pr.id_pasien = p.id_pasien
JOIN dokter d ON pr.id_dokter = d.id_dokter
ORDER BY pr.id_pemeriksaan;

UPDATE pasien
SET alamat = 'Bandar Lampung'
WHERE id_pasien = 2;

UPDATE dokter
SET spesialisasi = 'Penyakit Dalam'
WHERE id_dokter = 104;

UPDATE pemeriksaan
SET biaya = 250000.00
WHERE id_pemeriksaan = 1;

DELETE FROM pemeriksaan
WHERE id_pemeriksaan = 6;

ALTER TABLE pasien
ADD tanggal_lahir DATE;

ALTER TABLE dokter
ADD ruang_praktik VARCHAR(20);

DESCRIBE pasien;
DESCRIBE dokter;
DESCRIBE pemeriksaan;
