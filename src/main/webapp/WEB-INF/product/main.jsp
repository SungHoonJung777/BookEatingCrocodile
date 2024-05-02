<%--
  Created by IntelliJ IDEA.
  User: I
  Date: 2024-04-25
  Time: 오후 1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="utf-8">
    <title>상품 페이지</title>
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

    <link href="/resources/resources/css/product.css" rel="stylesheet">

</head>

<body>

<!-- Spinner Start -->
<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center spinner">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->


<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>


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
    <h1 class="text-center text-white display-6">Shop</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">Shop</li>
    </ol>
</div>
<!-- Single Page Header End -->


<!-- Fruits Shop Start-->
<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <h1 class="mb-4">book shop</h1>
        <div class="row g-4">
            <div class="col-lg-12">
                <div class="row g-4">
                    <div class="col-xl-3">
                            <form id="frmSearch" name="frmSearch" method="get">
                                <input type="hidden" name="pro_category1" value="${responseDTO.pro_category1}">
                                <input type="hidden" name="pro_category2" value="${responseDTO.pro_category2}">
                                <input type="hidden" name="pro_category3" value="${responseDTO.pro_category3}">
                                <div class="input-group w-100 mx-auto d-flex">
                                    <input type="search" name="search_word" id="search_word" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1" value="${responseDTO.search_word}">
                                    <span id="search-icon-2" class="input-group-text p-3" onclick="searchProducts();"><i class="fa fa-search"></i></span>
                                </div>

                            </form>
                    </div>

                    <div class="col-6"></div>
                    <div class="col-xl-3">
                        <form name="frmSort" id="frmSort" method="get">
                            <input type="hidden" name="pro_category1" value="${responseDTO.pro_category1}">
                            <input type="hidden" name="pro_category2" value="${responseDTO.pro_category2}">
                            <input type="hidden" name="pro_category3" value="${responseDTO.pro_category3}">
                           <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                <label for="sortMethod">정렬 순서:</label>
                                <select id="sortMethod" name="sortMethod" onchange="goList()" class="border-0 form-select-sm bg-light me-3">
                                    <option value="">선택</option>
                                    <option value="pro_reg_date||DESC" <c:if test="${responseDTO.sortField eq 'pro_reg_date' && responseDTO.sortDir eq 'DESC'}"> selected</c:if>>최신순</option>
                                    <option value="pro_reg_date||ASC" <c:if test="${responseDTO.sortField eq 'pro_reg_date' && responseDTO.sortDir eq 'ASC'}"> selected</c:if>>오래된순</option>
                                    <option value="pro_price||DESC" <c:if test="${responseDTO.sortField eq 'pro_price' && responseDTO.sortDir eq 'DESC'}"> selected</c:if>>가격높은순</option>
                                    <option value="pro_price||ASC" <c:if test="${responseDTO.sortField eq 'pro_price' && responseDTO.sortDir eq 'ASC'}"> selected</c:if>>가격낮은순</option>
                                </select>
                            </div>
                        </form>
                    </div>
                </div>


                <div class="row g-4">
                    <div class="col-lg-3">
                        <div class="row g-4">
                            <div class="col-lg-12 sidebar_menu" >
                                <div class="mb-3">
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


                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <h4 class="mb-2">Price</h4>
                                    <input type="range" class="form-range w-100" id="rangeInput" name="rangeInput" min="0" max="500" value="0" oninput="amount.value=rangeInput.value">
                                    <output id="amount" name="amount" min-velue="0" max-value="500" for="rangeInput">0</output>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="row g-4">
                            <c:choose>
                               <c:when test="${responseDTO.dtoList != null}">
                                    <c:forEach items="${responseDTO.dtoList}" var="list">
                                        <div class="col-md-6 col-lg-6 col-xl-4 ">
                                            <div class="rounded position-relative fruite-item">
                                                <a href="/product/view?pro_idx=${list.pro_idx}">
                                                    <div class="fruite-img">
                                                        <img src="/resources/resources/img/books/${list.pro_image}" class="img-fluid w-100 rounded-top book_img_size" alt="책 이미지"/>
                                                    </div>
                                                    <div class="p-4 border border-top-0 rounded-bottom book_intro_box">
                                                        <c:choose>
                                                            <c:when test="${list.review_star_avg eq '1'}">
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </c:when>
                                                            <c:when test="${list.review_star_avg eq '2'}">
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </c:when>
                                                            <c:when test="${list.review_star_avg eq '3'}">
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </c:when>
                                                            <c:when test="${list.review_star_avg eq '4'}">
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star"></i>
                                                            </c:when>
                                                            <c:when test="${list.review_star_avg eq '5'}">
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star text-secondary"></i>
                                                                <i class="fa fa-star text-secondary"></i>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <h4>${list.pro_name}</h4>
                                                        <p>${list.pro_content}...</p>

                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0"><fmt:formatNumber value="${list.pro_sale_price}" pattern="#,###"/>원</p>
                                                            <div class="empty" ></div>
                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary cart_add_box"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니에 추가</a>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <div>등록된 책이 존재하지 않습니다.</div>
                                </c:otherwise>
                            </c:choose>

                                <div class="col-12">
                                    <nav aria-label="Page navigation example pagination ">
                                        <ul class="pagination d-flex justify-content-center mt-5" onclick="goPaging()">
                                            <li class="page-item<c:if test="${responseDTO.prev_page_flag ne true}"> disabled</c:if>">
                                                <a class="page-link rounded"
                                                   data-num="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.page_block_start-1}</c:when>
                                                    <c:otherwise>1</c:otherwise></c:choose>"
                                                   href="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_start-10}</c:when>
                                                    <c:otherwise>#</c:otherwise></c:choose>" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>

                                            <c:forEach begin="${responseDTO.page_block_start}" end="${responseDTO.page_block_end}" var="page_num">
                                                <li class="page-item<c:if test="${responseDTO.page == page_num}"> active</c:if>">
                                                    <a class="page-link rounded" data-num="${page_num}"
                                                       href="<c:choose><c:when test="${responseDTO.page == page_num}">#</c:when>
                                                        <c:otherwise>${responseDTO.linkParams}&page=${page_num}</c:otherwise>
                                                        </c:choose>">${page_num}
                                                    </a>
                                                </li>
                                            </c:forEach>

                                            <li class="page-item<c:if test="${responseDTO.next_page_flag ne true}"> disabled</c:if>">
                                                <a class="page-link rounded"
                                                   data-num="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.page_block_end+1}</c:when>
                                                    <c:otherwise>${responseDTO.page_block_end}</c:otherwise></c:choose>"
                                                   href="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_end+1}</c:when>
                                                    <c:otherwise>#</c:otherwise>
                                                </c:choose>" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Fruits Shop End-->

<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>




<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>

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


    //정렬 필터
    function goList() {
        const frmSort = document.getElementById("frmSort");
        frmSort.submit();
    }


    //검색창
    function searchProducts() {
            /*let search_word = document.getElementById('search_word').value;
            window.location.href = '/product/main?search_word=' + encodeURIComponent(search_word);*/

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




    // 페이지 로딩 시작 시 스피너 보여주기
    document.getElementById('spinner').style.display = 'flex';

    // 페이지 로딩 완료 시 스피너 숨기기
    window.onload = function() {
        document.getElementById('spinner').style.display = 'none';
    };
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

<script src="/resources/resources/assets/dist/js/bootstrap.bundle.min.js"></script>

<script src="/resources/resources/js/sidebars.js"></script>


</body>

</html>
