<%--
  Created by IntelliJ IDEA.
  User: ryuri
  Date: 2024-04-25
  Time: PM 3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>주문내역 조회</title>

    <meta name="description" content="" />

    <!-- Favicon -->


    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/resources/resources/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/resources/resources/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="/resources/resources/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/resources/resources/assets/js/config.js"></script>
    <style>
        #body {
            margin-top: 180px;
        }

    </style>

</head>

<body id="body">
<jsp:include page="../common/header.jsp"/>
<!-- Layout wrapper -->
<%--<div class="layout-wrapper layout-content-navbar">--%>

<div class="container">

    <div class="layout-container layout-content-navbar">
        <!-- Menu -->
        <jsp:include page="nav.jsp"/>

        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">마이페이지 /</span> 주문내역 조회</h4>

                    <div class="row">
                        <div class="col-md-12">
                            <ul class="nav nav-pills flex-column flex-md-row mb-3">
                                <li class="nav-item">
                                    <i class="bx bx-user me-1"></i> Order
                                </li>

                            </ul>
                            <div class="card mb-4">
                                <!-- Notifications -->
                                <h5 class="card-header">주문내역 조회</h5>
                                <div class="card-body">
                                    <br>
                                    <span>
                                    <span class="notificationRequest"><strong>배송중인 상품은 주문취소가 불가능 합니다.</strong></span></span
                                    >
                                    <div class="error"></div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table no-wrap">
                                        <thead>
                                        <tr>
                                            <th>주문번호</th>
                                            <th>주문일자</th>
                                            <th>주문상품</th>
                                            <th>주문상태</th>
                                            <th>주문취소</th>
                                        </tr>
                                        </thead>
                                        <tbody class="table-border-bottom-0">

                                        <c:forEach items="${orderList}" var="dto" varStatus="status">
                                            <tr>
                                                <td class="text-nowrap">${status.count}</td>
                                                <td class="text-nowrap">${fn:substring(dto.order_date,0,10)} ${fn:substring(dto.order_date, 11,20)}</td>
                                                <td class="text-nowrap">
                                                    <c:choose>
                                                        <c:when test="${dto.order_status eq '주문취소'}">
                                                            <a style="text-decoration: line-through; color: black" class="" href="product/view?pro_idx=${dto.pro_idx}">${dto.pro_name}</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class=""  href="/product/view?pro_idx=${dto.pro_idx}">${dto.pro_name}</a>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>

                                                <c:choose>
                                                    <c:when test="${dto.order_status eq '배송중'}">
                                                        <td class="text-nowrap"><span class="badge bg-label-info me-1">${dto.order_status}</span></td>
                                                        <td class="text-nowrap"></td>
                                                    </c:when>
                                                    <c:when test="${dto.order_status eq '배송완료'}">
                                                        <td class="text-nowrap"><span class="badge bg-label-success me-1">${dto.order_status}</span></td>
                                                        <td class="text-nowrap"></td>
                                                    </c:when>
                                                    <c:when test="${dto.order_status eq '주문취소'}">
                                                        <td class="text-nowrap"><span class="badge bg-label-danger me-1">${dto.order_status}</span></td>
                                                        <td class="text-nowrap"></td>
                                                    </c:when>
                                                    <c:when test="${dto.order_status eq '결제완료' or dto.order_status eq '배송준비중'}">
                                                        <td> <span class="badge bg-label-warning me-1">${dto.order_status}</span></td>
                                                        <td>

                                                            <form action="/member/orderDelete" method="post" id="frmDelete">
                                                                <input type="hidden" name="order_idx" value="${dto.order_idx}">
                                                                <button type="submit" class="btn p-0  hide-arrow" onclick="orderDelete()" data-bs-toggle="dropdown">
                                                                    <i class="bx bx-trash me-2"></i>
                                                                </button>
                                                            </form>

                                                        </td>
                                                    </c:when>
                                                    <c:otherwise>

                                                    </c:otherwise>
                                                </c:choose>
                                            </tr>



                                        </c:forEach>


                                        </tbody>
                                    </table>
                                </div>





                                <!-- /Account -->
                            </div>

                        </div>
                    </div>
                </div>



            </div>

        </div>


    </div>

<%--    <nav aria-label="Page navigation example">--%>
<%--        <ul class="pagination justify-content-center">--%>
<%--            <li class="page-item<c:if test="${responseDTO.prev_page_flag ne true}"> disabled</c:if>">--%>
<%--                <!--a class="page-link" data-num="1" href="page=1">Previous</a-->--%>
<%--                <a class="page-link"--%>
<%--                   data-num="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"--%>
<%--                   href="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_start-10}</c:when><c:otherwise>#</c:otherwise></c:choose>">Previous</a>--%>
<%--            </li>--%>
<%--            <c:forEach begin="${responseDTO.page_block_start}"--%>
<%--                       end="${responseDTO.page_block_end}"--%>
<%--                       var="page_num">--%>
<%--                <li class="page-item<c:if test="${responseDTO.page == page_num}"> active</c:if>">--%>
<%--                    <a class="page-link" data-num="${page_num}"--%>
<%--                       href="<c:choose><c:when test="${responseDTO.page == page_num}">#</c:when><c:otherwise>${responseDTO.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>--%>
<%--                </li>--%>
<%--            </c:forEach>--%>
<%--            <li class="page-item<c:if test="${responseDTO.next_page_flag ne true}"> disabled</c:if>">--%>
<%--                <a class="page-link"--%>
<%--                   data-num="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.page_block_end+1}</c:when><c:otherwise>${responseDTO.page_block_end}</c:otherwise></c:choose>"--%>
<%--                   href="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>">Next</a>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </nav>--%>

</div>

<jsp:include page="../common/footer.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function orderDelete(e) {
        let yn = confirm("주문을 취소하시겠습니까?");
        if (yn) {
            document.getElementById("frmDelete").submit();
        }
        e.preventDefault();
    }


</script>
</body>
</html>
