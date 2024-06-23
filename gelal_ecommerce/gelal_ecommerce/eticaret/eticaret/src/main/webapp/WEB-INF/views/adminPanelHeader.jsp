<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Panel Header</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand {
            color: #f57c00;
        }
        .navbar-brand:hover {
            color: #e67e22;
        }
        .nav-link {
            color: #fff;
        }
        .nav-link:hover {
            color: #f57c00;
        }
        .form-control {
            border-radius: 20px;
        }
        .btn-outline-success {
            color: #f57c00;
            border-color: #f57c00;
        }
        .btn-outline-success:hover {
            color: #fff;
            background-color: #f57c00;
            border-color: #f57c00;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">GEL AL ADMİN</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/eticaret/admin/products">Ürünler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/eticaret/admin/kullanicilar">Müşteriler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/eticaret/admin/siparisler">Siparişler</a>
                    </li>
                </ul>
                <form class="d-flex ms-auto">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</body>
</html>
