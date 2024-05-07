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
<div class="modal fade" id="orderDetails" style="display:none" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header border-bottom">
                <h5 class="modal-title" id="modal_title">주문번호</h5>
                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body pb-0">
                <div class="pt-2 ps-sm-3 mx-auto mx-sm-0" style="border-radius: 10px; border:solid 1px gray">
                    <div>주문자명</div>
                    <div class="text-muted mb-2 border-bottom" id="name"></div>
                    <div>배송지</div>
                    <div class="text-muted mb-2 border-bottom" id="addr"></div>
                    <div>상태</div>
                    <div class="text-muted mb-2 border-bottom" id="delivery"></div>
                    <div>연락처</div>
                    <div class="text-muted mb-2 border-bottom" id="phone"></div>
                    <div>요청사항</div>
                    <div class="text-muted mb-2 border-bottom" id="req_term"></div>
                </div>
                <table style="width: 100%">
                    <thead>
                        <tr style="border-bottom: 1px solid black">
                            <th colspan="2">상품정보</th>
                            <th>상품 가격</th>
                            <th>상품 수량</th>
                        </tr>
                    </thead>
                    <tbody id="modal_table">

                    </tbody>
                </table>
            </div>
            <div class="modal-footer flex-wrap justify-content-between bg-secondary fs-md">
                <div class="px-2 py-1">
                    <span class="text-muted"><strong>상품합계</strong></span>
                    <span id="pro_total"></span>
                </div>
                <div class="px-2 py-1">
                    <span class="text-muted"><strong>배송비</strong></span>
                    3000
                </div>
                <div class="px-2 py-1">
                    <span class="text-muted"><strong>총합</strong></span>
                    <span id="all_total"></span>
                </div>
            </div>
        </div>
    </div>
</div>
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
                                                        <c:when test="${dto.delivery eq '주문취소'}">
                                                            <a style="text-decoration: line-through; color: black" class="" onclick="orderDetail(${dto.order_idx})" href="#orderDetails" data-bs-toggle="modal">${dto.req_term}</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="" href="#orderDetails" onclick="orderDetail(${dto.order_idx})" data-bs-toggle="modal">${dto.req_term}</a>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>

                                                <c:choose>
                                                    <c:when test="${dto.delivery eq '주문완료'}">
                                                        <td> <span class="badge bg-label-secondary me-1">${dto.delivery}</span></td>
                                                        <td>
                                                            <button type="submit" class="btn p-0  hide-arrow" onclick="orderDelete(${dto.order_idx})" data-bs-toggle="dropdown">
                                                                <i class="bx bx-trash me-2"></i>
                                                            </button>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${dto.delivery eq '배송대기'}">
                                                        <td> <span class="badge bg-label-secondary me-1">${dto.delivery}</span></td>
                                                        <td>
<%--                                                            <button type="submit" class="btn p-0  hide-arrow" onclick="orderDelete(${dto.order_idx})" data-bs-toggle="dropdown">--%>
<%--                                                                <i class="bx bx-trash me-2"></i>--%>
<%--                                                            </button>--%>
                                                        </td>
                                                    </c:when>
                                                    <c:when test="${dto.delivery eq '배송중'}">
                                                        <td class="text-nowrap"><span class="badge bg-label-info me-1">${dto.delivery}</span></td>
                                                        <td class="text-nowrap"></td>
                                                    </c:when>
                                                    <c:when test="${dto.delivery eq '배송완료'}">
                                                        <td class="text-nowrap"><span class="badge bg-label-success me-1">${dto.delivery}</span></td>
                                                        <td class="text-nowrap"></td>
                                                    </c:when>
                                                    <c:when test="${dto.delivery eq '주문취소'}">
                                                        <td class="text-nowrap"><span class="badge bg-label-danger me-1">${dto.delivery}</span></td>
                                                        <td class="text-nowrap"></td>
                                                    </c:when>
                                                    <c:when test="${dto.delivery eq '결제완료' or dto.delivery eq '배송준비'}">
                                                        <td> <span class="badge bg-label-warning me-1">${dto.delivery}</span></td>
                                                        <td>
                                                            <button type="submit" class="btn p-0  hide-arrow" onclick="orderDelete(${dto.order_idx})" data-bs-toggle="dropdown">
                                                                <i class="bx bx-trash me-2"></i>
                                                            </button>
                                                        </td>
                                                    </c:when>
                                                    <c:otherwise>

                                                    </c:otherwise>
                                                </c:choose>
                                            </tr>



                                        </c:forEach>


                                        </tbody>
                                    </table>


                                    <form action="/member/orderDelete" method="post" id="frmDelete">
                                        <input type="hidden" name="order_idx" id="order_idx" value="${dto.order_idx}">
                                    </form>
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
    function orderDelete(order_idx) {
        let yn = confirm("주문을 취소하시겠습니까?");
        if (yn) {
            document.getElementById("order_idx").value = order_idx;
            document.getElementById("frmDelete").submit();
        }
    }

    function orderDetail(order_idx, el){
        $.ajax({
            type: "POST",            // HTTP method type(GET, POST) 형식이다.
            url: "/member/orderdetail",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: {
                order_idx: order_idx
            },            // Json 형식의 데이터이다.
            success: function (result) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                let resultList = result.getElementsByTagName("item");
                document.getElementById("modal_table").innerHTML="";
                document.getElementById("modal_title").innerHTML="주문번호 : "+order_idx;
                console.log(result);
                for(let i = 0; i<resultList.length; i++) {
                    if (i==resultList.length-1) {
                        document.getElementById("all_total").innerHTML = resultList.item(i).getElementsByTagName("order_total").item(0).firstChild.nodeValue;
                        document.getElementById("pro_total").innerHTML = Number(resultList.item(i).getElementsByTagName("order_total").item(0).firstChild.nodeValue)-3000;
                        document.getElementById("name").innerHTML = resultList.item(i).getElementsByTagName("order_name").item(0).firstChild.nodeValue;
                        document.getElementById("addr").innerHTML = resultList.item(i).getElementsByTagName("deli_addr").item(0).firstChild.nodeValue;
                        document.getElementById("phone").innerHTML = resultList.item(i).getElementsByTagName("order_phone").item(0).firstChild.nodeValue;
                        document.getElementById("delivery").innerHTML = resultList.item(i).getElementsByTagName("delivery").item(0).firstChild.nodeValue;
                        if(resultList.item(i).getElementsByTagName("req_term").item(0).firstChild != null){
                            document.getElementById("req_term").innerHTML = resultList.item(i).getElementsByTagName("req_term").item(0).firstChild.nodeValue;
                        }else{
                            document.getElementById("req_term").innerHTML = "요청사항 없음";
                        }
                    } else {
                        let trele = document.createElement("tr");
                        trele.setAttribute("style", "border-bottom:1px solid black")
                        for (let j = 0; j < resultList.item(i).childElementCount; j++) {
                            let tdele = document.createElement("td");
                            let chiled = resultList.item(i).children.item(j);
                            if (chiled.firstChild != null) {
                                if (chiled.firstChild.length > 1 || chiled.tagName == "pro_amount") {
                                    if (chiled.tagName == "pro_image") {
                                        let imgele = document.createElement("img");
                                        imgele.setAttribute("src", "/resources/resources/img/books/" + resultList.item(i).getElementsByTagName("pro_image").item(0).firstChild.nodeValue);
                                        imgele.setAttribute("width", "100px");
                                        imgele.setAttribute("height", "150px");
                                        tdele.append(imgele);
                                        trele.prepend(tdele);
                                    } else {
                                        tdele.innerHTML = chiled.firstChild.nodeValue;
                                        trele.append(tdele);
                                    }
                                }
                            }
                        }
                        document.getElementById("modal_table").prepend(trele);
                    }
                }
            },
            error: function (error) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                console.log(error);
                console.log("실패");
            }
        });
    }
</script>
</body>
</html>
