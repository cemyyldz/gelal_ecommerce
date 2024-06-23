package com.eticaret.eticaret.dao;

import com.eticaret.eticaret.model.Urun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UrunDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Tüm ürünleri getir
    public List<Urun> getAllUrunler() {
        String sql = "SELECT * FROM urunler";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new Urun(
                rs.getInt("id"),
                rs.getString("isim"),
                rs.getString("aciklama"),
                rs.getString("resimUrl"),
                rs.getDouble("fiyat")
        ));
    }

    // Ürünü ID'ye göre getir
    public Urun getUrunById(int id) {
        String sql = "SELECT * FROM urunler WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> new Urun(
                rs.getInt("id"),
                rs.getString("isim"),
                rs.getString("aciklama"),
                rs.getString("resimUrl"),
                rs.getDouble("fiyat")
        ));
    }

    // Yeni ürün ekle
    public void addUrun(Urun urun) {
        String sql = "INSERT INTO urunler (isim, aciklama, resimUrl, fiyat) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, urun.getIsim(), urun.getAciklama(), urun.getResimUrl(), urun.getFiyat());
    }

    // Ürünü güncelle
    public void updateUrun(Urun urun) {
        String sql = "UPDATE urunler SET isim = ?, aciklama = ?, resimUrl = ?, fiyat = ? WHERE id = ?";
        jdbcTemplate.update(sql, urun.getIsim(), urun.getAciklama(), urun.getResimUrl(), urun.getFiyat(), urun.getId());
    }

    // Ürünü sil
    public void deleteUrun(int id) {
        String sql = "DELETE FROM urunler WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}
