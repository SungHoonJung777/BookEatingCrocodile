<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <form name="frmRegist" id="frmRegist" action="/bbs/regist" method="post">
        아이디 : <input type="text" name="user_id" id="user_id" class="user_id" value="${dto.user_id}"> <br>
        <div id="div_drr_user_id" style="display: none;"></div>
        제목 : <input type="text" name="title" id="title" class="title" value="${dto.title}">
        <div id="div_drr_title" style="display: none;"></div>
        내용 : <input type="text" name="content"  id="content" class="content" value="${dto.content}">
        <div id="div_drr_content" style="display: none;"></div>
        출력날짜 : <input type="date" name="display_date"  id="display_date" class="display_date" value="${dto.display_date}">
        관심사항 : <input type="checkbox" name="interest" id="interest_1"> 축구
        <input type="checkbox" name="interest" id="interest_2"> 농구
        <input type="checkbox" name="interest" id="interest_3"> 야구
        <input type="checkbox" name="interest" id="interest_4"> 테니스
        <button type="submit">글등록</button>
    </form>

    <script !src="">
            const serverValidResult = {};
            <c:forEach items="${errors}" var="err">
            if(document.getElementById("div_drr_${err.getField()}") != null ){
                document.getElementById("div_drr_${err.getField()}").innerHTML = "<span style= 'color:red;' > ${err.defaultMessage} </span>";
                document.getElementById("div_drr_${err.getField()}").style.display = "block";
            }
                serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
            </c:forEach>



    </script>
</body>
</html>
