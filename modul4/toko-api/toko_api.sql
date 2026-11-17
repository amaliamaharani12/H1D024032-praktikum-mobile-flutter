-- Database: toko_api
CREATE DATABASE IF NOT EXISTS toko_api;
USE toko_api;

-- 1. SQL membuat tabel member
CREATE TABLE IF NOT EXISTS member (
    id INT NOT NULL AUTO_INCREMENT,
    nama VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

-- 2. SQL membuat tabel member_token
CREATE TABLE IF NOT EXISTS member_token (
    id INT NOT NULL AUTO_INCREMENT,
    member_id INT NOT NULL,
    auth_key VARCHAR(255) NOT NULL,
    FOREIGN KEY (member_id) REFERENCES member(id) ON UPDATE CASCADE ON DELETE NO ACTION,
    PRIMARY KEY(id)
);

-- 3. SQL membuat tabel produk
CREATE TABLE IF NOT EXISTS produk (
    id INT NOT NULL AUTO_INCREMENT,
    kode_produk VARCHAR(255) NOT NULL,
    nama_produk VARCHAR(255) NOT NULL,
    harga INT NOT NULL,
    PRIMARY KEY(id)
);
