<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ssfu7
  Date: 2024-05-03
  Time: PM 1:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!--
* A Design by GraphBerry
* Author: GraphBerry
* Author URL: http://graphberry.com
* License: http://graphberry.com/pages/license
-->
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Coming soon page by GraphBerry</title>
    <link href="/resources/resources/black/css/style.css" rel="stylesheet">
    <link href="/resources/resources/black/css/icons.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <style>

        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .card {
            max-width: 18rem;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            transition: transform 0.2s ease-in-out;
            background-color: whitesmoke;
            margin-top: -359px;
            margin-bottom: 50px;

            font-family: "Black Han Sans", sans-serif;
            font-weight: 400;
            font-style: normal;


        }

        .card:hover {
            transform: scale(1.05);
        }

        .card-img-top {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .card-body {
            padding: 1.25rem;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
        }

        .card-subtitle {
            font-size: 1rem;
        }

        .card-text {
            font-size: 0.875rem;
            margin-top: 0.5rem;
        }

        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
            transition: background-color 0.2s ease-in-out;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }


    </style>

</head>
<body>
<div class="wrapper">
    <div class="logo">
        <img src="/resources/resources/img/choice/logo.png" style="width: 150px; height: auto;"
             alt="GraphBerry coming soon theme">
    </div>

    <h1>Comming soon!</h1>
    <h2>곧 악어의 경매가 시작됩니다.</h2>

    <ul class="countdown">
        <li>
            <span id="c" class="clock"></span>
        </li>
    </ul>


    <script>
        function currentTime() {
            const now = new Date();
            let hh = now.getHours();
            let mm = now.getMinutes();
            let ss = now.getSeconds();
            let session = "AM";

            if (hh == 0) {
                hh = 12;
            }
            if (hh > 12) {
                hh = hh - 12;
                session = "PM";
            }

            hh = (hh < 10) ? "0" + hh : hh;
            mm = (mm < 10) ? "0" + mm : mm;
            ss = (ss < 10) ? "0" + ss : ss;

            const time = hh + ":" + mm + ":" + ss + " " + session;
            //console.log(time);
            document.getElementsByClassName("clock").innerText = time;
        }

        setInterval(currentTime, 1000);
    </script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.downCount.js"></script>
    <script type="text/javascript" src="js/app.js"></script>
</body>
</html>