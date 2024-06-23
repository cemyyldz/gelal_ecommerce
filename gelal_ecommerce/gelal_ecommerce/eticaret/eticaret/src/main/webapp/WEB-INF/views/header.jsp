<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="com.eticaret.eticaret.model.Kullanici"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #343a40;
            padding: 10px 20px;
        }
        .navbar-brand {
            color: #f57c00;
            font-size: 1.5em;
        }
        .navbar-brand:hover {
            color: #e67e22;
        }
        .nav-link {
            color: #fff;
            font-size: 1.2em;
        }
        .nav-link:hover {
            color: #f57c00;
        }
        .form-control {
            border-radius: 30px;
            font-size: 1.2em;
            padding: 10px 20px;
        }
        .btn-outline-success {
            color: #f57c00;
            border-color: #f57c00;
            font-size: 1.2em;
            padding: 10px 20px;
        }
        .btn-outline-success:hover {
            color: #fff;
            background-color: #f57c00;
            border-color: #f57c00;
        }
        .navbar-button a {
            padding: 10px 20px;
            background-color: #f57c00;
            border: 1px solid #f57c00;
            border-radius: 10px;
            font-size: 1.2em;
            text-decoration: none;
            color: white;
            transition: background-color 0.3s;
        }
        .navbar-button a:hover {
            background-color: #e67e22;
        }
        .navbar-button {
            display: flex;
            gap: 10px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <img src="./resources/assets/logo.webp" alt="logo" height="100" />
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Anasayfa</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Ürünler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Kategoriler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Hakkımızda</a>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Arama.." aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Ara</button>
                </form>
                <div class="navbar-button ms-auto">
                    <% HttpSession httpSession = request.getSession();
                    Kullanici kullanici = (Kullanici) httpSession.getAttribute("user");
                    if (kullanici != null) { %>
                        <a href="./sepet">Sepete Git</a>
                        <a href="./profil">Profile Git</a>
                        <a href="./eticaret/src/main/webapp/WEB-INF/views/home.jsp">Çıkış Yap</a>
                    <% } else { %>
                        <a href="./login.html">Giriş Yap</a>
                        <a href="./register.html">Üye Ol</a>
                        <a href="./admin/login.html">Admin Girişi</a>
                    <% } %>
                </div>
            </div>
        </div>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
