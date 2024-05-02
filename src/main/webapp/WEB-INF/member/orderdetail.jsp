<%--
  Created by IntelliJ IDEA.
  User: paksa
  Date: 2024-05-02
  Time: 오후 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table style="border:1px solid black">
    <tr>
        <th>주문자명</th>
        <th>전화번호</th>
        <th>주문지</th>
        <th>주문 일자</th>
    </tr>
    <tr>
        <td>${orderdto.order_name}</td>
        <td>${orderdto.order_phone}</td>
        <td>${orderdto.deli_addr}</td>
        <td>${orderdto.order_date}</td>
    </tr>
</table>
${list}
</body>
</html>
