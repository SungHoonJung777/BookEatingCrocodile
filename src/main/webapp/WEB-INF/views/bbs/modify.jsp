<%--
  Created by IntelliJ IDEA.
  User: ssfu7
  Date: 2024-04-17
  Time: AM 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form name="frmRegist" id="frmRegist" action="/bbs/modify" method="post">
    <input type="hidden" name="idx" value="${list.idx}">
    아이디 : <input type="text" name="user_id" id="user_id" class="user_id">
    제목 : <input type="text" name="title" id="title" class="title">
    내용 : <input type="text" name="content"  id="content" class="content">
    출력날짜 : <input type="date" name="display_date"  id="display_date" class="display_date">

    <button type="submit">글등록</button>
</form>
</body>
</html>
