-- --------------------------------------------------------
-- Host:                         localhost
-- Versi server:                 5.7.24 - MySQL Community Server (GPL)
-- OS Server:                    Win64
-- HeidiSQL Versi:               10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- membuang struktur untuk table prakerin.tbl_bimbingan
CREATE TABLE IF NOT EXISTS `tbl_bimbingan` (
  `kdbimbingan` int(11) NOT NULL AUTO_INCREMENT,
  `kdpenempatan` int(11) NOT NULL,
  `nip` char(21) NOT NULL,
  `nis` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` varchar(50) NOT NULL,
  `catatan` text NOT NULL,
  `file` text,
  `source` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kdbimbingan`),
  KEY `kdpenempatan` (`kdpenempatan`),
  KEY `nis` (`nis`),
  CONSTRAINT `tbl_bimbingan_ibfk_1` FOREIGN KEY (`kdpenempatan`) REFERENCES `tbl_penempatan` (`kdpenempatan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_bimbingan_ibfk_2` FOREIGN KEY (`nis`) REFERENCES `tbl_siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel prakerin.tbl_bimbingan: ~5 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_bimbingan` DISABLE KEYS */;
INSERT INTO `tbl_bimbingan` (`kdbimbingan`, `kdpenempatan`, `nip`, `nis`, `tanggal`, `judul`, `catatan`, `file`, `source`, `type`) VALUES
	(6, 21, '082285498005', 6400, '2021-10-10', 'testing', 'adad', 'lampiran/bimbingan/andre.PNG', 'pembimbing', NULL),
	(7, 18, '123456789', 2015420064, '2021-10-10', 'Test Bimbingan', 'Ini hanya percobaan', 'lampiran/bimbingan/0001.png', '', NULL),
	(9, 21, '082285498005', 6400, '2021-10-12', 'bimbingan 1', 'ini bimbingan yang saya buat pak ', 'lampiran/bimbingan/1._SPESIFIKASI_TEKNIK_Rehab_DPRD5.pdf', 'siswa', NULL),
	(10, 21, '082285498005', 6400, '2021-10-12', 'dad', 'tes', 'lampiran/bimbingan/Rancangan_Kontrak.pdf', 'siswa', NULL),
	(11, 21, '082285498005', 6400, '2021-10-12', 'tes2', 'tes2', 'lampiran/bimbingan/1._SPESIFIKASI_TEKNIK_Rehab_DPRD1.pdf', 'siswa', NULL),
	(12, 21, '082285498005', 6400, '2021-10-14', 'bimbingan', 'catatan', NULL, 'siswa', NULL),
	(13, 21, '082285498005', 6400, '2021-10-14', 'bimbingan', 'vimbingan', 'lampiran/bimbingan/1._SPESIFIKASI_TEKNIK_Rehab_DPRD2.pdf', 'siswa', '.pdf'),
	(14, 21, '082285498005', 6400, '2021-10-14', 'dad', 'adad', 'lampiran/bimbingan/b2.png', 'siswa', '.png');
/*!40000 ALTER TABLE `tbl_bimbingan` ENABLE KEYS */;

-- membuang struktur untuk table prakerin.tbl_file
CREATE TABLE IF NOT EXISTS `tbl_file` (
  `kdfile` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `nama` text NOT NULL,
  `share` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`kdfile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel prakerin.tbl_file: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_file` DISABLE KEYS */;
INSERT INTO `tbl_file` (`kdfile`, `judul`, `tanggal`, `nama`, `share`, `keterangan`) VALUES
	(2, 'Contoh 1', '2021-08-23', 'x8-sandbox-Apk.png', 0, 'Ini hanya contoh');
/*!40000 ALTER TABLE `tbl_file` ENABLE KEYS */;

-- membuang struktur untuk table prakerin.tbl_info
CREATE TABLE IF NOT EXISTS `tbl_info` (
  `kdinfo` int(11) NOT NULL AUTO_INCREMENT,
  `kdlabel` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` text NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` text NOT NULL,
  `penulis` varchar(50) NOT NULL,
  PRIMARY KEY (`kdinfo`),
  KEY `kdlabel` (`kdlabel`),
  CONSTRAINT `tbl_info_ibfk_1` FOREIGN KEY (`kdlabel`) REFERENCES `tbl_label` (`kdlabel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel prakerin.tbl_info: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_info` ENABLE KEYS */;

-- membuang struktur untuk table prakerin.tbl_jurusan
CREATE TABLE IF NOT EXISTS `tbl_jurusan` (
  `kdjurusan` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`kdjurusan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel prakerin.tbl_jurusan: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_jurusan` DISABLE KEYS */;
INSERT INTO `tbl_jurusan` (`kdjurusan`, `nama`) VALUES
	(1, 'TI'),
	(2, 'TS');
/*!40000 ALTER TABLE `tbl_jurusan` ENABLE KEYS */;

-- membuang struktur untuk table prakerin.tbl_kelas
CREATE TABLE IF NOT EXISTS `tbl_kelas` (
  `kdkelas` int(11) NOT NULL AUTO_INCREMENT,
  `kdjurusan` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`kdkelas`),
  KEY `kdjurusan` (`kdjurusan`),
  CONSTRAINT `tbl_kelas_ibfk_1` FOREIGN KEY (`kdjurusan`) REFERENCES `tbl_jurusan` (`kdjurusan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel prakerin.tbl_kelas: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_kelas` DISABLE KEYS */;
INSERT INTO `tbl_kelas` (`kdkelas`, `kdjurusan`, `nama`) VALUES
	(1, 1, '1 B'),
	(2, 2, '1A');
/*!40000 ALTER TABLE `tbl_kelas` ENABLE KEYS */;

-- membuang struktur untuk table prakerin.tbl_label
CREATE TABLE IF NOT EXISTS `tbl_label` (
  `kdlabel` int(11) NOT NULL AUTO_INCREMENT,
  `nama_label` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`kdlabel`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel prakerin.tbl_label: ~5 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_label` DISABLE KEYS */;
INSERT INTO `tbl_label` (`kdlabel`, `nama_label`, `keterangan`) VALUES
	(1, 'Pengumuman', '-'),
	(2, 'Tips', '-'),
	(3, 'Industri', '-'),
	(4, 'Sekolah', '-'),
	(5, 'Lain-lain', '-');
/*!40000 ALTER TABLE `tbl_label` ENABLE KEYS */;

-- membuang struktur untuk table prakerin.tbl_nilai
CREATE TABLE IF NOT EXISTS `tbl_nilai` (
  `kdnilai` int(11) NOT NULL AUTO_INCREMENT,
  `kdpenempatan` int(11) NOT NULL,
  `keterangan` enum('Teknis','Non-Teknis','Laporan') NOT NULL,
  `nilai` double NOT NULL,
  PRIMARY KEY (`kdnilai`),
  KEY `kdpenempatan` (`kdpenempatan`),
  CONSTRAINT `tbl_nilai_ibfk_1` FOREIGN KEY (`kdpenempatan`) REFERENCES `tbl_penempatan` (`kdpenempatan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel prakerin.tbl_nilai: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_nilai` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_nilai` ENABLE KEYS */;

-- membuang struktur untuk table prakerin.tbl_pemb
CREATE TABLE IF NOT EXISTS `tbl_pemb` (
  `kdpemb` int(11) NOT NULL AUTO_INCREMENT,
  `kdjurusan` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` text NOT NULL,
  `nip` char(21) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `wilayah` varchar(50) NOT NULL,
  PRIMARY KEY (`kdpemb`),
  KEY `kdjurusan` (`kdjurusan`),
  CONSTRAINT `tbl_pemb_ibfk_1` FOREIGN KEY (`kdjurusan`) REFERENCES `tbl_jurusan` (`kdjurusan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel prakerin.tbl_pemb: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_pemb` DISABLE KEYS */;
INSERT INTO `tbl_pemb` (`kdpemb`, `kdjurusan`, `username`, `password`, `nip`, `nama_lengkap`, `wilayah`) VALUES
	(3, 1, 'muhammad', 'a7777999e260290f68a1455cacdabf6c', '123456789', 'Muhammad Ansori', 'Surabaya'),
	(5, 1, 'lutvi', '7e96f0a92e84e79e04c4da1c83b64755', '082285498005', 'Lutvi', 'Padang');
/*!40000 ALTER TABLE `tbl_pemb` ENABLE KEYS */;

-- membuang struktur untuk table prakerin.tbl_penempatan
CREATE TABLE IF NOT EXISTS `tbl_penempatan` (
  `kdpenempatan` int(11) NOT NULL AUTO_INCREMENT,
  `nis` int(11) NOT NULL,
  `kdpemb` int(11) DEFAULT NULL,
  `nama_industri` varchar(225) NOT NULL,
  `tanggal` date NOT NULL,
  `wilayah` varchar(50) NOT NULL,
  `tahun` year(4) NOT NULL,
  `status` enum('-','proses','ditolak','diterima') NOT NULL,
  `surat` text NOT NULL,
  `deskripsi` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  PRIMARY KEY (`kdpenempatan`),
  KEY `nis` (`nis`),
  CONSTRAINT `tbl_penempatan_ibfk_2` FOREIGN KEY (`nis`) REFERENCES `tbl_siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel prakerin.tbl_penempatan: ~3 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_penempatan` DISABLE KEYS */;
INSERT INTO `tbl_penempatan` (`kdpenempatan`, `nis`, `kdpemb`, `nama_industri`, `tanggal`, `wilayah`, `tahun`, `status`, `surat`, `deskripsi`, `alamat`) VALUES
	(18, 2015420064, 3, 'PT PLN', '2021-08-25', 'Surabaya', '2021', 'diterima', 'Surat_Undangan_Soasialisasi_Magang_untuk_Pihak_Kampus.pdf', 'Kegiatan', 'Embong Trengguli'),
	(21, 6400, 5, 'Teknik', '2021-10-10', '1', '2021', 'diterima', '00022.png', 'dabdalda', 'antahlan'),
	(22, 123456, 3, 'PT Coba', '2021-10-10', 'Surabaya', '2021', 'diterima', '0001.png', 'Jasa', 'Surabaya');
/*!40000 ALTER TABLE `tbl_penempatan` ENABLE KEYS */;

-- membuang struktur untuk table prakerin.tbl_siswa
CREATE TABLE IF NOT EXISTS `tbl_siswa` (
  `nis` int(11) NOT NULL,
  `kdkelas` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `telp` varchar(14) NOT NULL,
  `foto` text NOT NULL,
  `password` text NOT NULL,
  `kdpemb` int(11) DEFAULT NULL,
  PRIMARY KEY (`nis`),
  KEY `kdkelas` (`kdkelas`),
  CONSTRAINT `tbl_siswa_ibfk_1` FOREIGN KEY (`kdkelas`) REFERENCES `tbl_kelas` (`kdkelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel prakerin.tbl_siswa: ~3 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_siswa` DISABLE KEYS */;
INSERT INTO `tbl_siswa` (`nis`, `kdkelas`, `nama_lengkap`, `telp`, `foto`, `password`, `kdpemb`) VALUES
	(6400, 1, 'budi', '082285498005', '11.PNG', 'd6dabcc412981d56c8733b52586a9d44', 5),
	(123456, 1, 'Khairon', '082285498005', '0001.png', 'e10adc3949ba59abbe56e057f20f883e', 3),
	(2015420064, 1, 'Muz Ammar', '082331484634', 'Photo.png', '734794bbc555664f529dc7b5ad485714', 3);
/*!40000 ALTER TABLE `tbl_siswa` ENABLE KEYS */;

-- membuang struktur untuk table prakerin.tbl_status_pendaftaran
CREATE TABLE IF NOT EXISTS `tbl_status_pendaftaran` (
  `id` int(11) NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel prakerin.tbl_status_pendaftaran: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_status_pendaftaran` DISABLE KEYS */;
INSERT INTO `tbl_status_pendaftaran` (`id`, `status`) VALUES
	(1, '1');
/*!40000 ALTER TABLE `tbl_status_pendaftaran` ENABLE KEYS */;

-- membuang struktur untuk table prakerin.tbl_tolak_penempatan
CREATE TABLE IF NOT EXISTS `tbl_tolak_penempatan` (
  `kdtolak` int(11) NOT NULL AUTO_INCREMENT,
  `kdpenempatan` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `alasan` text NOT NULL,
  PRIMARY KEY (`kdtolak`),
  KEY `kdpenempatan` (`kdpenempatan`),
  CONSTRAINT `tbl_tolak_penempatan_ibfk_1` FOREIGN KEY (`kdpenempatan`) REFERENCES `tbl_penempatan` (`kdpenempatan`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel prakerin.tbl_tolak_penempatan: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `tbl_tolak_penempatan` DISABLE KEYS */;
INSERT INTO `tbl_tolak_penempatan` (`kdtolak`, `kdpenempatan`, `tanggal`, `alasan`) VALUES
	(4, 18, '2021-08-25', 'sorry');
/*!40000 ALTER TABLE `tbl_tolak_penempatan` ENABLE KEYS */;

-- membuang struktur untuk table prakerin.tbl_user
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `identitas` varchar(32) NOT NULL,
  `password` text NOT NULL,
  `status` varchar(11) NOT NULL,
  `foto` text NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel prakerin.tbl_user: 1 rows
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` (`id_user`, `username`, `nama_lengkap`, `identitas`, `password`, `status`, `foto`) VALUES
	(1, 'admin', 'Heri Mukti', '', '21232f297a57a5a743894a0e4a801fc3', '-', 'Photo.png');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
