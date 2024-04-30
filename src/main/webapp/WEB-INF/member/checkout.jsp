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
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Checkout</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Pages</a></li>
            <li class="breadcrumb-item active text-white">Checkout</li>
        </ol>
    </div>
    <div class="container-fluid py-5">
        <div class="container py-5">
            <h1 class="mb-4">Billing details</h1>
            <form action="/member/checkout" method="post">
                <div class="row g-5">
                    <div class="col-md-12 col-lg-6 col-xl-7">
                        <div class="row">
                            <div class="col-md-12 col-lg-6">
                                <div class="form-item w-100">
                                    <label class="form-label my-3">이름<sup>*</sup></label>
                                    <input type="text" class="form-control" name="order_name">
                                </div>
                            </div>
                        </div>
                        <div class="form-item">
                            <label class="form-label my-3">배송지 명<sup>*</sup></label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="form-item">
                            <label class="form-label my-3" >우편번호<sup>*</sup></label>
                            <input type="text" class="form-control" id="zonecode" name="zonecode" onclick="address()">
                        </div>
                        <div class="form-item">
                            <label class="form-label my-3">주소 <sup>*</sup></label>
                            <input type="text" class="form-control" id="addr1" name="addr1" onclick="address()">
                        </div>
                        <div class="form-item">
                            <label class="form-label my-3" name="addr2">상세주소 <sup>*</sup></label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="form-item">
                            <label class="form-label my-3">전화번호<sup>*</sup></label>
                            <input type="tel" class="form-control">
                        </div>
                        <hr>
                        <div class="form-item">
                            <textarea name="text" class="form-control" spellcheck="false" cols="30" rows="11" placeholder="요청사항"></textarea>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-6 col-xl-5">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col" colspan="2">상품 정보</th>
                                    <th scope="col">가격</th>
                                    <th scope="col">수량</th>
                                    <th scope="col">총합</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${cartList}" var="list">
                                    <tr>
                                        <th scope="row">
                                            <div class="d-flex align-items-center mt-2">
                                                <img src="img/vegetable-item-2.jpg" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                                            </div>
                                        </th>
                                        <td class="py-5">${list.pro_title}</td>
                                        <td class="py-5">${list.pro_price}</td>
                                        <td class="py-5">${list.pro_quantity}</td>
                                        <td class="py-5">${list.pro_price*list.pro_quantity}</td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <th scope="row">
                                    </th>
                                    <td class="py-5">
                                        <p class="mb-0 text-dark py-4">배송비</p>
                                    </td>
                                    <td class="py-5"></td>
                                    <td class="py-5"></td>
                                    <td colspan="3" class="py-5">
                                        <div class="py-3 border-bottom border-top">
                                            <p class="mb-0 text-dark">3000</p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                    </th>
                                    <td class="py-5">
                                        <p class="mb-0 text-dark text-uppercase py-3">TOTAL</p>
                                    </td>
                                    <td class="py-5"></td>
                                    <td class="py-5"></td>
                                    <td class="py-5">
                                        <div class="py-3 border-bottom border-top">
                                            <p class="mb-0 text-dark">${total+3000}</p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                    </th>
                                    <td class="py-5">
                                        <p class="mb-0 text-dark py-4">결제 수단</p>
                                    </td>
                                    <td colspan="5" class="py-5">
                                        <div class="py-3">
                                            <select class="form-select" >
                                                <option>선택</option>
                                                <option>무통장 입금</option>
                                                <option disabled>카드결제(불가)</option>
                                                <option disabled>간편결제(불가)</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                            <button class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary" type="submit">Place Order</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function address() {
        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById("zonecode").value = data.zonecode;
                document.getElementById("addr1").value = data.roadAddress;
            }
        }).open();
    }
</script>
</body>
</html>
