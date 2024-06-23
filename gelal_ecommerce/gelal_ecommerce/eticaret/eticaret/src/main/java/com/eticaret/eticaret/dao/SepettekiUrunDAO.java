package com.eticaret.eticaret.dao;

import com.eticaret.eticaret.model.SepettekiUrun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SepettekiUrunDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Tüm sepetteki ürünleri getir
    public List<SepettekiUrun> getAllSepettekiUrun() {
        String sql = "SELECT * FROM sepettekiurun";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new SepettekiUrun(
                rs.getInt("sepetId"),
                rs.getInt("urunId"),
                rs.getInt("adet")
        ));
    }

    public void clearSepetBySepetId(int sepetId) {
        String sql = "DELETE FROM sepettekiurun WHERE sepetId = ?";
        jdbcTemplate.update(sql, sepetId);
    }

    // Sepet ID'sine göre ürünleri getir
    public List<SepettekiUrun> getSepettekiUrunBySepetId(int sepetId) {
        String sql = "SELECT * FROM sepettekiurun WHERE sepetId = ?";
        return jdbcTemplate.query(sql, new Object[]{sepetId}, (rs, rowNum) -> new SepettekiUrun(
                rs.getInt("sepetId"),
                rs.getInt("urunId"),
                rs.getInt("adet")
        ));
    }

    public SepettekiUrun getBySepetIdAndProductId(int sepetId, int urunId) {
        String sql = "SELECT * FROM sepettekiurun WHERE sepetId = ? AND urunId = ?";
        List<SepettekiUrun> results = jdbcTemplate.query(sql, new Object[]{sepetId, urunId}, (rs, rowNum) -> new SepettekiUrun(
                rs.getInt("sepetId"),
                rs.getInt("urunId"),
                rs.getInt("adet")
        ));
        return results.isEmpty() ? null : results.get(0);
    }

    // Yeni sepetteki ürünü ekle
    public void addSepettekiUrun(SepettekiUrun urun) {
        String sql = "INSERT INTO sepettekiurun (sepetId, urunId, adet) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, urun.getSepetId(), urun.getUrunId(), urun.getAdet());
    }

    // Sepetteki ürünü güncelle
    public void updateSepettekiUrun(SepettekiUrun urun) {
        String sql = "UPDATE sepettekiurun SET adet = ? WHERE sepetId = ? AND urunId = ?";
        jdbcTemplate.update(sql, urun.getAdet(), urun.getSepetId(), urun.getUrunId());
    }

    // Sepetteki ürünü sil
    public void deleteSepettekiUrun(int sepetId, int urunId) {
        String sql = "DELETE FROM sepettekiurun WHERE sepetId = ? AND urunId = ?";
        jdbcTemplate.update(sql, sepetId, urunId);
    }
}
