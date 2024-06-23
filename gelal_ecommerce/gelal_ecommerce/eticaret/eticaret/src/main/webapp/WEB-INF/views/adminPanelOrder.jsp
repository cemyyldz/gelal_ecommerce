<%@page import="com.eticaret.eticaret.model.SiparistekiUrunlerListe"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sipariş İşlemleri</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border: none;
            border-radius: 10px;
            padding: 20px;
        }
    </style>
    <jsp:include page="adminPanelHeader.jsp" />
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3>Siparişler</h3>
        </div>
        <div class="table-responsive card">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">İsim</th>
                        <th scope="col">Adres</th>
                        <th scope="col">Sipariş Durumu</th>
                        <th scope="col">Detay</th>
                        <th scope="col">Onayla</th>
                        <th scope="col">İptal Et</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    List<SiparistekiUrunlerListe> urunler = (List<SiparistekiUrunlerListe>) request.getAttribute("siparisurunleri");
                    int index = 1;
                    for (SiparistekiUrunlerListe urun : urunler) { 
                    %>
                    <tr>
                        <th scope="row"><%= index++ %></th>
                        <td><%= urun.getUrun().getIsim() %></td>
                        <td><%= urun.getAdres() %></td>
                        <td>Ödeme Alindi</td>
                        <td>
                            <a href="/adminPanelOrderDetail.html" class="btn btn-warning btn-sm">Detay</a>
                        </td>
                        <td>
                            <button class="btn btn-success btn-sm">Onayla</button>
                        </td>
                        <td>
                            <button class="btn btn-danger btn-sm">İptal Et</button>
                        </td>
                    </tr>
                    <% 
                    } 
                    %>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
