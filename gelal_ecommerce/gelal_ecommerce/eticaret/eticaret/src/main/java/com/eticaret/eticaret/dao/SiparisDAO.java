package com.eticaret.eticaret.dao;

import com.eticaret.eticaret.model.Siparis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;

@Repository
public class SiparisDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Tüm siparişleri getir
    public List<Siparis> getAllSiparisler() {
        String sql = "SELECT * FROM siparisler";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new Siparis(
                rs.getInt("id"),
                rs.getString("odemeYontemi"),
                rs.getDouble("tutar"),
                rs.getString("adres"),
                rs.getInt("userId")
        ));
    }

    // Siparişi ID'ye göre getir
    public Siparis getSiparisById(int id) {
        String sql = "SELECT * FROM siparisler WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> new Siparis(
                rs.getInt("id"),
                rs.getString("odemeYontemi"),
                rs.getDouble("tutar"),
                rs.getString("adres"),
                rs.getInt("userId")
        ));
    }

    // Yeni sipariş ekle
    public int addSiparis(Siparis siparis) {
        String sql = "INSERT INTO siparisler (odemeYontemi, tutar, adres, userId) VALUES (?, ?, ?, ?)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        
        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, siparis.getOdemeYontemi());
            ps.setDouble(2, siparis.getTutar());
            ps.setString(3, siparis.getAdres());
            ps.setInt(4, siparis.getUserId());
            return ps;
        }, keyHolder);
        
        return keyHolder.getKey().intValue();
    }

    public List<Siparis> getSiparislerByUserId(int userId) {
        String sql = "SELECT * FROM siparisler WHERE userId = ?";
        return jdbcTemplate.query(sql, new Object[]{userId}, (rs, rowNum) -> new Siparis(
                rs.getInt("id"),
                rs.getString("odemeYontemi"),
                rs.getDouble("tutar"),
                rs.getString("adres"),
                rs.getInt("userId")
        ));
    }
    // Siparişi sil
    public void deleteSiparis(int id) {
        String sql = "DELETE FROM siparisler WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}
