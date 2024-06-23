<%@page import="com.eticaret.eticaret.model.Kullanici"%>
<%@page import="com.eticaret.eticaret.model.Urun"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>GELAL</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 1280px;
            width: 100%;
            margin: 0 auto;
            padding: 0 15px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #eaeaea;
            padding: 10px 0;
        }

        .navbar {
            display: flex;
            align-items: center;
            gap: 30px;
        }

        .navbar li {
            font-size: 20px;
            list-style: none;
        }

        .navbar li:hover {
            text-decoration: underline;
            cursor: pointer;
        }

        .navbar input {
            padding: 5px;
            border: 1px solid #bbb9b9;
            border-radius: 5px;
            width: 250px;
        }

        .navbar-button a {
            padding: 4px 10px;
            background-color: transparent;
            border: 1px solid #bbb9b9;
            border-radius: 5px;
            font-size: 15px;
            text-decoration: none;
            color: #000;
        }

        .navbar-button a:hover {
            background-color: #f57c00;
            color: #fff;
            border-color: #f57c00;
        }

        .carousel-item img {
            height: 400px;
            object-fit: cover;
        }

        .card {
            margin-bottom: 20px;
            border: none;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card img {
            height: 200px;
            object-fit: cover;
            border-bottom: 1px solid #eaeaea;
        }

        .card-body {
            padding: 15px;
        }

        .card .lead {
            font-size: 1.25em;
            font-weight: bold;
        }

        .card .text-muted {
            color: #6c757d !important;
        }

        .card .text-danger {
            color: #dc3545 !important;
        }

        .card .btn-primary {
            background-color: #007bff;
            border: none;
            transition: background-color 0.2s;
            width: 100%;
            margin-top: 10px;
        }

        .card .btn-primary:hover {
            background-color: #0056b3;
        }

        .card .fa-star {
            color: #f39c12;
        }

        .offer-tag {
            background-color: #17a2b8;
            color: #fff;
            font-weight: bold;
            border-radius: 50%;
            width: 35px;
            height: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .product-info .price {
            font-size: 1.5em;
            font-weight: bold;
            color: #333;
        }

        footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
        }

        footer .col {
            margin-bottom: 20px;
        }

        footer h4, footer p, footer a {
            color: white;
        }

        footer a:hover {
            color: #088178;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
    <div class="container-fluid">
        <div id="carouselExample" class="carousel slide h-50 mt-3" data-bs-ride="carousel">
            <div class="carousel-inner h-100">
                <div class="carousel-item active">
                    <img src="./resources/assets/flas.webp" class="d-block w-100" alt="..." />
                </div>
                <div class="carousel-item">
                    <img src="./resources/assets/macip.webp" class="d-block w-100" alt="..." />
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <h1 class="mt-5 mb-5">Ürünlerimiz</h1>
        <section>
            <div>
                <div class="row d-flex justify-content-center">
                    <% 
                    List<Urun> urunler = (List<Urun>) request.getAttribute("urunler");
                    if (urunler != null) {
                        for (Urun urun : urunler) {
                    %>
                    <div class="col-md-12 col-lg-3">
                        <div class="card">
                            <div class="d-flex justify-content-between p-3">
                                
                                <div class="offer-tag">x4</div>
                            </div>
                            <img src="<%= urun.getResimUrl() %>" class="card-img-top" alt="Product" />
                            <div class="card-body">
                                <div class="product-info">
                                    <p class="small">
                                        <a href="#!" class="text-muted">Elektronik</a>
                                    </p>
                                    <p class="small text-danger"><s><%= String.valueOf(urun.getFiyat()) %></s></p>
                                </div>
                                <div class="product-info mb-3">
                                    <h5 class="mb-0"><%= urun.getIsim() %></h5>
                                    <h5 class="price"><%= urun.getFiyat() %> ₺</h5>
                                </div>
                                <p class="text-muted mb-2">Available: <span class="fw-bold">6</span></p>
                                <div class="text-warning mb-2">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <a href="<%= "/eticaret/addToCart/" + urun.getId() %>" class="btn btn-primary btn-sm">Sepete Ekle</a>
                            </div>
                        </div>
                    </div>
                    <% 
                        }
                    }
                    %>
                </div>
            </div>
        </section>
        <hr />
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px">
                        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px">
                        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px">
                        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px">
                        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid offer pt-5">
            <div class="row px-xl-5">
                <div class="col-md-6 pb-4">
                    <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                        <div class="position-relative" style="z-index: 1">
                            <h5 class="text-uppercase mb-3">20% off the all order</h5>
                            <h1 class="mb-4 font-weight-semi-bold">Spring Collection</h1>
                            <a href="" class="btn py-md-2 px-md-3">Shop Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 pb-4">
                    <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                        <div class="position-relative" style="z-index: 1">
                            <h5 class="text-uppercase mb-3">20% off the all order</h5>
                            <h1 class="mb-4 font-weight-semi-bold">Winter Collection</h1>
                            <a href="" class="btn py-md-2 px-md-3">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
