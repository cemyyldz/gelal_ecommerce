<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ürün Detayları</title>
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
        <h2 class="text-center mb-4">Ürün Ekle / Düzenle</h2>
        <div class="d-flex justify-content-center align-items-center">
            <form method="post" action="/admin/addProduct" class="w-50 card">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingPassword" name="resimUrl" placeholder="Ürün Resmi URL">
                    <label for="floatingPassword">Ürün Resmi URL</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="isim" id="floatingPassword" placeholder="Ürün Adı">
                    <label for="floatingPassword">Ürün Adı</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingPassword" name="aciklama" placeholder="Ürün Açıklaması">
                    <label for="floatingPassword">Ürün Açıklaması</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" name="fiyat" id="floatingPassword" placeholder="Ürün Fiyatı">
                    <label for="floatingPassword">Ürün Fiyatı</label>
                </div>
                <button type="submit" class="btn btn-success w-100">Kaydet</button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
