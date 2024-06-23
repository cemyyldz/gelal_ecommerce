<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<style>
  footer {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    background-color: #343a40;
    color: white;
    padding: 20px;
  }
  footer .col {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin-bottom: 20px;
  }
  footer .logo {
    margin-bottom: 30px;
  }
  footer h4 {
    font-size: 14px;
    padding-bottom: 20px;
  }
  footer p {
    font-size: 13px;
    margin: 0 0 8px 0;
  }
  footer a {
    font-size: 13px;
    text-decoration: none;
    color: #fff;
    margin: 0 0 10px 0;
  }
  footer .follow {
    margin-top: 20px;
  }
  footer .follow i {
    color: #465b52;
    padding-right: 4px;
    cursor: pointer;
  }
  footer .install .row img {
    border: 1px solid #088178;
    border-radius: 6px;
    margin: 10px 0 15px 0;
  }
  footer .follow i:hover,
  footer a:hover {
    color: #088178;
  }
  footer .whatsapp-button {
    background-color: #25D366;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
  }
  footer .whatsapp-button:hover {
    background-color: #128C7E;
  }
  footer .copyright {
    width: 100%;
    text-align: center;
  }
</style>
</head>
<body>
  <footer class="section-p1">
    <div class="col">
      <h4>Contact</h4>
      <p><strong>Address:</strong> Atakum Samsun</p>
      <p><strong>Phone:</strong> +90 500 500 50 50</p>
      <p><strong>Hours:</strong> 7/24</p>
      <button class="whatsapp-button" onclick="window.open('https://web.whatsapp.com', '_blank')">WhatsApp</button>
    </div>
    <div class="col">
      <h4>About</h4>
      <a href="#">About us</a>
      <a href="#">Delivery Information</a>
      <a href="#">Privacy Policy</a>
      <a href="#">Terms & Conditions</a>
      <a href="#">Contact Us</a>
    </div>
    <div class="col">
      <h4>My Account</h4>
      <a href="#">Sign In</a>
      <a href="#">View Cart</a>
      <a href="#">My Wishlist</a>
      <a href="#">Track My Order</a>
      <a href="#">Help</a>
    </div>
    <div class="col install">
      <h4>Install App</h4>
      <p>From App Store or Google Play</p>
      <div class="row">
        <img src="./resources/assets/app.jpg" alt="appstore" />
        <img src="./resources/assets/play.jpg" alt="playstore" />
      </div>
    </div>
  </footer>
</body>
</html>
