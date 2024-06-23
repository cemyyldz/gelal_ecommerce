<%@page import="com.eticaret.eticaret.model.SiparistekiUrunlerListe"%>
<%@page import="java.util.List"%>
<%@page import="com.eticaret.eticaret.model.Kullanici"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil & Sipariş Detayları</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background: #f2f2f2;
        }
        .container {
            margin-top: 50px;
        }
        .profile-settings {
            background: #fff;
            border-radius: 10px;
            padding: 20px;
        }
        .profile-settings h4 {
            color: #333;
        }
        .profile-settings .labels {
            font-weight: bold;
        }
        .profile-settings .form-control {
            border-radius: 0.25rem;
        }
        .profile-settings .profile-button {
            background-color: #ff6600;
            border: none;
        }
        .profile-settings .profile-button:hover {
            background-color: #e65c00;
        }
        .card-header {
            background-color: #ff6600;
            color: #fff;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .card-footer {
            background-color: #ff6600;
            color: #fff;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }
        .progress-bar {
            background-color: #ff6600;
        }
        .order-details {
            background: #fff;
            border-radius: 10px;
            padding: 20px;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-lg-5">
            <div class="profile-settings border p-4">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4>Profil Ayarları</h4>
                    <h4>
                        <% HttpSession session2 = request.getSession();
                        Kullanici user = (Kullanici) session2.getAttribute("user"); 
                        if (user != null) { 
                            out.print(user.getIsim() + " " + user.getEmail());
                        } else {
                            out.print("Misafir");
                        } %>
                    </h4>
                </div>
                <form>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="labels">Ad</label>
                            <input type="text" class="form-control" value="<%= user != null && user.getIsim().split(" ").length > 0 ? user.getIsim().split(" ")[0] : "" %>" readonly>
                        </div>
                        <div class="col-md-6">
                            <label class="labels">Soyad</label>
                            <input type="text" class="form-control" value="<%= user != null && user.getIsim().split(" ").length > 1 ? user.getIsim().split(" ")[1] : "" %>" readonly>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-12">
                            <label class="labels">Telefon Numarası</label>
                            <input type="text" class="form-control" placeholder="Telefon numarası girin" value="">
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Adres Satırı 1</label>
                            <input type="text" class="form-control" placeholder="Adres satırı 1 girin" value="">
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Posta Kodu</label>
                            <input type="text" class="form-control" placeholder="Posta kodu girin" value="">
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Eyalet</label>
                            <input type="text" class="form-control" placeholder="Eyalet girin" value="">
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Bölge</label>
                            <input type="text" class="form-control" placeholder="Bölge girin" value="">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="labels">Ülke</label>
                            <input type="text" class="form-control" placeholder="Ülke" value="">
                        </div>
                        <div class="col-md-6">
                            <label class="labels">Eyalet/Bölge</label>
                            <input type="text" class="form-control" placeholder="Eyalet/Bölge" value="">
                        </div>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-primary profile-button" type="submit">Profili Kaydet</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-lg-7">
            <div class="order-details">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Siparişiniz için Teşekkürler, <span style="color: #fff;">Anna</span>!</h5>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <p class="lead fw-normal mb-0" style="color: #ff6600;">Makbuz</p>
                            <p class="small text-muted mb-0">Makbuz Numarası : 1KAU9-84UIL</p>
                        </div>
                        <% List<SiparistekiUrunlerListe> urunler = (List<SiparistekiUrunlerListe>) request.getAttribute("siparisurunleri");
                        if (urunler != null) {
                            for (SiparistekiUrunlerListe urun : urunler) { %>
                        <div class="card shadow-0 border mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <img src="<%= urun.getUrun().getResimUrl() %>" class="img-fluid" alt="Ürün Görseli">
                                    </div>
                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                        <p class="text-muted mb-0"><%= urun.getUrun().getIsim() %></p>
                                    </div>
                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                        <p class="text-muted mb-0 small">x<%= urun.getAdet() %></p>
                                    </div>
                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                        <p class="text-muted mb-0 small"><%= urun.getAdres() %></p>
                                    </div>
                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                        <p class="text-muted mb-0 small"><%= urun.getOdemeYontemi() %></p>
                                    </div>
                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                        <p class="text-muted mb-0 small">42999</p>
                                    </div>
                                </div>
                                <hr class="mb-4" style="background-color: #e0e0e0; opacity: 1;">
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-2">
                                        <p class="text-muted mb-0 small">Sipariş Takibi</p>
                                    </div>
                                    <div class="col-md-10">
                                        <div class="progress" style="height: 6px; border-radius: 16px;">
                                            <div class="progress-bar" role="progressbar" style="width: 65%; border-radius: 16px;" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <div class="d-flex justify-content-around mb-1">
                                            <p class="text-muted mt-1 mb-0 small ms-xl-5">Teslim Edilmek Üzere</p>
                                            <p class="text-muted mt-1 mb-0 small ms-xl-5">Teslim Edildi</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% }
                        } %>
                        <div class="d-flex justify-content-between pt-2">
                            <p class="fw-bold mb-0">Sipariş Detayları</p>
                            <p class="text-muted mb-0"><span class="fw-bold me-4">Toplam</span> $898.00</p>
                        </div>
                        <div class="d-flex justify-content-between pt-2">
                            <p class="text-muted mb-0">Fatura Numarası : 788152</p>
                            <p class="text-muted mb-0"><span class="fw-bold me-4">İndirim</span> $19.00</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p class="text-muted mb-0">Fatura Tarihi : 22 Dec,2019</p>
                            <p class="text-muted mb-0"><span class="fw-bold me-4">KDV 18%</span> 123</p>
                        </div>
                        <div class="d-flex justify-content-between mb-5">
                            <p class="text-muted mb-0">Makbuz Numarası : 18KU-62IIK</p>
                            <p class="text-muted mb-0"><span class="fw-bold me-4">Teslimat Ücreti</span> Ücretsiz</p>
                        </div>
                    </div>
                    <div class="card-footer">
                        <h5 class="d-flex align-items-center justify-content-end text-uppercase mb-0">Toplam Ödenen: <span class="h2 mb-0 ms-2">$1040</span></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
