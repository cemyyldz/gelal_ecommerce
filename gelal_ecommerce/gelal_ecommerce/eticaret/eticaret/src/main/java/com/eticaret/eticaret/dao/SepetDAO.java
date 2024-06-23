package com.eticaret.eticaret.dao;

import com.eticaret.eticaret.model.Sepet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SepetDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Tüm sepetleri getir
    public List<Sepet> getAllSepetler() {
        String sql = "SELECT * FROM sepetler";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new Sepet(
                rs.getInt("id"),
                rs.getInt("userId")
        ));
    }

    // Sepeti ID'ye göre getir
    public Sepet getSepetById(int id) {
        String sql = "SELECT * FROM sepetler WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> new Sepet(
                rs.getInt("id"),
                rs.getInt("userId")
        ));
    }

    // Yeni sepet ekle
    public void addSepet(Sepet sepet) {
        String sql = "INSERT INTO sepetler (userId) VALUES (?)";
        jdbcTemplate.update(sql, sepet.getUserId());
    }

    // Sepeti User ID'ye göre getir
    public Sepet getSepetByUserId(int userId) {
        String sql = "SELECT * FROM sepetler WHERE userId = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{userId}, (rs, rowNum) -> new Sepet(
                rs.getInt("id"),
                rs.getInt("userId")
        ));
    }

    // Sepeti güncelle
    public void updateSepet(Sepet sepet) {
        String sql = "UPDATE sepetler SET userId = ? WHERE id = ?";
        jdbcTemplate.update(sql, sepet.getUserId(), sepet.getId());
    }

    // Sepeti sil
    public void deleteSepet(int id) {
        String sql = "DELETE FROM sepetler WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}
