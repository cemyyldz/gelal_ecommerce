package com.eticaret.eticaret.model;

public class SepettekiUrun {
    private int sepetId;
    private int urunId;
    private int adet;
    private Urun urun;

    public SepettekiUrun() {
    }

    public SepettekiUrun(int sepetId, int urunId, int adet) {
        this.sepetId = sepetId;
        this.urunId = urunId;
        this.adet = adet;
    }

    public SepettekiUrun(Urun urun, int adet) {
        this.urun = urun;
        this.adet = adet;
    }

    public int getSepetId() {
        return sepetId;
    }

    public void setSepetId(int sepetId) {
        this.sepetId = sepetId;
    }

    public int getUrunId() {
        return urunId;
    }

    public void setUrunId(int urunId) {
        this.urunId = urunId;
    }

    public int getAdet() {
        return adet;
    }

    public void setAdet(int adet) {
        this.adet = adet;
    }

    public Urun getUrun() {
        return urun;
    }

    public void setUrun(Urun urun) {
        this.urun = urun;
    }
}
