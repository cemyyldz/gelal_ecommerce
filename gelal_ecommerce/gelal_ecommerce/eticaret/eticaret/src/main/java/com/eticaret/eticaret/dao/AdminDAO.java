package com.eticaret.eticaret.dao;

import com.eticaret.eticaret.model.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Admin> getAllAdminler() {
        String sql = "SELECT * FROM admin";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new Admin(
                rs.getInt("id"),
                rs.getString("email"),
                rs.getString("password")
        ));
    }

    // Admini ID'ye göre getir
    public Admin getAdminById(int id) {
        String sql = "SELECT * FROM admin WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> new Admin(
                rs.getInt("id"),
                rs.getString("email"),
                rs.getString("password")
        ));
    }

    // Yeni admin ekle
    public void addAdmin(Admin admin) {
        String sql = "INSERT INTO admin (email, password) VALUES (?, ?)";
        jdbcTemplate.update(sql, admin.getEmail(), admin.getPassword());
    }

    // Admini güncelle
    public void updateAdmin(Admin admin) {
        String sql = "UPDATE admin SET email = ?, password = ? WHERE id = ?";
        jdbcTemplate.update(sql, admin.getEmail(), admin.getPassword(), admin.getId());
    }

    // Admini sil
    public void deleteAdmin(int id) {
        String sql = "DELETE FROM admin WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    public Admin getAdminByEmail(String email) {
        String sql = "SELECT * FROM admin WHERE email = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{email}, (rs, rowNum) -> new Admin(
                rs.getInt("id"),
                rs.getString("email"),
                rs.getString("password")
        ));
    }
}
