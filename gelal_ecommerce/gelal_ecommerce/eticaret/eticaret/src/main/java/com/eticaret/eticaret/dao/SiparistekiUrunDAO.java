package com.eticaret.eticaret.dao;

import com.eticaret.eticaret.model.SiparistekiUrun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SiparistekiUrunDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Tüm siparişteki ürünleri getir
    public List<SiparistekiUrun> getAllSiparistekiUrun() {
        String sql = "SELECT * FROM siparistekiurunler";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new SiparistekiUrun(
                rs.getInt("siparisId"),
                rs.getInt("urunId"),
                rs.getInt("adet")
        ));
    }

    // Sipariş ID'sine göre ürünleri getir
    public List<SiparistekiUrun> getSiparistekiUrunBySiparisId(int siparisId) {
        String sql = "SELECT * FROM siparistekiurunler WHERE siparisId = ?";
        return jdbcTemplate.query(sql, new Object[]{siparisId}, (rs, rowNum) -> new SiparistekiUrun(
                rs.getInt("siparisId"),
                rs.getInt("urunId"),
                rs.getInt("adet")
        ));
    }

    // Yeni siparişteki ürünü ekle
    public void addSiparistekiUrun(SiparistekiUrun urun) {
        String sql = "INSERT INTO siparistekiurunler (siparisId, urunId, adet) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, urun.getSiparisId(), urun.getUrunId(), urun.getAdet());
    }

    // Siparişteki ürünü güncelle
    public void updateSiparistekiUrun(SiparistekiUrun urun, int oldSiparisId, int oldUrunId) {
        String sql = "UPDATE siparistekiurunler SET siparisId = ?, urunId = ?, adet = ? WHERE siparisId = ? AND urunId = ?";
        jdbcTemplate.update(sql, urun.getSiparisId(), urun.getUrunId(), urun.getAdet(), oldSiparisId, oldUrunId);
    }

    // Siparişteki ürünü sil
    public void deleteSiparistekiUrun(int siparisId, int urunId) {
        String sql = "DELETE FROM siparistekiurunler WHERE siparisId = ? AND urunId = ?";
        jdbcTemplate.update(sql, siparisId, urunId);
    }
}
