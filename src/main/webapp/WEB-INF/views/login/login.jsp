<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2024-04-17
  Time: 오후 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">



    <!-- Bootstrap core CSS -->
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>LogIN</title>

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        html,
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: auto;
        }

        .form-signin .checkbox {
            font-weight: 400;
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

    </style>
</head>
<body class="text-center">

<%--    <form name="frmLogin" id="frmLogin" method="post" action="/login/login">--%>
<%--        <input type="text" name="referer" id="referer" value="${acc_url}">--%>
<%--        <div>--%>
<%--            <div><span>아이디 : <input type="text" name="user_id" id="user_id" value="" maxlength="20"> </span></div>--%>
<%--            <div><span>비밀번호 : <input type="text" name="pwd" id="pwd" value="" maxlength="20"> </span></div>--%>
<%--            <div>--%>
<%--                <span>아이디 저장<input type="checkbox" name="save_id" id="save_id" value="Y"></span>--%>
<%--                <span>자동 로그인<input type="checkbox" name="auto_login" id="auto_login" value="Y"></span>--%>
<%--            </div>--%>
<%--            <div><button type="submit" id="btnLogin">로그인</button></div>--%>
<%--        </div>--%>
<%--    </form>--%>
    <main class="form-signin">
        <form name="frmLogin" id="frmLogin" method="post" action="/login/login">
<%--            <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">--%>
            <h1 class="h3 mb-3 fw-normal">로그인</h1>

            <div class="form-floating">
<%--                <label for="referer" class="form-label">이전URL</label>--%>
                <input type="hidden" class="form-control" name="referer" id="referer" value="${acc_url}">
            </div>
            <div class="form-floating">
                <input type="text" class="form-control"  name="user_id" id="user_id" value="${cookie.user_id.value}" maxlength="20" placeholder="ID">
                <label for="user_id" >ID</label>
                <div id="div_err_user_id" style="display: none"></div>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" name="pwd" id="pwd" value="" maxlength="20" placeholder="Password">
                <label for="pwd" >Password</label>
                <div id="div_err_pwd" style="display: none"></div>
                <div id="error_login" style="color: red">${error_login}</div>
            </div>
            <div id="div_err" style="display: none"></div>
            <div class="checkbox mb-3">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="save_id" id="save_id" value="Y" ${cookie.save_id.value}>
                    <label class="form-check-label" for="save_id">
                        아이디 저장
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox"  name="auto_login" id="auto_login" value="Y">
                    <label class="form-check-label" for="auto_login">
                        자동 로그인
                    </label>
                </div>
            </div>
                <button type="submit"  class="w-100 btn btn-lg btn-primary" id="btnLogin">로그인</button>
                <p></p>
                <button type="reset" onclick="location.href='/member/join'"  class="w-100 btn btn-lg btn-secondary" id="btnLogin">회원가입</button>
        </form>
    </main>

    <script>
        const btnLogin = document.getElementById("btnLogin");
        const frm = document.getElementById("frmLogin");

        btnLogin.addEventListener("click", function(e) {
            e.preventDefault();
            e.stopPropagation();

            frm.method = "post";
            frm.submit();
        }, false);

        const serverValidResult = {}; //JSON 객체 빈값으로 선언
        <c:forEach items="${errors}" var="err">
        if (document.getElementById("div_err_${err.getField()}") != null) {
            document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red'>${err.getField()} 필드는 ${err.defaultMessage}</span>";
            document.getElementById("div_err_${err.getField()}").style.display = "block";
        }
        serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
        </c:forEach>

        console.log(serverValidResult);

    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>
