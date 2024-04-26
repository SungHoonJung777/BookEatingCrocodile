<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ryuri
  Date: 2024-04-25
  Time: PM 4:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <!-- Single Page Header start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Cart</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Pages</a></li>
            <li class="breadcrumb-item active text-white">Cart</li>
        </ol>
    </div>
    <!-- Single Page Header End -->


    <!-- Cart Page Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">Products</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total</th>
                        <th scope="col">Handle</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${cartList}" var="list" varStatus="i">
                    <tr>
                        <th scope="row" rowspan="2"><input type="checkbox" class="form-check-input"> </th>
                        <th scope="row" rowspan="2">
                            <div class="d-flex align-items-center">
                                <img src="img/vegetable-item-3.png" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                            </div>
                        </th>
                        <td>
                            <p class="mb-0 mt-4">${list.pro_name}</p>
                        </td>
                        <td rowspan="2">
                            <p class="mb-0 mt-4">${list.pro_price}</p>
                        </td>
                        <td rowspan="2">
                            <div class="input-group quantity mt-4" style="width: 100px;">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border" onclick="minus(${i.count}, ${list.pro_price});">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input type="text" class="form-control form-control-sm text-center border-0" value="1" id="product${i.count}" readonly>
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border" onclick="plus(${i.count}, ${list.pro_amount}, ${list.pro_price})">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </td>
                        <td rowspan="2">
                            <p class="mb-0 mt-4" id="total${i.count}">${list.pro_price}</p>
                        </td>
                        <td rowspan="2">
                            <button class="btn btn-md rounded-circle bg-light border mt-4" >
                                <i class="fa fa-times text-danger"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>남은 재고량 : ${list.pro_amount}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="row g-4 justify-content-end">
                <div class="col-8"></div>
                <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                    <div class="bg-light rounded">
                        <div class="p-4">
                            <h1 class="display-6 mb-4">장바구니 <span class="fw-normal">총액</span></h1>
                            <div class="d-flex justify-content-between mb-4">
                                <h5 class="mb-0 me-4">상품 총액:</h5>
                                <p class="mb-0" id="total">0</p>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h5 class="mb-0 me-4">배송비</h5>
                                <div class="">
                                    <p class="mb-0">배송비: 0</p>
                                </div>
                            </div>
                        </div>
                        <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                            <h5 class="mb-0 ps-4 me-4">결제 총액</h5>
                            <p class="mb-0 pe-4">0</p>
                        </div>
                        <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" type="button">결제하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>

<script>

    function minus(idx, price){
        let quantity = document.getElementById("product"+idx).value;
        let totalprice = document.getElementById("total"+idx).value;
        if(parseInt(quantity)-1 > 0){
            document.getElementById("product"+idx).value = parseInt(quantity)-1;
            document.getElementById("total"+idx).innerHTML =parseInt(price)*(parseInt(quantity)-1);
        }
    }
    function plus(idx, amount, price){
        let quantity = document.getElementById("product"+idx).value;
        if(parseInt(quantity)+1 <= amount){
            document.getElementById("product"+idx).value = parseInt(quantity)+1;
            document.getElementById("total"+idx).innerHTML = parseInt(price)*(parseInt(quantity)+1);
        }
    }
</script>
</body>
</html>
