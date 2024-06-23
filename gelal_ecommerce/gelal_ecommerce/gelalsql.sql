SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS kullanicilar;
DROP TABLE IF EXISTS sepetler;
DROP TABLE IF EXISTS urunler;
DROP TABLE IF EXISTS siparisler;
DROP TABLE IF EXISTS admin;
DROP TABLE IF EXISTS sepettekiUrun;
DROP TABLE IF EXISTS siparistekiUrunler;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE kullanicilar (
    id INTEGER NOT NULL AUTO_INCREMENT,
    isim VARCHAR(255) NOT NULL,
    sifre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

CREATE TABLE sepetler (
    id INTEGER NOT NULL AUTO_INCREMENT,
    userId INTEGER NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

CREATE TABLE urunler (
    id INTEGER NOT NULL AUTO_INCREMENT,
    isim VARCHAR(255) NOT NULL,
    aciklama VARCHAR(255) NOT NULL,
    resimUrl VARCHAR(255) NOT NULL,
    fiyat VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

CREATE TABLE siparisler (
    id INTEGER NOT NULL AUTO_INCREMENT,
    odemeYontemi VARCHAR(255) NOT NULL,
    tutar DOUBLE NOT NULL,
    userId INTEGER NOT NULL,
    adres VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);

CREATE TABLE admin (
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    id INTEGER NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    UNIQUE (id)
);

CREATE TABLE sepettekiUrun (
    sepetId INTEGER NOT NULL,
    urunId INTEGER NOT NULL,
    adet INTEGER NOT NULL,
    PRIMARY KEY (sepetId, urunId)
);

CREATE TABLE siparistekiUrunler (
    siparisId INTEGER NOT NULL,
    urunId INTEGER NOT NULL,
    adet INTEGER NOT NULL,
    PRIMARY KEY (siparisId, urunId)
);

ALTER TABLE sepetler ADD FOREIGN KEY (userId) REFERENCES kullanicilar(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE siparisler ADD FOREIGN KEY (userId) REFERENCES kullanicilar(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE sepettekiUrun ADD FOREIGN KEY (sepetId) REFERENCES sepetler(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE sepettekiUrun ADD FOREIGN KEY (urunId) REFERENCES urunler(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE siparistekiUrunler ADD FOREIGN KEY (siparisId) REFERENCES siparisler(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE siparistekiUrunler ADD FOREIGN KEY (urunId) REFERENCES urunler(id) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO urunler (isim, aciklama, resimUrl, fiyat) VALUES ('Laptop', 'Yüksek performanslı laptop', 'https://productimages.hepsiburada.net/s/379/222-222/110000397669010.jpg/format:webp', '5000');
INSERT INTO urunler (isim, aciklama, resimUrl, fiyat) VALUES ('Telefon', 'Akıllı telefon', 'https://productimages.hepsiburada.net/s/177/222-222/110000141556218.jpg/format:webp', '3000');
INSERT INTO urunler (isim, aciklama, resimUrl, fiyat) VALUES ('Tablet', 'Portatif ve güçlü tablet', 'https://productimages.hepsiburada.net/s/337/550/110000294957834.jpg/format:webp', '2500');

INSERT INTO urunler (isim, aciklama, resimUrl, fiyat) VALUES ('Akıllı Saat', 'Sağlık takip özellikli akıllı saat', 'https://productimages.hepsiburada.net/s/442/550/110000475798462.jpg/format:webp', '1500');

INSERT INTO urunler (isim, aciklama, resimUrl, fiyat) VALUES ('Kulaklık', 'Kablosuz ve yüksek kaliteli kulaklık', 'https://productimages.hepsiburada.net/s/430/550/110000462400805.jpg/format:webp', '800');

INSERT INTO urunler (isim, aciklama, resimUrl, fiyat) VALUES ('Klavye', 'Mekanik ve RGB aydınlatmalı klavye', 'https://productimages.hepsiburada.net/s/369/550/110000386556036.jpg/format:webp', '600');

INSERT INTO urunler (isim, aciklama, resimUrl, fiyat) VALUES ('Akıllı Ev Asistanı', 'Sesli komutlarla çalışan akıllı ev asistanı', 'https://productimages.hepsiburada.net/s/563/550/110000626991343.jpg/format:webp', '1200');

INSERT INTO admin (email, password) VALUES ('admin@admin.com', '123');