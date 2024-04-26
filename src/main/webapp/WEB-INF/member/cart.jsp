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
                        <th scope="col">
                            <div class="d-flex justify-content-center">
                                <input  type="checkbox" class="form-check-input mt-0" onclick="checkAll(this);">
                            </div>
                        </th>
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
                        <th  class="align-middle">
                            <div class="d-flex justify-content-center">
                                <input type="checkbox" class="form-check-input mt-0" id="checkbox${i.count}" name="chkbox" onclick="checkproduct();">
                            </div>
                        </th>
                        <th scope="row">
                            <div class="d-flex align-items-center">
                                <img src="" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                            </div>
                        </th>
                        <td>
                            <p class="mb-0 mt-4">${list.pro_title}</p>
                        </td>
                        <td>
                            <p class="mb-0 mt-4">${list.pro_price}</p>
                        </td>
                        <td>
                            <div class="input-group quantity mt-4" style="width: 100px;">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border" onclick="minus(${i.count}, ${list.pro_price})">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input type="text" class="form-control form-control-sm text-center border-0" value="${list.pro_quantity}" id="product${i.count}">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border" onclick="plus(${i.count}, 500, ${list.pro_price})">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </td>
                        <td>
                            <p class="mb-0 mt-4" id="total${i.count}" name="total">${list.pro_price*list.pro_quantity}</p>
                        </td>
                        <td>
                            <button class="btn btn-md rounded-circle bg-light border mt-4" onclick="cartout(${list.cart_idx})">
                                <i class="fa fa-times text-danger"></i>
                            </button>
                        </td>

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
                                    <p class="mb-0" id="shipping">0</p>
                                </div>
                            </div>
                        </div>
                        <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                            <h5 class="mb-0 ps-4 me-4">결제 총액</h5>
                            <input type="text" class="mb-0 me-4 form-control form-control-sm border-0" id="total_price" readonly value="0" style="text-align: right">
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
        checkproduct(idx);
    }
    function plus(idx, amount, price){
        let quantity = document.getElementById("product"+idx).value;
        if(parseInt(quantity)+1 <= amount){
            document.getElementById("product"+idx).value = parseInt(quantity)+1;
            document.getElementById("total"+idx).innerHTML = parseInt(price)*(parseInt(quantity)+1);
        }
        checkproduct();

    }
    function checkAll(el){
        let checkBoxes  = document.getElementsByName("chkbox");
        let totalval = document.getElementsByName("total");
        let product_total = 0;
        checkBoxes.forEach((row)=>{
            row.checked = el.checked;
        })
        if(el.checked == true) {
            totalval.forEach((row) => {
                product_total = product_total + parseInt(row.innerHTML);
            })
            document.getElementById("total").innerHTML = product_total;
            document.getElementById("shipping").innerHTML = "3000";
            document.getElementById("total_price").innerHTML = product_total + 3000;
        }else{
            document.getElementById("total").innerHTML = "0";
            document.getElementById("shipping").innerHTML = "0";
            document.getElementById("total_price").innerHTML = 0;
        }
    }
    function checkproduct(){
        let totalval = document.getElementsByName("chkbox");
        let total_price = 0;
        let count = 0;
        let uncheck = 0;
        totalval.forEach((row, index) => {
            count = count +1;
            if(row.checked){
                total_price = total_price+parseInt(document.getElementById("total"+(index+1)).innerHTML);
            }else{
                uncheck = uncheck + 1;
            }
        })
        document.getElementById("total").innerHTML = total_price;
        if(uncheck == count) {
            document.getElementById("shipping").innerHTML = 0;
        }else{
            document.getElementById("shipping").innerHTML = 3000;
        }
        document.getElementById("total_price").value = total_price;
    }
    function cartout(cart_idx) {
        $.ajax({
            type: "POST",            // HTTP method type(GET, POST) 형식이다.
            url: "/member/cartout",      // 컨트롤러에서 대기중인 URL 주소이다.
            data: {
                cart_idx:cart_idx
            },            // Json 형식의 데이터이다.
            success: function (result) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                alert("삭제되었습니다");
                window.location.reload();
            },
            error: function (error) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                console.log(error);
            }
        });
    }
</script>
</body>
</html>
