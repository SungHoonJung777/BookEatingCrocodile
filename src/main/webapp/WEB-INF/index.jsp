<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
--%>
  <link href="/resources/resources/css/bootstrap5.1.3.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <!-- Icon Font Stylesheet -->
  <link rel="stylesheet" href="/resources/resources/css/all.css"/>
  <link href="/resources/resources/css/bootstrap-icons.css" rel="stylesheet">

  <!-- Libraries Stylesheet -->
  <link href="/resources/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
  <link href="/resources/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


  <!-- Customized Bootstrap Stylesheet -->
  <link href="/resources/resources/css/bootstrap.min.css" rel="stylesheet">

  <!-- Template Stylesheet -->
  <link href="/resources/resources/css/style.css" rel="stylesheet">
  <link href="/resources/resources/css/index.css" rel="stylesheet">
  <link href="/resources/resources/css/product.css" rel="stylesheet">
  <!-- sidebars css -->
  <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">
  <link rel="stylesheet" href="/resources/resources/css/docsearch.css">
  <style>
    .goBlack {
      background-color: #4CAF50; /* Green */
      border: none;
      color: white;
      padding: 15px 32px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      cursor: pointer;
      border-radius: 10px;
    }

    /* 호버 효과 */
    .goBlack:hover {
      background-color: #45a049; /* Dark green */
    }

    /* 액티브 효과 */
    .goBlack:active {
      background-color: #4CAF50; /* Green */
      transform: translateY(2px);
    }
  </style>

  <title>책먹는 악어</title>
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>

<!-- Hero Start -->
<div class="container-fluid py-5 mb-5 hero-header">
  <div class="container py-5">
    <div class="row g-5 align-items-center">
      <div class="col-md-12 col-lg-7">
        <h4 class="mb-3 text-secondary">유아 · 초등 · 중등 · 고등 교육 도서</h4>
        <h1 class="mb-5 display-3 text-primary">교육 도서의 모든 것!</h1>
        <div class="position-relative mx-auto">
          <form id="frmSearch" name="frmSearch" method="get" action="/product/main">
            <div class="w-100 mx-auto d-flex">
              <input type="search" name="search_word" id="search_word" style="width:100px" class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" placeholder="keywords" aria-describedby="search-icon-1" value="${responseDTO.search_word}">
              <button type="submit" onclick="searchProducts();" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">Submit Now</button>
            </div>
          </form>
         <%-- <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="number" placeholder="Search">

          <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">Submit Now</button>--%>
        </div>
      </div>
      <div class="col-md-12 col-lg-5">
        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active rounded">
              <img src="/resources/resources/img/index/banner1.png" class="img-fluid w-100 h-100 rounded" alt="First slide">
            </div>
            <div class="carousel-item rounded">
              <img src="/resources/resources/img/index/banner2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
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
<div>
  <div class="w-100 mx-auto d-flex">
    <input type="text" name="search_word" id="" style="width:100px; margin-left: 200px;" class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" placeholder="블랙 프라이데이 참여하기" aria-describedby="search-icon-1" readonly>

    <button type="button"  class="goBlack" style="top: 0; right: 25%;">입장하기</button>

  </div>
</div>
<!-- newList Shop Start-->
<div class="container-fluid vesitable">
  <div class="container py-5">
    <h1 class="mb-0">최신 도서</h1>
    <div class="owl-carousel vegetable-carousel justify-content-center">

      <c:forEach var="newList" items="${indexNewList}">
        <div class="border border-primary rounded position-relative vesitable-item">
          <a href="/product/view?pro_idx=${newList.pro_idx}">
          <div class="vesitable-img">
            <img src="/resources/resources/img/books/${newList.pro_image}" class="img-fluid w-100 rounded-top book_img_size" alt="">
          </div>
          <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">신간 도서</div>

          <div class="p-4 border border-top-0 rounded-bottom book_intro_box">
            <i class="fa fa-star <c:if test='${newList.review_star_avg > 0}'>text-secondary</c:if>"></i>
            <i class="fa fa-star <c:if test='${newList.review_star_avg > 1}'>text-secondary</c:if>"></i>
            <i class="fa fa-star <c:if test='${newList.review_star_avg > 2}'>text-secondary</c:if>"></i>
            <i class="fa fa-star <c:if test='${newList.review_star_avg > 3}'>text-secondary</c:if>"></i>
            <i class="fa fa-star <c:if test='${newList.review_star_avg > 4}'>text-secondary</c:if>"></i>
            <h4>${newList.pro_name}</h4>
            <p>${newList.pro_content}...</p>

            <div class="d-flex justify-content-between flex-lg-wrap">
              <p class="fw-bold mb-3 text-danger text-decoration-line-through">정가 : <fmt:formatNumber value="${newList.pro_price}" pattern="#,###"/>원</p>
              <div class="empty"></div>
              <p class="text-dark fs-5 fw-bold mb-0 sale_price">할인가 : <fmt:formatNumber value="${newList.pro_sale_price}" pattern="#,###"/>원</p>
              <div class="empty2"></div>
<%--              <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary cart_add_box"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니에 추가</a>--%>
            </div>
          </div>
          </a>
        </div>
      </c:forEach>
    </div>
  </div>
</div>
<!-- newList End -->


<!-- popular Shop Start-->
<div class="container-fluid vesitable">
  <div class="container py-5">
    <h1 class="mb-0">인기 도서</h1>
    <div class="owl-carousel vegetable-carousel justify-content-center">
      <c:forEach var="popularList" items="${indexPopularList}">
        <div class="border border-primary rounded position-relative vesitable-item">
          <a href="/product/view?pro_idx=${popularList.pro_idx}">
            <div class="vesitable-img">
              <img src="/resources/resources/img/books/${popularList.pro_image}" class="img-fluid w-100 rounded-top book_img_size" alt="">
            </div>
            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">인기 도서</div>

            <div class="p-4 border border-top-0 rounded-bottom book_intro_box">
              <i class="fa fa-star <c:if test='${popularList.review_star_avg > 0}'>text-secondary</c:if>"></i>
              <i class="fa fa-star <c:if test='${popularList.review_star_avg > 1}'>text-secondary</c:if>"></i>
              <i class="fa fa-star <c:if test='${popularList.review_star_avg > 2}'>text-secondary</c:if>"></i>
              <i class="fa fa-star <c:if test='${popularList.review_star_avg > 3}'>text-secondary</c:if>"></i>
              <i class="fa fa-star <c:if test='${popularList.review_star_avg > 4}'>text-secondary</c:if>"></i>
              <h4>${popularList.pro_name}</h4>
              <p>${popularList.pro_content}...</p>

              <div class="d-flex justify-content-between flex-lg-wrap">
                <p class="fw-bold mb-3 text-danger text-decoration-line-through">정가 : <fmt:formatNumber value="${popularList.pro_price}" pattern="#,###"/>원</p>
                <div class="empty"></div>
                <p class="text-dark fs-5 fw-bold mb-0 sale_price">할인가 : <fmt:formatNumber value="${popularList.pro_sale_price}" pattern="#,###"/>원</p>
                <div class="empty"></div>
<%--                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary cart_add_box"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니에 추가</a>--%>
              </div>
            </div>
          </a>
        </div>
      </c:forEach>
    </div>
  </div>
  <div class="container-fluid banner bg-secondary my-5" style="background-color: #0A3711;">
    <div class="container py-5">
      <div class="row g-4 align-items-center">
        <div class="col-lg-6">
          <div class="py-4">
            <h3 class="display-3 text-white" style="font-size: 45px;">무엇을 살지 고민이 되시군요!</h3>
            <p class="fw-normal display-3 text-dark mb-4" style="font-size: 20px;">책먹는 악어가 책을 추천해드립니다.</p>
            <p class="mb-4 text-dark">책먹는 악어의 최첨단 AI가 당신의 공부 성향에 맞춰 책을 추천해드립니다.</p>
            <a href="#" class="banner-btn btn border-2 border-white rounded-pill text-dark py-3 px-5" id="testBtn">테스트 하기!</a>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="position-relative">
            <img src="/resources/resources/img/choice/mainLogin.jpg" style="background-size: 30px;" class="img-fluid w-100 rounded" alt="" >
<%--
            <div class="d-flex align-items-center justify-content-center bg-white rounded-circle position-absolute" style="width: 140px; height: 140px; top: 0; left: 0;">
--%>

      <%--        <div class="d-flex flex-column" style="background-image: url('/resources/resources/img/choice/logo.png');background-size: cover;">

              </div>--%>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Banner Section Start-->

<!-- popular End -->


<!-- Hero End -->
<jsp:include page="common/footer.jsp"></jsp:include>

<script>
  //검색창
  function searchProducts() {
    const frmSearch = document.getElementById("frmSearch");

    //엔터키로 검색 가능
    document.getElementById('search_word').addEventListener('keypress', function(e) {
      if (e.key === 'Enter') {
        e.preventDefault();
        searchProducts();
      }
    });

    frmSearch.submit();

  }

  document.querySelector("#testBtn").addEventListener("click",function (){
    location.href = '/event/choice';
  })
  document.querySelector(".goBlack").addEventListener("click",function (){
    location.href = '/event/blackFridayStart';
  })
</script>

<!-- JavaScript Libraries -->
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>--%>
<script src="/resources/resources/js/jquery.min.js"></script>
<script src="/resources/resources/js/bundle.min.js"></script>
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
