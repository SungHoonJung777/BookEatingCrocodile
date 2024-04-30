<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1>"Hello World!"</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a><br>
</body>
</html-->
<!doctype html>
<html lang="ko">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Google Web Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


  <!-- Icon Font Stylesheet -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

  <!-- Libraries Stylesheet -->
  <link href="/resources/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
  <link href="/resources/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


  <!-- Customized Bootstrap Stylesheet -->
  <link href="/resources/resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Template Stylesheet -->
  <link href="/resources/resources/css/style.css" rel="stylesheet">

  <!-- sidebars css -->
  <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

  <title>책먹는 악어</title>
</head>
<body>
<jsp:include page="WEB-INF/common/header.jsp"></jsp:include>

<!-- Hero Start -->
<div class="container-fluid py-5 mb-5 hero-header">
  <div class="container py-5">
    <div class="row g-5 align-items-center">
      <div class="col-md-12 col-lg-7">
        <h4 class="mb-3 text-secondary">유아 · 초등 · 중등 · 고등 교육 도서</h4>
        <h1 class="mb-5 display-3 text-primary">교육 도서의 모든 것!</h1>
        <div class="position-relative mx-auto">
          <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="number" placeholder="Search">
          <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">Submit Now</button>
        </div>
      </div>
      <div class="col-md-12 col-lg-5">
        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active rounded">

              <img src="img/hero-img-1.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
              <a href="/product/view?pro_idx=${pro_idx}">
                <img src="/resources/resources/">
              </a>

              <a href="#" class="btn px-4 py-2 text-white rounded">Fruites</a>
            </div>
            <div class="carousel-item rounded">
              <img src="img/hero-img-2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
              <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a>
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Hero End -->
<jsp:include page="WEB-INF/common/footer.jsp"></jsp:include>3

<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/resources/lib/easing/easing.min.js"></script>
<script src="/resources/resources/lib/waypoints/waypoints.min.js"></script>
<script src="/resources/resources/lib/lightbox/js/lightbox.min.js"></script>
<script src="/resources/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/resources/resources/js/main.js"></script>

<script src="/resources/resources/assets/dist/js/bootstrap.bundle.min.js"></script>

<script src="/resources/resources/js/sidebars.js"></script>
</body>
</html>
