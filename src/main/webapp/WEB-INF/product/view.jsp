<%--
  Created by IntelliJ IDEA.
  User: I
  Date: 2024-04-25
  Time: 오후 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<html>
<head>
    <meta charset="utf-8">
    <title>책 상세페이지</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

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

    <link href="/resources/resources/css/product.css" rel="stylesheet">

    <!-- 별점 매기기 사용 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
</head>

<body>
<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>

<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>



<!-- Modal Search Start -->
<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content rounded-0">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-75 mx-auto d-flex">
                    <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Search End -->


<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
    <h1 class="text-center text-white display-6">Shop Detail</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">Shop Detail</li>
    </ol>
</div>
<!-- Single Page Header End -->


<!-- Single Product Start -->
<div class="container-fluid py-5 mt-5">
    <div class="container py-5">
        <div class="pro_view_title">
            <h1>${product.pro_name}</h1>
            <div class="pro_view_titleP">
                <div class="d-flex">
                    <span class="pro_view_titleV">${product.pro_writer}</span>
                    <span class="pro_view_titleV">${product.pro_company}</span>
                    <span class="pro_view_titleV">${product.pro_reg_date}</span>
                </div>
            </div>

        </div>
        <div class="row g-4 mb-5">
            <div class="col-lg-8 col-xl-9">
                <div class="row g-4">
                    <div class="col-lg-6">
                        <div class="border rounded">
                            <div class="bookImg">
                                <img src="/resources/resources/img/books/${product.pro_image}" width="100%" height="100%">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <h4 class="fw-bold mb-3">${product.pro_name}</h4>
                        <div class="d-flex mb-4">
                            <c:choose>
                                <c:when test="${review_star_avg eq '1'}">
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </c:when>
                                <c:when test="${review_star_avg eq '2'}">
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </c:when>
                                <c:when test="${review_star_avg eq '3'}">
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </c:when>
                                <c:when test="${review_star_avg eq '4'}">
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="book_content1">
                            <h5 class="fw-bold mb-3 text-danger text-decoration-line-through">정가 : <fmt:formatNumber value="${product.pro_price}" pattern="#,###"/>원</h5>
                            <h3 class="fw-bold mb-3">할인가 : <fmt:formatNumber value="${product.pro_sale_price}" pattern="#,###"/>원</h3>
                        </div>
                        <div class="book_content1">
                            <h5>마일리지 : </h5>
                            <h5>배송료 : 3,000원</h5>
                            <br>
                            <p>재고량 : ${product.pro_amount}권</p>
                        </div>


                        <div class="input-group quantity mb-5" style="width: 100px; margin-top: 15px;">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="form-control form-control-sm text-center border-0" value="1">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <a href="/member/cart?member_id=" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary payBtn"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니</a>
                        <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary payBtn"><i class="fas fa-copyright me-2 text-primary"></i> 바로구매</a>

                    </div>
                    <div class="col-lg-12">
                        <nav>
                            <div class="nav nav-tabs mb-3">
                                <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                        id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                        aria-controls="nav-about" aria-selected="true">Description</button>
                                <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                        id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                        aria-controls="nav-mission" aria-selected="false">Reviews</button>
                                <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                        id="nav-QnA-tab" data-bs-toggle="tab" data-bs-target="#nav-QnA"
                                        aria-controls="nav-QnA" aria-selected="false">Q&A</button>
                            </div>
                        </nav>
                        <div class="tab-content mb-5">
                            <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                <br>
                                <h4>출판사 제공 북트레일러</h4>
                                <br>
                                <div class="px-2">
                                    <div class="row g-4">
                                        <div class="book_video">
                                            <iframe src="${product.pro_video}" width="90%" height="500px"></iframe>
                                        </div>
                                    </div>
                                </div>

                                <h4>책 소개</h4>

                                <p>${pro_content}</p>
                            </div>
                            <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                                <form name="frmDelete" id="frmDelete" method="post" action="/product/reviewDelete">

                                    <c:choose>
                                        <c:when test="${reviewVO != null}">
                                            <c:forEach var="review" items="${reviewVO}">
                                                <div class="d-flex">
                                                    <input type="hidden" name="pro_idx" id="pro_idx" value="${review.pro_idx}"/>
                                                    <input type="hidden" name="review_idx" id="review_idx" value="${review.review_idx}"/>
                                                    <img src="img/avatar.jpg" class="img-fluid rounded-circle p-3" style="width: 100px; height: 100px;" alt="">
                                                    <div class="d-flex">
                                                        <div class="">
                                                            <p class="mb-2" style="font-size: 14px;">${review.review_reg_date}</p>
                                                            <div class="d-flex justify-content-between">
                                                                <h5>${review.member_id}</h5>
                                                                <div class="d-flex mb-3">
                                                                    <c:choose>
                                                                        <c:when test="${review.review_star eq '1'}">
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star"></i>
                                                                            <i class="fa fa-star"></i>
                                                                            <i class="fa fa-star"></i>
                                                                            <i class="fa fa-star"></i>
                                                                        </c:when>
                                                                        <c:when test="${review.review_star eq '2'}">
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star"></i>
                                                                            <i class="fa fa-star"></i>
                                                                            <i class="fa fa-star"></i>
                                                                        </c:when>
                                                                        <c:when test="${review.review_star eq '3'}">
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star"></i>
                                                                            <i class="fa fa-star"></i>
                                                                        </c:when>
                                                                        <c:when test="${review.review_star eq '4'}">
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star"></i>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                            <i class="fa fa-star text-secondary"></i>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                            </div>
                                                            <h5>${review.review_title}</h5>
                                                            <p>${review.review_content}</p>

                                                        </div>
                                                        <button type="submit" onclick="goDelete()" id="review_delete_btn" name="review_delete_btn" class="btn border border-secondary text-primary rounded-pill px-4 py-3 review_del_btn">삭제</button>
                                                    </div>
                                                </div>

                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <p>리뷰가 없습니다.</p>
                                        </c:otherwise>
                                    </c:choose>
                                </form>
                            </div>
                        </div>
                    </div>
                    <form name="frmReview" id="frmReview" action="/product/view" method="post">
                        <h4 class="mb-5 fw-bold">리뷰 작성하기</h4>
                        <div class="row g-4">
                                <input type="hidden" name="pro_idx" value="${product.pro_idx}">
                                <div class="col-lg-12">
                                    <div class="border-bottom rounded">
                                        <input type="text" name="review_title" id="review_title"  class="form-control border-0" placeholder="제목을 입력하세요 *">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="border-bottom rounded my-4">
                                        <textarea name="review_content" id="review_content" class="form-control border-0" cols="30" rows="8" placeholder="리뷰 내용을 입력하세요 *" spellcheck="false"></textarea>
                                    </div>
                                </div>

                                <br>

                                <div class="rating">

                                    <span class="rating__result star_span"></span>
                                    <i class="fa fa-star text-secondary first_star"></i>
                                    <i class="rating__star far fa-star"></i>
                                    <i class="rating__star far fa-star"></i>
                                    <i class="rating__star far fa-star"></i>
                                    <i class="rating__star far fa-star"></i>
                                </div>
                                <button type="submit" name="reviewBtn" id="reviewBtn" class="btn border border-secondary text-primary rounded-pill px-4 py-3 review_regist_btn">작성 완료</button>
                                <input type="hidden" name="review_star" id="review_star" class="rating__input" readonly/>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 col-xl-3">
                <div class="row g-4 fruite">
                    <div class="col-lg-12 ">
                        <form id="frmSearch" name="frmSearch" action="/product/main" method="get">
                            <div class="input-group w-100 mx-auto d-flex mb-4">
                                <input type="search" name="search_word" id="search_word" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                <span id="search-icon-1" class="input-group-text p-3" onclick="searchProducts();"><i class="fa fa-search"></i></span>
                            </div>
                        </form>
                        <div class="mb-3 sidebar_menu px-3">
                            <h4>Categories</h4>
                            <div class="empty"></div>
                            <ul class="list-unstyled ps-0 fruite-categorie M01">
                                <li class="mb-1 "><a class="nav-link fas fa-apple-alt" href="/product/main?pro_category1=유아">유아</a>
                                    <ul class="twoDepth M02">
                                        <li><a href="/product/main?pro_category1=유아&pro_category3=한글">한글</a></li>
                                        <li><a href="/product/main?pro_category1=유아&pro_category3=영어">영어</a></li>
                                        <li><a href="/product/main?pro_category1=유아&pro_category3=수학">수학</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="list-unstyled ps-0 fruite-categorie M01">
                                <li class="mb-1 "><a class="nav-link fas fa-apple-alt" href="/product/main?pro_category1=초등">초등</a>
                                    <ul class="M02">
                                        <li><a href="/product/main?pro_category1=초등&pro_category2=1">1학년</a>
                                            <ul class="M03">
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=1&pro_category3=국어">국어</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=1&pro_category3=영어">영어</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=1&pro_category3=수학">수학</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=1&pro_category3=사회">사회</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=1&pro_category3=과학">과학</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/product/main?pro_category1=초등&pro_category2=2">2학년</a>
                                            <ul class="M03">
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=2&pro_category3=국어">국어</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=2&pro_category3=영어">영어</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=2&pro_category3=수학">수학</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=2&pro_category3=사회">사회</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=2&pro_category3=과학">과학</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/product/main?pro_category1=초등&pro_category2=3">3학년</a>
                                            <ul class="M03">
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=3&pro_category3=국어">국어</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=3&pro_category3=영어">영어</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=3&pro_category3=수학">수학</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=3&pro_category3=사회">사회</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=3&pro_category3=과학">과학</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/product/main?pro_category1=초등&pro_category2=4">4학년</a>
                                            <ul class="M03">
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=4&pro_category3=국어">국어</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=4&pro_category3=영어">영어</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=4&pro_category3=수학">수학</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=4&pro_category3=사회">사회</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=4&pro_category3=과학">과학</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/product/main?pro_category1=초등&pro_category2=5">5학년</a>
                                            <ul class="M03">
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=5&pro_category3=국어">국어</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=5&pro_category3=영어">영어</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=5&pro_category3=수학">수학</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=5&pro_category3=사회">사회</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=5&pro_category3=과학">과학</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/product/main?pro_category1=초등&pro_category2=6">6학년</a>
                                            <ul class="M03">
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=6&pro_category3=국어">국어</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=6&pro_category3=영어">영어</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=6&pro_category3=수학">수학</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=6&pro_category3=사회">사회</a></li>
                                                <li><a href="/product/main?pro_category1=초등&pro_category2=6&pro_category3=과학">과학</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="list-unstyled ps-0 fruite-categorie M01">
                                <li class="mb-1 "><a class="nav-link fas fa-apple-alt" href="/product/main?pro_category1=중등">중등</a>
                                    <ul class="M02">
                                        <li class=""><a href="/product/main?pro_category1=중등&pro_category2=1">1학년</a>
                                            <ul class="M03">
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=1&pro_category3=국어">국어</a></li>
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=1&pro_category3=영어">영어</a></li>
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=1&pro_category3=수학">수학</a></li>
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=1&pro_category3=사회">사회</a></li>
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=1&pro_category3=과학">과학</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/product/main?pro_category1=중등&pro_category2=2">2학년</a>
                                            <ul class="M03">
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=2&pro_category3=국어">국어</a></li>
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=2&pro_category3=영어">영어</a></li>
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=2&pro_category3=수학">수학</a></li>
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=2&pro_category3=사회">사회</a></li>
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=2&pro_category3=과학">과학</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/product/main?pro_category1=중등&pro_category2=3">3학년</a>
                                            <ul class="M03">
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=3&pro_category3=국어">국어</a></li>
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=3&pro_category3=영어">영어</a></li>
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=3&pro_category3=수학">수학</a></li>
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=3&pro_category3=사회">사회</a></li>
                                                <li><a href="/product/main?pro_category1=중등&pro_category2=3&pro_category3=과학">과학</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="list-unstyled ps-0 fruite-categorie M01">
                                <li class="mb-1 "><a class="nav-link fas fa-apple-alt" href="/product/main?pro_category1=고등">고등</a>
                                    <ul class="twoDepth M02">
                                        <li class=""><a href="/product/main?pro_category1=고등&pro_category2=1">1학년</a>
                                            <ul class="M03">
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=1&pro_category3=국어">국어</a></li>
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=1&pro_category3=영어">영어</a></li>
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=1&pro_category3=수학">수학</a></li>
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=1&pro_category3=사회">사회</a></li>
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=1&pro_category3=과학">과학</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/product/main?pro_category1=고등&pro_category2=2">2학년</a>
                                            <ul class="M03">
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=2&pro_category3=국어">국어</a></li>
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=2&pro_category3=영어">영어</a></li>
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=2&pro_category3=수학">수학</a></li>
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=2&pro_category3=사회">사회</a></li>
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=2&pro_category3=과학">과학</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/product/main?pro_category1=고등&pro_category2=3">3학년</a>
                                            <ul class="M03">
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=3&pro_category3=국어">국어</a></li>
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=3&pro_category3=영어">영어</a></li>
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=3&pro_category3=수학">수학</a></li>
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=3&pro_category3=사회">사회</a></li>
                                                <li><a href="/product/main?pro_category1=고등&pro_category2=3&pro_category3=과학">과학</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <h1 class="fw-bold mb-0">Related products</h1>
        <div class="vesitable">
            <div class="owl-carousel vegetable-carousel justify-content-center">
                <div class="border border-primary rounded position-relative vesitable-item">
                    <div class="vesitable-img">
                        <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                    </div>
                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
                    <div class="p-4 pb-0 rounded-bottom">
                        <h4>Parsely</h4>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                        <div class="d-flex justify-content-between flex-lg-wrap">
                            <p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
                            <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                        </div>
                    </div>
                </div>
                <div class="border border-primary rounded position-relative vesitable-item">
                    <div class="vesitable-img">
                        <img src="img/vegetable-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                    </div>
                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
                    <div class="p-4 pb-0 rounded-bottom">
                        <h4>Parsely</h4>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                        <div class="d-flex justify-content-between flex-lg-wrap">
                            <p class="text-dark fs-5 fw-bold">$4.99 / kg</p>
                            <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                        </div>
                    </div>
                </div>
                <div class="border border-primary rounded position-relative vesitable-item">
                    <div class="vesitable-img">
                        <img src="img/vegetable-item-3.png" class="img-fluid w-100 rounded-top bg-light" alt="">
                    </div>
                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
                    <div class="p-4 pb-0 rounded-bottom">
                        <h4>Banana</h4>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                        <div class="d-flex justify-content-between flex-lg-wrap">
                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                            <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                        </div>
                    </div>
                </div>
                <div class="border border-primary rounded position-relative vesitable-item">
                    <div class="vesitable-img">
                        <img src="img/vegetable-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">
                    </div>
                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
                    <div class="p-4 pb-0 rounded-bottom">
                        <h4>Bell Papper</h4>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                        <div class="d-flex justify-content-between flex-lg-wrap">
                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                            <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                        </div>
                    </div>
                </div>
                <div class="border border-primary rounded position-relative vesitable-item">
                    <div class="vesitable-img">
                        <img src="img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                    </div>
                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
                    <div class="p-4 pb-0 rounded-bottom">
                        <h4>Potatoes</h4>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                        <div class="d-flex justify-content-between flex-lg-wrap">
                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                            <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                        </div>
                    </div>
                </div>
                <div class="border border-primary rounded position-relative vesitable-item">
                    <div class="vesitable-img">
                        <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                    </div>
                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
                    <div class="p-4 pb-0 rounded-bottom">
                        <h4>Parsely</h4>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                        <div class="d-flex justify-content-between flex-lg-wrap">
                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                            <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                        </div>
                    </div>
                </div>
                <div class="border border-primary rounded position-relative vesitable-item">
                    <div class="vesitable-img">
                        <img src="img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                    </div>
                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
                    <div class="p-4 pb-0 rounded-bottom">
                        <h4>Potatoes</h4>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                        <div class="d-flex justify-content-between flex-lg-wrap">
                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                            <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                        </div>
                    </div>
                </div>
                <div class="border border-primary rounded position-relative vesitable-item">
                    <div class="vesitable-img">
                        <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                    </div>
                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
                    <div class="p-4 pb-0 rounded-bottom">
                        <h4>Parsely</h4>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                        <div class="d-flex justify-content-between flex-lg-wrap">
                            <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                            <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Single Product End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>


<script>
    //별점 매기기
    const ratingStars = [...document.getElementsByClassName("rating__star")];
    const ratingResult = document.querySelector(".rating__result");

    printRatingResult(ratingResult);

    function executeRating(stars, result) {
        const starClassActive = "rating__star fas fa-star";
        const starClassUnactive = "rating__star far fa-star";
        const starsLength = stars.length;
        let i;

        stars.map((star) => {
            star.onclick = () => {
                i = stars.indexOf(star);

                if (star.className.indexOf(starClassUnactive) !== -1) {
                    printRatingResult(result, i + 2);
                    for (i; i >= 0; --i) stars[i].className = starClassActive;
                } else {
                    printRatingResult(result, i);
                    for (i; i < starsLength; ++i) stars[i].className = starClassUnactive;
                }
            };
        });
    }

    function printRatingResult(result, num = 1) {
        /*result.textContent = (num || 1)+ "/5";*/
        document.querySelector('.rating__input').value = (num || 1);
        //input 태그에 num값 담기
    }
    executeRating(ratingStars, ratingResult);


    //리뷰 등록하기
    const frmReview = document.getElementById("frmReview");
    const review_title = document.querySelector("#review_title");
    const review_content = document.querySelector("#review_content");

    document.querySelector("#reviewBtn").addEventListener("click", function(e) {

        e.preventDefault();
        e.stopPropagation();

        if(review_title.value.length == "") {
            e.preventDefault();
            review_title.focus();
            return alert("제목을 입력하세요.");
        }

        if(review_content.value.length == "") {
            e.preventDefault();
            review_content.focus();
            return alert("내용을 입력하세요.");
        }

        frmReview.submit();
    }, false);


    function goDelete() {
        const frm = document.getElementById("frmDelete");
        let confirm_flag = confirm("해당 리뷰를 삭제하시겠습니까?");
        if(confirm_flag) {
            frm.submit();
        }
    }


    // 페이지 로딩 시작 시 스피너 보여주기
    document.getElementById('spinner').style.display = 'flex';

    // 페이지 로딩 완료 시 스피너 숨기기
    window.onload = function() {
        document.getElementById('spinner').style.display = 'none';
    };

    //검색창
    function searchProducts() {
        var search_word = document.getElementById('search_word').value;
        window.location.href = '/product/main?search_word=' + encodeURIComponent(search_word);


        //엔터키로 검색 가능
        document.getElementById('search_word').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                searchProducts();
            }
        });

    }

</script>

<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/resources/lib/easing/easing.min.js"></script>
<script src="/resources/resources/lib/waypoints/waypoints.min.js"></script>
<script src="/resources/resources/lib/lightbox/js/lightbox.min.js"></script>
<script src="/resources/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/resources/resources/js/main.js"></script>
</body>

</html>
