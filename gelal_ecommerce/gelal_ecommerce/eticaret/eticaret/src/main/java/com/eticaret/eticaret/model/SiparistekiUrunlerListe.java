package com.eticaret.eticaret.model;

public class SiparistekiUrunlerListe {
	private int adet;
	private Urun urun;
	private String adres;
	private String odemeYontemi;
	
	public Urun getUrun() {
		return urun;
	}
	public void setUrun(Urun urun) {
		this.urun = urun;
	}
	public int getAdet() {
		return adet;
	}
	public void setAdet(int adet) {
		this.adet = adet;
	}
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getOdemeYontemi() {
		return odemeYontemi;
	}
	public void setOdemeYontemi(String odemeYontemi) {
		this.odemeYontemi = odemeYontemi;
	}
	
	

}