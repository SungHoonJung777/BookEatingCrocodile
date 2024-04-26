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
<%--<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>--%>
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
                        <div class="input-group w-100 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                    <div class="col-6"></div>
                    <div class="col-xl-3">
                        <form name="frmSort" id="frmSort" >
                            <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                <label for="sortMethod">정렬 순서:</label>
                                <select id="sortMethod" name="sortMethod" onchange="goList()" class="border-0 form-select-sm bg-light me-3">
                                    <option value="">선택</option>
                                    <option value="pro_reg_date||DESC">최신순</option>
                                    <option value="pro_reg_date||ASC">오래된순</option>
                                    <option value="pro_price||DESC">가격높은순</option>
                                    <option value="pro_price||ASC">가격낮은순</option>
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
                                    <ul class="list-unstyled ps-0 fruite-categorie oneDepth M01">
                                        <li class="mb-1 "><a class="nav-link" href="/product/main/pro_category1?=">유아</a>
                                            <ul class="twoDepth M02">
                                                <li><a href="#">한글</a></li>
                                                <li><a href="#">영어</a></li>
                                                <li><a href="#">수학</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <ul class="list-unstyled ps-0 fruite-categorie oneDepth M01">
                                        <li class="mb-1 "><a class="nav-link" href="#">초등</a>
                                            <ul class="M02">
                                                <li class=""><a href="#">1학년</a>
                                                    <ul class="M03">
                                                        <li><a href="#">국어</a></li>
                                                        <li><a href="#">영어</a></li>
                                                        <li><a href="#">수학</a></li>
                                                        <li><a href="#">사회</a></li>
                                                        <li><a href="#">과학</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">2학년</a>
                                                    <ul class="M03">
                                                        <li><a href="#">국어</a></li>
                                                        <li><a href="#">영어</a></li>
                                                        <li><a href="#">수학</a></li>
                                                        <li><a href="#">사회</a></li>
                                                        <li><a href="#">과학</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">3학년</a>
                                                    <ul class="M03">
                                                        <li><a href="#">국어</a></li>
                                                        <li><a href="#">영어</a></li>
                                                        <li><a href="#">수학</a></li>
                                                        <li><a href="#">사회</a></li>
                                                        <li><a href="#">과학</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">4학년</a>
                                                    <ul class="M03">
                                                        <li><a href="#">국어</a></li>
                                                        <li><a href="#">영어</a></li>
                                                        <li><a href="#">수학</a></li>
                                                        <li><a href="#">사회</a></li>
                                                        <li><a href="#">과학</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">5학년</a>
                                                    <ul class="M03">
                                                        <li><a href="#">국어</a></li>
                                                        <li><a href="#">영어</a></li>
                                                        <li><a href="#">수학</a></li>
                                                        <li><a href="#">사회</a></li>
                                                        <li><a href="#">과학</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">6학년</a>
                                                    <ul class="M03">
                                                        <li><a href="#">국어</a></li>
                                                        <li><a href="#">영어</a></li>
                                                        <li><a href="#">수학</a></li>
                                                        <li><a href="#">사회</a></li>
                                                        <li><a href="#">과학</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <ul class="list-unstyled ps-0 fruite-categorie M01">
                                        <li class="mb-1 "><a class="nav-link" href="#">중등</a>
                                            <ul class="M02">
                                                <li class=""><a href="#">1학년</a>
                                                    <ul class="M03">
                                                        <li><a href="#">국어</a></li>
                                                        <li><a href="#">영어</a></li>
                                                        <li><a href="#">수학</a></li>
                                                        <li><a href="#">사회</a></li>
                                                        <li><a href="#">과학</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">2학년</a>
                                                    <ul class="M03">
                                                        <li><a href="#">국어</a></li>
                                                        <li><a href="#">영어</a></li>
                                                        <li><a href="#">수학</a></li>
                                                        <li><a href="#">사회</a></li>
                                                        <li><a href="#">과학</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">3학년</a>
                                                    <ul class="M03">
                                                        <li><a href="#">국어</a></li>
                                                        <li><a href="#">영어</a></li>
                                                        <li><a href="#">수학</a></li>
                                                        <li><a href="#">사회</a></li>
                                                        <li><a href="#">과학</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <ul class="list-unstyled ps-0 fruite-categorie oneDepth M01">
                                        <li class="mb-1 "><a class="nav-link" href="#">고등</a>
                                            <ul class="twoDepth M02">
                                                <li class=""><a href="#">1학년</a>
                                                    <ul class="M03">
                                                        <li><a href="#">국어</a></li>
                                                        <li><a href="#">영어</a></li>
                                                        <li><a href="#">수학</a></li>
                                                        <li><a href="#">사회</a></li>
                                                        <li><a href="#">과학</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">2학년</a>
                                                    <ul class="M03">
                                                        <li><a href="#">국어</a></li>
                                                        <li><a href="#">영어</a></li>
                                                        <li><a href="#">수학</a></li>
                                                        <li><a href="#">사회</a></li>
                                                        <li><a href="#">과학</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">3학년</a>
                                                    <ul class="M03">
                                                        <li><a href="#">국어</a></li>
                                                        <li><a href="#">영어</a></li>
                                                        <li><a href="#">수학</a></li>
                                                        <li><a href="#">사회</a></li>
                                                        <li><a href="#">과학</a></li>
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
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <h4>Additional</h4>
                                    <div class="mb-2">
                                        <input type="radio" class="me-2" id="Categories-1" name="Categories-1" value="Beverages">
                                        <label for="Categories-1"> Organic</label>
                                    </div>
                                    <div class="mb-2">
                                        <input type="radio" class="me-2" id="Categories-2" name="Categories-1" value="Beverages">
                                        <label for="Categories-2"> Fresh</label>
                                    </div>
                                    <div class="mb-2">
                                        <input type="radio" class="me-2" id="Categories-3" name="Categories-1" value="Beverages">
                                        <label for="Categories-3"> Sales</label>
                                    </div>
                                    <div class="mb-2">
                                        <input type="radio" class="me-2" id="Categories-4" name="Categories-1" value="Beverages">
                                        <label for="Categories-4"> Discount</label>
                                    </div>
                                    <div class="mb-2">
                                        <input type="radio" class="me-2" id="Categories-5" name="Categories-1" value="Beverages">
                                        <label for="Categories-5"> Expired</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <h4 class="mb-3">Featured products</h4>
                                <div class="d-flex align-items-center justify-content-start">
                                    <div class="rounded me-4" style="width: 100px; height: 100px;">
                                        <img src="/resources/resources/img/featur-1.jpg" class="img-fluid rounded" alt="">
                                    </div>
                                    <div>
                                        <h6 class="mb-2">Big Banana</h6>
                                        <div class="d-flex mb-2">
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="d-flex mb-2">
                                            <h5 class="fw-bold me-2">2.99 $</h5>
                                            <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center justify-content-start">
                                    <div class="rounded me-4" style="width: 100px; height: 100px;">
                                        <img src="/resources/resources/img/featur-2.jpg" class="img-fluid rounded" alt="">
                                    </div>
                                    <div>
                                        <h6 class="mb-2">Big Banana</h6>
                                        <div class="d-flex mb-2">
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="d-flex mb-2">
                                            <h5 class="fw-bold me-2">2.99 $</h5>
                                            <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center justify-content-start">
                                    <div class="rounded me-4" style="width: 100px; height: 100px;">
                                        <img src="/resources/resources/img/featur-3.jpg" class="img-fluid rounded" alt="">
                                    </div>
                                    <div>
                                        <h6 class="mb-2">Big Banana</h6>
                                        <div class="d-flex mb-2">
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="d-flex mb-2">
                                            <h5 class="fw-bold me-2">2.99 $</h5>
                                            <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center my-4">
                                    <a href="#" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Vew More</a>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="position-relative">
                                    <img src="/resources/resources/img/banner-fruits.jpg" class="img-fluid w-100 rounded" alt="">
                                    <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                        <h3 class="text-secondary fw-bold">Fresh <br> Fruits <br> Banner</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="row g-4 justify-content-center">

                            <c:choose>
                               <c:when test="${responseDTO.dtoList != null}">
                                    <c:forEach items="${responseDTO.dtoList}" var="list">
                                        <div class="col-md-6 col-lg-6 col-xl-4">
                                            <div class="rounded position-relative fruite-item">
                                                <a href="/product/view?pro_idx=${list.pro_idx}">
                                                    <div class="fruite-img">
                                                        <img src="/resources/resources/img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>${list.pro_name}</h4>
                                                        <p>${list.pro_content}...</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">${list.pro_price}원</p>
                                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
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
                                    <ul class="pagination d-flex justify-content-center mt-5">
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
    function goList() {

        const frm = document.getElementById("frmSort");
        let sortMethod = document.getElementById("sortMethod");

        if(sortMethod.value != null && sortMethod.value != "") {
            alert(sortMethod.value);

            /*
                    frm.method = "GET";
                    frm.action = "/product/main";
                    frm.submit();
            */
        }

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

<script src="/resources/resources/assets/dist/js/bootstrap.bundle.min.js"></script>

<script src="/resources/resources/js/sidebars.js"></script>


</body>

</html>
