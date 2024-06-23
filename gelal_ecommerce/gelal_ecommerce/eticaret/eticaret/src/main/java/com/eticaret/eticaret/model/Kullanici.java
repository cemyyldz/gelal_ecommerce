package com.eticaret.eticaret.model;

public class Kullanici {
    private int id;
    private String isim;
    private String sifre;
    private String email;

    public Kullanici() {
    }

    public Kullanici(int id, String isim, String sifre, String email) {
        this.id = id;
        this.isim = isim;
        this.sifre = sifre;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIsim() {
        return isim;
    }

    public void setIsim(String isim) {
        this.isim = isim;
    }

    public String getSifre() {
        return sifre;
    }

    public void setSifre(String sifre) {
        this.sifre = sifre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
