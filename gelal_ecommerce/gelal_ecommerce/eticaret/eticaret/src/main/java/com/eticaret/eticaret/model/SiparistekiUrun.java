package com.eticaret.eticaret.model;

public class SiparistekiUrun {
    private int siparisId;
    private int urunId;
    private int adet;

    public SiparistekiUrun() {
    }

    public SiparistekiUrun(int siparisId, int urunId, int adet) {
        this.siparisId = siparisId;
        this.urunId = urunId;
        this.adet = adet;
    }

    public int getSiparisId() {
        return siparisId;
    }

    public void setSiparisId(int siparisId) {
        this.siparisId = siparisId;
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
}
