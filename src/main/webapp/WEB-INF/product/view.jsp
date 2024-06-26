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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
    <%--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="/resources/resources/css/all.css"/>
    <link href="/resources/resources/css/bootstrap-icons.css" rel="stylesheet">
    <!-- Libraries Stylesheet -->
    <link href="/resources/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/resources/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/resources/css/style.css" rel="stylesheet">

    <link href="/resources/resources/css/product.css" rel="stylesheet">

    <!-- 별점 매기기 사용 -->
  <%--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">--%>
    <link rel="stylesheet" href="/resources/resources/css/star.css">

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
<div class="container-fluid page-header py-5 proBanner">
    <h1 class="text-center text-white display-6 "><a href="/product/main" class="proB">BOOK SHOP</a></h1>
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
                    <span class="pro_view_titleV">${fn:substring(product.pro_reg_date, 0, 10)}&nbsp;${fn:substring(product.pro_reg_date, 11, 20)}</span>
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
                            <div class="d-flex mb-3">
                                <i class="fa fa-star <c:if test='${product.review_star_avg > 0}'>text-secondary</c:if>"></i>
                                <i class="fa fa-star <c:if test='${product.review_star_avg > 1}'>text-secondary</c:if>"></i>
                                <i class="fa fa-star <c:if test='${product.review_star_avg > 2}'>text-secondary</c:if>"></i>
                                <i class="fa fa-star <c:if test='${product.review_star_avg > 3}'>text-secondary</c:if>"></i>
                                <i class="fa fa-star <c:if test='${product.review_star_avg > 4}'>text-secondary</c:if>"></i>
                            </div>
                        </div>
                        <div class="book_content1">
                            <h5 class="fw-bold mb-3 text-danger text-decoration-line-through">정가 : <fmt:formatNumber value="${product.pro_price}" pattern="#,###"/>원</h5>
                            <h3 class="fw-bold mb-3">할인가 : <fmt:formatNumber value="${product.pro_sale_price}" pattern="#,###"/>원</h3>
                        </div>
                        <div class="book_content1">
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
                            <input type="text" class="form-control form-control-sm text-center border-0" name="orderBook" id="orderBook" value="1" readonly>
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <c:if test="${product.pro_amount != null}">
                            <div>
                                <a href="javascript:addcart();" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary payBtn"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니</a>
<%--                                <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary payBtn"><i class="fas fa-copyright me-2 text-primary"></i> 바로구매</a>--%>
                            </div>
                        </c:if>
                        <c:if test="${product.pro_amount == null}">
                            <div>
                                <h3>해당 도서는 품절입니다.</h3>
                            </div>
                        </c:if>
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
                            </div>
                        </nav>
                        <div class="tab-content mb-5">
                            <div class="tab-pane active bookIntro" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
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

                            <div class="reviewDiv" id="nav-mission" aria-labelledby="nav-mission-tab">
                                <h4>리뷰</h4>
                                <form name="frmDelete" id="frmDelete" method="post" action="/product/reviewDelete">

                                    <c:choose>
                                        <c:when test="${reviewVO != null}">
                                            <c:forEach var="review" items="${reviewVO}">
                                                <div class="d-flex">
                                                    <input type="hidden" name="pro_idx" id="pro_idx" value="${review.pro_idx}"/>
                                                    <input type="hidden" name="review_idx" id="review_idx" value="${review.review_idx}"/>

                                                    <img src="/resources/resources/uploads/img/member/${review.member_img}" class="img-fluid rounded-circle p-3" style="width: 100px; height: 100px;" alt="">
                                                    <div class="d-flex">
                                                        <div class="">
                                                            <p class="mb-2 text-nowrap" style="font-size: 14px;">${fn:substring(review.review_reg_date, 0, 10)} &nbsp; ${fn:substring(review.review_reg_date, 11, 20)}</p>
                                                            <div class="d-flex">
                                                                <div class="d-flex mb-3">
                                                                    <i class="fa fa-star <c:if test='${review.review_star > 0}'>text-secondary</c:if>"></i>
                                                                    <i class="fa fa-star <c:if test='${review.review_star > 1}'>text-secondary</c:if>"></i>
                                                                    <i class="fa fa-star <c:if test='${review.review_star > 2}'>text-secondary</c:if>"></i>
                                                                    <i class="fa fa-star <c:if test='${review.review_star > 3}'>text-secondary</c:if>"></i>
                                                                    <i class="fa fa-star <c:if test='${review.review_star > 4}'>text-secondary</c:if>"></i>
                                                                </div>
                                                            </div>
                                                            <h5>${review.member_id}</h5>
                                                            <h5>${review.review_title}</h5>
                                                            <p>${review.review_content}</p>
                                                            <div class="empty"></div>
                                                        </div>
                                                        <c:if test="${sessionScope.member_id eq review.member_id || sessionScope.member_id eq 'admin'}">
                                                            <button type="submit" onclick="goDelete()" id="review_delete_btn" name="review_delete_btn" class="btn border border-secondary text-primary rounded-pill px-4 py-3 review_del_btn">삭제</button>
                                                        </c:if>
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
                    <c:if test="${sessionScope.loginInfo != null}" >
                        <form name="frmReview" id="frmReview" action="/product/view" method="post">
                            <input type="hidden" name="member_id" value="${sessionScope.member_id}" />
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
                    </c:if>
                </div>
            </div>
            <div class="col-lg-4 col-xl-3">
                <div class="row g-4 fruite">
                    <div class="col-lg-12 ">
                        <form id="frmSearch" name="frmSearch" action="/product/main" method="get">
                            <div class="input-group w-100 mx-auto d-flex mb-4">
                                <input type="search" name="search_word" id="search_word" class="form-control p-3" placeholder="keywords" aria-describedby="quantity">
                                <span id="search-icon-1" class="input-group-text p-3" onclick="searchProducts();"><i class="fa fa-search"></i></span>
                            </div>
                        </form>
                        <div class="mb-3 sidebar_menu px-3">
                            <h4>Categories</h4>
                            <div class="empty"></div>
                            <ul class="list-unstyled ps-0 fruite-categorie M01" >
                                <li class="mb-1 filters" data-category1="유아"><a class="nav-link fas fa-apple-alt" href="#">유아</a>
                                    <ul class="M02">
                                        <li class="filters" data-category1="유아" data-category3="한글"><a href="#">한글</a></li>
                                        <li class="filters" data-category1="유아" data-category3="영어"><a href="#">영어</a></li>
                                        <li class="filters" data-category1="유아" data-category3="수학"><a href="#">수학</a></li>
                                    </ul>

                                </li>
                            </ul>
                            <ul class="list-unstyled ps-0 fruite-categorie M01">
                                <li class="mb-1 filters" data-category1="초등"><a class="nav-link fas fa-apple-alt" href="#">초등</a>
                                    <ul class="M02">
                                        <li class="filters" data-category1="초등" data-category2="1"><a href="#">1학년</a>
                                            <ul class="M03">
                                                <li class="filters" data-category1="초등" data-category2="1" data-category3="국어"><a href="#">국어</a></li>
                                                <li class="filters" data-category1="초등" data-category2="1" data-category3="영어"><a href="#">영어</a></li>
                                                <li class="filters" data-category1="초등" data-category2="1" data-category3="수학"><a href="#">수학</a></li>
                                                <li class="filters" data-category1="초등" data-category2="1" data-category3="사회"><a href="#">사회</a></li>
                                                <li class="filters" data-category1="초등" data-category2="1" data-category3="과학"><a href="#">과학</a></li>
                                            </ul>
                                        </li>
                                        <li class="filters" data-category1="초등" data-category2="2"><a href="#">2학년</a>
                                            <ul class="M03">
                                                <li class="filters" data-category1="초등" data-category2="2" data-category3="국어"><a href="#">국어</a></li>
                                                <li class="filters" data-category1="초등" data-category2="2" data-category3="영어"><a href="#">영어</a></li>
                                                <li class="filters" data-category1="초등" data-category2="2" data-category3="수학"><a href="#">수학</a></li>
                                                <li class="filters" data-category1="초등" data-category2="2" data-category3="사회"><a href="#">사회</a></li>
                                                <li class="filters" data-category1="초등" data-category2="2" data-category3="과학"><a href="#">과학</a></li>
                                            </ul>
                                        </li>
                                        <li class="filters" data-category1="초등" data-category2="3"><a href="#">3학년</a>
                                            <ul class="M03">
                                                <li class="filters" data-category1="초등" data-category2="3" data-category3="국어"><a href="#">국어</a></li>
                                                <li class="filters" data-category1="초등" data-category2="3" data-category3="영어"><a href="#">영어</a></li>
                                                <li class="filters" data-category1="초등" data-category2="3" data-category3="수학"><a href="#">수학</a></li>
                                                <li class="filters" data-category1="초등" data-category2="3" data-category3="사회"><a href="#">사회</a></li>
                                                <li class="filters" data-category1="초등" data-category2="3" data-category3="과학"><a href="#">과학</a></li>
                                            </ul>
                                        </li>
                                        <li class="filters" data-category1="초등" data-category2="4"><a href="#">4학년</a>
                                            <ul class="M03">
                                                <li class="filters" data-category1="초등" data-category2="4" data-category3="국어"><a href="#">국어</a></li>
                                                <li class="filters" data-category1="초등" data-category2="4" data-category3="영어"><a href="#">영어</a></li>
                                                <li class="filters" data-category1="초등" data-category2="4" data-category3="수학"><a href="#">수학</a></li>
                                                <li class="filters" data-category1="초등" data-category2="4" data-category3="사회"><a href="#">사회</a></li>
                                                <li class="filters" data-category1="초등" data-category2="4" data-category3="과학"><a href="#">과학</a></li>
                                            </ul>
                                        </li>
                                        <li class="filters" data-category1="초등" data-category2="5"><a href="#">5학년</a>
                                            <ul class="M03">
                                                <li class="filters" data-category1="초등" data-category2="5" data-category3="국어"><a href="#">국어</a></li>
                                                <li class="filters" data-category1="초등" data-category2="5" data-category3="영어"><a href="#">영어</a></li>
                                                <li class="filters" data-category1="초등" data-category2="5" data-category3="수학"><a href="#">수학</a></li>
                                                <li class="filters" data-category1="초등" data-category2="5" data-category3="사회"><a href="#">사회</a></li>
                                                <li class="filters" data-category1="초등" data-category2="5" data-category3="과학"><a href="#">과학</a></li>
                                            </ul>
                                        </li>
                                        <li class="filters" data-category1="초등" data-category2="6"><a href="#">6학년</a>
                                            <ul class="M03">
                                                <li class="filters" data-category1="초등" data-category2="6" data-category3="국어"><a href="#">국어</a></li>
                                                <li class="filters" data-category1="초등" data-category2="6" data-category3="영어"><a href="#">영어</a></li>
                                                <li class="filters" data-category1="초등" data-category2="6" data-category3="수학"><a href="#">수학</a></li>
                                                <li class="filters" data-category1="초등" data-category2="6" data-category3="사회"><a href="#">사회</a></li>
                                                <li class="filters" data-category1="초등" data-category2="6" data-category3="과학"><a href="#">과학</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="list-unstyled ps-0 fruite-categorie M01">
                                <li class="mb-1 filters" data-category1="중등"><a class="nav-link fas fa-apple-alt" href="#">중등</a>
                                    <ul class="M02">
                                        <li class="filters" data-category1="중등" data-category2="1"><a href="#">1학년</a>
                                            <ul class="M03">
                                                <li class="filters" data-category1="중등" data-category2="1" data-category3="국어"><a href="#">국어</a></li>
                                                <li class="filters" data-category1="중등" data-category2="1" data-category3="영어"><a href="#">영어</a></li>
                                                <li class="filters" data-category1="중등" data-category2="1" data-category3="수학"><a href="#">수학</a></li>
                                                <li class="filters" data-category1="중등" data-category2="1" data-category3="사회"><a href="#">사회</a></li>
                                                <li class="filters" data-category1="중등" data-category2="1" data-category3="과학"><a href="#">과학</a></li>
                                            </ul>
                                        </li>
                                        <li class="filters" data-category1="중등" data-category2="2"><a href="#">2학년</a>
                                            <ul class="M03">
                                                <li class="filters" data-category1="중등" data-category2="2" data-category3="국어"><a href="#">국어</a></li>
                                                <li class="filters" data-category1="중등" data-category2="2" data-category3="영어"><a href="#">영어</a></li>
                                                <li class="filters" data-category1="중등" data-category2="2" data-category3="수학"><a href="#">수학</a></li>
                                                <li class="filters" data-category1="중등" data-category2="2" data-category3="사회"><a href="#">사회</a></li>
                                                <li class="filters" data-category1="중등" data-category2="2" data-category3="과학"><a href="#">과학</a></li>
                                            </ul>
                                        </li>
                                        <li class="filters" data-category1="중등" data-category2="3"><a href="#">3학년</a>
                                            <ul class="M03">
                                                <li class="filters" data-category1="중등" data-category2="3" data-category3="국어"><a href="#">국어</a></li>
                                                <li class="filters" data-category1="중등" data-category2="3" data-category3="영어"><a href="#">영어</a></li>
                                                <li class="filters" data-category1="중등" data-category2="3" data-category3="수학"><a href="#">수학</a></li>
                                                <li class="filters" data-category1="중등" data-category2="3" data-category3="사회"><a href="#">사회</a></li>
                                                <li class="filters" data-category1="중등" data-category2="3" data-category3="과학"><a href="#">과학</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="list-unstyled ps-0 fruite-categorie M01">
                                <li class="mb-1 filters" data-category1="고등"><a class="nav-link fas fa-apple-alt" href="#">고등</a>
                                    <ul class="M02" >
                                        <li class="filters" data-category1="고등" data-category2="1"><a href="#">1학년</a>
                                            <ul class="M03">
                                                <li class="filters" data-category1="고등" data-category2="1" data-category3="국어"><a href="#">국어</a></li>
                                                <li class="filters" data-category1="고등" data-category2="1" data-category3="영어"><a href="#">영어</a></li>
                                                <li class="filters" data-category1="고등" data-category2="1" data-category3="수학"><a href="#">수학</a></li>
                                                <li class="filters" data-category1="고등" data-category2="1" data-category3="사회"><a href="#">사회</a></li>
                                                <li class="filters" data-category1="고등" data-category2="1" data-category3="과학"><a href="#">과학</a></li>
                                            </ul>
                                        </li>
                                        <li class="filters" data-category1="고등" data-category2="2"><a href="#">2학년</a>
                                            <ul class="M03">
                                                <li class="filters" data-category1="고등" data-category2="2" data-category3="국어"><a href="#">국어</a></li>
                                                <li class="filters" data-category1="고등" data-category2="2" data-category3="영어"><a href="#">영어</a></li>
                                                <li class="filters" data-category1="고등" data-category2="2" data-category3="수학"><a href="#">수학</a></li>
                                                <li class="filters" data-category1="고등" data-category2="2" data-category3="사회"><a href="#">사회</a></li>
                                                <li class="filters" data-category1="고등" data-category2="2" data-category3="과학"><a href="#">과학</a></li>
                                            </ul>
                                        </li>
                                        <li class="filters" data-category1="고등" data-category2="3"><a href="#">3학년</a>
                                            <ul class="M03">
                                                <li class="filters" data-category1="고등" data-category2="3" data-category3="국어"><a href="#">국어</a></li>
                                                <li class="filters" data-category1="고등" data-category2="3" data-category3="영어"><a href="#">영어</a></li>
                                                <li class="filters" data-category1="고등" data-category2="3" data-category3="수학"><a href="#">수학</a></li>
                                                <li class="filters" data-category1="고등" data-category2="3" data-category3="사회"><a href="#">사회</a></li>
                                                <li class="filters" data-category1="고등" data-category2="3" data-category3="과학"><a href="#">과학</a></li>
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
    </div>
</div>
<!-- Single Product End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>


<script>
    //카테고리 이동 필터
    function filterCategory(element) {
        event.preventDefault();
        event.stopPropagation();
        console.log(element);
        let category1 = element.dataset.category1;
        let category2 = element.dataset.category2;
        let category3 = element.dataset.category3;
        console.log(category1);console.log(category2);console.log(category3);

        let frm = document.createElement("form");
        frm.id = "frmQuery";
        frm.action ="/product/main";
        frm.method="get";

        if (category1) {
            let input1 = document.createElement("input");
            input1.name = "pro_category1";
            input1.value = category1;
            input1.type="hidden";
            frm.append(input1);
        }
        if (category2) {
            let input2 = document.createElement("input");
            input2.name = "pro_category2";
            input2.value = category2;
            input2.type="hidden";
            frm.append(input2);
        }
        if (category3) {
            let input3 = document.createElement("input");
            input3.name = "pro_category3";
            input3.value = category3;
            input3.type="hidden";
            frm.append(input3);
        }

        document.body.append(frm);
        document.getElementById("frmQuery").submit();
    }

    let filters = document.querySelectorAll(".filters");
    for (let filter of filters) {
        filter.addEventListener("click", (e) => {
            filterCategory(filter);
        });
    }


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
    function addcart(){
        let pro_quantity = document.getElementById("orderBook").value ;
        if(${member_id != null}){
            $.ajax({
                type: "POST",            // HTTP method type(GET, POST) 형식이다.
                url: "/member/addcart",      // 컨트롤러에서 대기중인 URL 주소이다.
                data: {
                    pro_idx: ${product.pro_idx},
                    pro_quantity:pro_quantity
                },            // Json 형식의 데이터이다.
                success: function (result) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    if(confirm("장바구니에 상품이 담겼습니다 장바구니로 이동하시겠습니까?")){
                        window.location.href="/member/cart";
                    }
                },
                error: function (error) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    console.log(error);
                }
            });
        }else{
            alert("로그인 후 이용해주세요");
        }
    }

    // 주문량 제한
    const orderBookInput = document.getElementById('orderBook');
    const plusButton = document.querySelector('.btn-plus');
    plusButton.addEventListener('click', function() {
        const maxValue = ${product.pro_amount}-1;
        const currentValue = parseInt(orderBookInput.value);
        if (currentValue < maxValue) {
            orderBookInput.value = currentValue;
        } else {
            orderBookInput.value = maxValue;
            alert('재고량을 초과하셨습니다.');
        }
    });

</script>

<!-- JavaScript Libraries -->
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>--%>
<script src="/resources/resources/js/jquery.min.js"></script>
<script src="/resources/resources/js/bundle.min.js"></script>
<script src="/resources/resources/lib/easing/easing.min.js"></script>
<script src="/resources/resources/lib/waypoints/waypoints.min.js"></script>
<script src="/resources/resources/lib/lightbox/js/lightbox.min.js"></script>
<script src="/resources/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/resources/resources/js/main.js"></script>
</body>

</html>
