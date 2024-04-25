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
${list}

<%--출력날짜 ${}--%>

<div>
    <button type="button" onclick="location.href='/bbs/list'">목록</button>
    <button type="button" onclick="location.href='/bbs/modify?idx=${list.idx}'">수정</button>
    <button type="button" onclick="location.href='/bbs/delete?idx=${list.idx}'">삭제</button>
</div>

<form action="/reply/regist" name="frm" id="frm" method="post">
    <div class="reply_area">
    <textarea cols="30" rows="30">

    </textarea>
    </div>
</form>

</body>
</html>
