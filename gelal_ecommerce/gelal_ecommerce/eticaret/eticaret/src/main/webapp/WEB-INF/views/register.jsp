<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kayıt Ol</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f5f5f5;
}
.container {
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}
h3 {
    color: #ff6600;
    text-align: center;
}
button {
    background-color: #ff6600;
    border: none;
    padding: 10px;
    color: white;
    border-radius: 5px;
}
button:hover {
    background-color: #e65c00;
}
</style>
</head>
<body>
<div class="container">
    <form action="/eticaret/register" method="post">
        <img src="./resources/assets/logo.webp" alt="Logo" width="300" height="100">
        <h3>Kaydol</h3>
        <div class="mb-3">
            <label for="username" class="form-label">Kullanıcı Adı</label>
            <input type="text" class="form-control" name="isim" placeholder="Kullanıcı Adı" id="username">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="text" class="form-control" name="email" placeholder="Email" id="email">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Şifre</label>
            <input type="password" class="form-control" name="sifre" placeholder="Şifre" id="password">
        </div>
        <button type="submit" class="w-100">Kaydol</button>
    </form>
</div>
</body>
</html>
