package com.eticaret.eticaret.model;

public class Urun {
    private int id;
    private String isim;
    private String aciklama;
    private String resimUrl;
    private double fiyat;

    public Urun() {
    }

    public Urun(int id, String isim, String aciklama, String resimUrl, double fiyat) {
        this.id = id;
        this.isim = isim;
        this.aciklama = aciklama;
        this.resimUrl = resimUrl;
        this.fiyat = fiyat;
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

    public String getAciklama() {
        return aciklama;
    }

    public void setAciklama(String aciklama) {
        this.aciklama = aciklama;
    }

    public String getResimUrl() {
        return resimUrl;
    }

    public void setResimUrl(String resimUrl) {
        this.resimUrl = resimUrl;
    }

    public double getFiyat() {
        return fiyat;
    }

    public void setFiyat(double fiyat) {
        this.fiyat = fiyat;
    }
}
