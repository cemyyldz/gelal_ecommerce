<%@page import="com.eticaret.eticaret.model.SepettekiUrunListe"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sepet</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    background-color: #f5f5f5;
    font-family: Arial, sans-serif;
}
.container {
    margin-top: 30px;
}
.table thead {
    background-color: #ff6600;
    color: white;
}
.table tbody tr:hover {
    background-color: #f9f9f9;
}
.table td img {
    max-width: 70px;
}
.cart-summary {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.cart-summary h3 {
    color: #ff6600;
}
.btn-primary {
    background-color: #ff6600;
    border: none;
}
.btn-primary:hover {
    background-color: #e65c00;
}
.btn-danger {
    background-color: #e65c00;
    border: none;
}
.btn-danger:hover {
    background-color: #cc5200;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
    <div class="container">
        <section id="cart" class="section-p1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Remove</th>
                        <th scope="col">Image</th>
                        <th scope="col">Product</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <% HttpSession existingSession = request.getSession();
                    List<SepettekiUrunListe> urunler = (List<SepettekiUrunListe>) existingSession.getAttribute("sepettekiUrunler");
                    double toplam = 0;
                    if (urunler != null) {
                        for (SepettekiUrunListe urun : urunler) {
                            double urunToplam = urun.getUrun().getFiyat() * urun.getAdet();
                            toplam += urunToplam;
                    %>
                    <tr>
                        <td><a href="/eticaret/removeFromCart/<%= urun.getUrun().getId() %>"><i class="fas fa-times-circle" style="color: black"></i></a></td>
                        <td><img src="<%= urun.getUrun().getResimUrl() %>" alt="<%= urun.getUrun().getIsim() %>" /></td>
                        <td><%= urun.getUrun().getIsim() %></td>
                        <td><%= urun.getUrun().getFiyat() %> ₺</td>
                        <td><input type="number" value="<%= urun.getAdet() %>" readonly /></td>
                        <td><%= urunToplam %> ₺</td>
                    </tr>
                    <% }
                    } else { %>
                    <tr>
                        <td colspan="6" class="text-center">Sepetinizde ürün bulunmamaktadır.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </section>

        <section id="cart-add" class="section-p1 mt-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="cart-summary">
                        <h3>Apply Coupon</h3>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Enter Your Coupon">
                            <button class="btn btn-primary" type="button">Apply</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="cart-summary">
                        <h3>Cart Totals</h3>
                        <form method="post" action="/eticaret/createOrder">
                            <table class="table">
                                <tr>
                                    <td>Cart Subtotal</td>
                                    <td><%= toplam %> ₺</td>
                                </tr>
                                <tr>
                                    <td>Shipping</td>
                                    <td>Free</td>
                                </tr>
                                <tr>
                                    <td><strong>Total</strong></td>
                                    <td><strong><%= toplam %> ₺</strong></td>
                                </tr>
                            </table>
                            <div class="form-group">
                                <select id="odeme-yontemi" name="odemeyontemi" class="form-select">
                                    <option value="kredi-karti">Kredi Kartı</option>
                                    <option value="nakit">Nakit</option>
                                </select>
                            </div>
                            <div class="form-group mt-3">
                                <input type="hidden" name="totalPrice" value="<%= toplam %>" />
                                <textarea name="adres" placeholder="Adresinizi giriniz" class="form-control"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary mt-3">Proceed to checkout</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>
