package com.eticaret.eticaret.model;

public class Siparis {
    private int id;
    private String odemeYontemi;
    private double tutar;
    private String adres;
    private int userId;

    public Siparis() {
    }

    public Siparis(int id, String odemeYontemi, double tutar, String adres , int userId) {
        this.id = id;
        this.odemeYontemi = odemeYontemi;
        this.tutar = tutar;
        this.adres = adres;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOdemeYontemi() {
        return odemeYontemi;
    }

    public void setOdemeYontemi(String odemeYontemi) {
        this.odemeYontemi = odemeYontemi;
    }

    public double getTutar() {
        return tutar;
    }

    public void setTutar(double tutar) {
        this.tutar = tutar;
    }

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
}
