package com.eticaret.eticaret.dao;

import com.eticaret.eticaret.model.Kullanici;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;

@Repository
public class KullaniciDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Tüm kullanıcıları getir
    public List<Kullanici> getAllKullanicilar() {
        String sql = "SELECT * FROM kullanicilar";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new Kullanici(
                rs.getInt("id"),
                rs.getString("isim"),
                rs.getString("sifre"),
                rs.getString("email")
        ));
    }

    // Kullanıcıyı ID'ye göre getir
    public Kullanici getKullaniciById(int id) {
        String sql = "SELECT * FROM kullanicilar WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> new Kullanici(
                rs.getInt("id"),
                rs.getString("isim"),
                rs.getString("sifre"),
                rs.getString("email")
        ));
    }

    // Yeni kullanıcı ekle
    public int addKullanici(Kullanici kullanici) {
        String sql = "INSERT INTO kullanicilar (isim, sifre, email) VALUES (?, ?, ?)";
        KeyHolder keyHolder = new GeneratedKeyHolder(); // Oluşturulan anahtarları tutmak için bir nesne oluşturun
        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, kullanici.getIsim());
            ps.setString(2, kullanici.getSifre());
            ps.setString(3, kullanici.getEmail());
            return ps;
        }, keyHolder);

        int kullaniciId = keyHolder.getKey().intValue();

        return kullaniciId;
    }


    // Kullanıcıyı güncelle
    public void updateKullanici(Kullanici kullanici) {
        String sql = "UPDATE kullanicilar SET isim = ?, sifre = ?, email = ? WHERE id = ?";
        jdbcTemplate.update(sql, kullanici.getIsim(), kullanici.getSifre(), kullanici.getEmail(), kullanici.getId());
    }

    // Kullanıcıyı sil
    public void deleteKullanici(int id) {
        String sql = "DELETE FROM kullanicilar WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
    
    public Kullanici getKullaniciByEmail(String email) {
        String sql = "SELECT * FROM kullanicilar WHERE email = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{email}, (rs, rowNum) -> new Kullanici(
                rs.getInt("id"),
                rs.getString("isim"),
                rs.getString("sifre"),
                rs.getString("email")
        ));
    }
}
