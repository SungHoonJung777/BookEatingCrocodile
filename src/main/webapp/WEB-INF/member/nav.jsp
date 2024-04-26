<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
</head>
<body>
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
        <!-- Dashboard -->
        <li class="menu-item">
            <a href="../../index.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Dashboard</div>
            </a>
        </li>

        <!-- Layouts -->
        <li class="menu-item">
            <a href="/member/modify" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div data-i18n="Layouts">내 정보 수정</div>
            </a>

        </li>

        <li class="menu-header small text-uppercase">
            <span class="menu-header-text">order</span>
        </li>
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Account Settings">주문내역 조회</div>
            </a>
        </li>
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">

                <i class="menu-icon tf-icons bx bx-cart-alt"></i>
                <div>장바구니</div>
            </a>
        </li>
        <li class="menu-header small text-uppercase">
            <span class="menu-header-text">write</span>
        </li>
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-spreadsheet"></i>
                <div data-i18n="Authentications">1:1 문의글</div>
            </a>
        </li>
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-spreadsheet"></i>
                <div data-i18n="Misc">상품 문의글</div>
            </a>
        </li>
        <li class="menu-item">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-spreadsheet"></i>
                <div data-i18n="Misc">리뷰</div>
            </a>
        </li>
        <!-- Components -->

    </ul>
</aside>

</body>

</html>