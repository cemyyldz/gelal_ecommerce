package com.eticaret.eticaret.model;

import java.util.ArrayList;
import java.util.List;

public class Sepet {
    private int id;
    private int userId;
    private List<SepettekiUrun> urunler = new ArrayList<>();

    public Sepet() {
    }

    public Sepet(int id, int userId) {
        this.id = id;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public List<SepettekiUrun> getUrunler() {
        return urunler;
    }

    public void setUrunler(List<SepettekiUrun> urunler) {
        this.urunler = urunler;
    }

    public void urunEkle(Urun urun, int adet) {
        for (SepettekiUrun sepettekiUrun : urunler) {
            if (sepettekiUrun.getUrun().getId() == urun.getId()) {
                sepettekiUrun.setAdet(sepettekiUrun.getAdet() + adet);
                return;
            }
        }
        urunler.add(new SepettekiUrun( urun, adet));
    }
}
