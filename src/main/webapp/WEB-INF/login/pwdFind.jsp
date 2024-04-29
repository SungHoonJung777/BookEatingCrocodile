<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ssfu7
  Date: 2024-04-28
  Time: PM 6:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
-->
<!-- beautify ignore:start -->
<html
        lang="en"
        class="light-style customizer-hide"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../assets/"
        data-template="vertical-menu-template-free"
>
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Forgot Password Basic - Pages | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content=""/>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/resources/resources/assets/img/favicon/favicon.ico"/>

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/resources/resources/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/resources/resources/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="/resources/resources/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/resources/resources/assets/js/config.js"></script>
</head>

<body>
<!-- Content -->

<div class="container-xxl">
    <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner py-4">
            <!-- Forgot Password -->
            <div class="card">
                <div class="card-body">
                    <!-- Logo -->
                    <div class="app-brand justify-content-center">
                        <a href="index.html" class="app-brand-link gap-2">
                  <span class="app-brand-logo demo">
                    <svg
                            width="25"
                            viewBox="0 0 25 42"
                            version="1.1"
                            xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink"
                    >
                      <defs>
                        <path
                                d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z"
                                id="path-1"
                        ></path>
                        <path
                                d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z"
                                id="path-3"
                        ></path>
                        <path
                                d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z"
                                id="path-4"
                        ></path>
                        <path
                                d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z"
                                id="path-5"
                        ></path>
                      </defs>
                      <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                        <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                          <g id="Icon" transform="translate(27.000000, 15.000000)">
                            <g id="Mask" transform="translate(0.000000, 8.000000)">
                              <mask id="mask-2" fill="white">
                                <use xlink:href="#path-1"></use>
                              </mask>
                              <use fill="#696cff" xlink:href="#path-1"></use>
                              <g id="Path-3" mask="url(#mask-2)">
                                <use fill="#696cff" xlink:href="#path-3"></use>
                                <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                              </g>
                              <g id="Path-4" mask="url(#mask-2)">
                                <use fill="#696cff" xlink:href="#path-4"></use>
                                <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                              </g>
                            </g>
                            <g
                                    id="Triangle"
                                    transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) "
                            >
                              <use fill="#696cff" xlink:href="#path-5"></use>
                              <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                            </g>
                          </g>
                        </g>
                      </g>
                    </svg>
                  </span>
                            <span class="app-brand-text demo text-body fw-bolder">Sneat</span>
                        </a>
                    </div>
                    <!-- /Logo -->
                    <h4 class="mb-2">Forgot Password? 🔒</h4>
                    <p class="mb-4">Enter your email and we'll send you instructions to reset your password</p>
                    <c:choose>
                        <c:when test="${not empty success_login || success_login ne '' || success_login ne null} ">
                            <span id="success_login" style=" margin-top: 20px; margin-bottom: 10px;" >${success_login}</span>
                        </c:when>
                        <c:when test="${not empty error_login || error_login ne '' || error_login ne null}">
                            <span id="error_login" style="color: red; margin-top: 20px; margin-bottom: 10px; color: red" >${error_login}</span>
                        </c:when>
                    </c:choose>

                    <span id="success_login" style=" margin-top: 20px; margin-bottom: 10px; color: blue; " >${success_login}</span>
                    <span id="error_login" style="color: red;  margin-top: 20px; margin-bottom: 10px; color: red" >${error_login}</span>
                    <form id="formAuthentication" class="mb-3" name="frm">
                        <div class="mb-3">
                            <label for="member_id" class="form-label">ID</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    id="member_id"
                                    name="member_id"
                                    placeholder="가입하신 아이디를 입력해주세요."
                                    autofocus
                            />
                        </div>
                        <span id="final_idChk" style="display: none; color: red" >아이디를 입력해주세요.</span>
                        <div class="mb-3">
                            <label for="member_email" class="form-label">Email</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    id="member_email"
                                    name="member_email"
                                    placeholder="가입하신 이메일을 입력해주세요."
                                    autofocus
                            />
                        </div>
                        <span id="final_mailChk" style="display: none; margin-top: 20px; margin-bottom: 10px; color: red" >이메일을 입력해주세요.</span>
                        <div class="mb-3">
                            <label for="member_phone" class="form-label">Phone</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    id="member_phone"
                                    name="member_phone"
                                    placeholder="가입하신 핸드폰 번호를 입력해주세요."
                                    autofocus
                            />
                        </div>
                        <span id="final_phoneChk" style="display: none; color: red; margin-bottom: 10px;">핸드폰 번호를 입력해주세요.</span>
                        <button type="button" id="pwdFindBtn"  class="btn btn-primary d-grid w-100">Send Reset Link</button>
                    </form>
                    <div class="text-center">
                        <a href="/login/login" class="d-flex align-items-center justify-content-center">
                            <i class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></i>
                            Back to login
                        </a>
                    </div>
                </div>
            </div>
            <!-- /Forgot Password -->
        </div>
    </div>
</div>

<!-- / Content -->


<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="/resources/resources/assets/vendor/libs/jquery/jquery.js"></script>
<script src="/resources/resources/assets/vendor/libs/popper/popper.js"></script>
<script src="/resources/resources/assets/vendor/js/bootstrap.js"></script>
<script src="/resources/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="/resources/resources/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="/resources/resources/assets/js/main.js"></script>

<!-- Page JS -->
<script>
    let frm = document.querySelector("form");
    let idCheck = false;
    let emailCheck = false;
    let phoneCheck = false;
    document.querySelector("#pwdFindBtn").addEventListener("click", function (){
        let id = document.querySelector("#member_id").value;
        let email = document.querySelector("#member_email").value;
        let phone = document.querySelector("#member_phone").value;

        //ID 공백 체크
        if(id == ""){
            document.querySelector("#final_idChk").style.display = 'block';
            idCheck = false;
        } else {
            document.querySelector("#final_idChk").style.display = 'none';
            idCheck = true;
        }

        //이메일 공백 체크
        if(email == ""){
            document.querySelector("#final_mailChk").style.display = 'block';
            emailCheck = false;
        } else {
            document.querySelector("#final_mailChk").style.display = 'none';
            emailCheck = true;
        }

        //핸드폰 공백 체크
        if(phone == ""){
            document.querySelector("#final_phoneChk").style.display = 'block';
            phoneCheck = false;
        } else {
            document.querySelector("#final_phoneChk").style.display = 'none';
            phoneCheck = true;
        }

        if(idCheck&&emailCheck&&phoneCheck){
            frm.method = "post";
            frm.action = "/login/pwdFind";
            frm.submit();
        }
        return false;
    });
</script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
