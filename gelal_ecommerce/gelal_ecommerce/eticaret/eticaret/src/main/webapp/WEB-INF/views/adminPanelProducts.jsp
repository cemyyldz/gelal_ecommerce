<%@page import="com.eticaret.eticaret.model.Urun"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ürün İşlemleri</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .product-card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border: none;
            border-radius: 10px;
            overflow: hidden;
        }
    </style>
    <jsp:include page="adminPanelHeader.jsp" />
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3>Ürün İşlemleri</h3>
            <a href="/eticaret/admin/addProduct" class="btn btn-primary">Ürün Ekle</a>
        </div>
        <div class="row">
            <%
            List<Urun> urunler = (List<Urun>) request.getAttribute("urunler");
            for (Urun urun : urunler) {
            %>
            <div class="col-md-3 mb-4">
                <div class="card product-card">
                    <img src="<%= urun.getResimUrl() %>" class="card-img-top" alt="<%= urun.getIsim() %>" />
                    <div class="card-body">
                        <h5 class="card-title"><%= urun.getIsim() %></h5>
                        <p class="card-text"><%= urun.getAciklama() %></p>
                        <p class="card-text font-weight-bold"><%= urun.getFiyat() %> ₺</p>
                        <a href="/adminPanelProductDetail.html" class="btn btn-warning btn-sm w-100 mb-2">Düzenle</a>
                        <a href="<%= "/eticaret/admin/delete/" + urun.getId() %>" class="btn btn-danger btn-sm w-100">Sil</a>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
