<%--
  Created by IntelliJ IDEA.
  User: ssfu7
  Date: 2024-04-29
  Time: PM 5:27
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
        class="light-style layout-menu-fixed"
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
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>관리자 페이지</title>

    <meta name="description" content=""/>



    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/fonts/boxicons.css"/>

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/css/core.css" class="template-customizer-core-css"/>
    <link rel="stylesheet" href="/resources/resources/assets/vendor/css/theme-default.css"
          class="template-customizer-theme-css"/>
    <link rel="stylesheet" href="/resources/resources/assets/css/demo.css"/>

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/css/pages/page-auth.css"/>
    <!-- Helpers -->
    <script src="/resources/resources/assets/vendor/js/helpers.js"></script>
    <style>
        #result_card img{
            max-width: 100%;
            height: auto;
            display: block;
            padding: 5px;
            margin-top: 10px;
            margin: auto;
        }
        #result_card{
            position: relative;
        }
        .imgDeleteBtn{
            position: absolute;
            top: 0  ;
            right: 5%;
            background-color: #ef7d7d;
            color: wheat;
            font-weight: 900;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            line-height: 26px;
            text-align: center;
            border: none;
            display: block;
            cursor: pointer;
        }
    </style>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/resources/resources/assets/js/config.js"></script>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
            <div class="app-brand demo">
                <a href="/admin/main" class="app-brand-link">
              <span class="app-brand-logo demo">
                 <img src="/resources/resources/img/BEClogo.png"style="width: 15%" onclick="location='/'"/>
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
                    <span class="app-brand-text demo menu-text fw-bolder ms-2">Sneat</span>
                </a>

                <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                    <i class="bx bx-chevron-left bx-sm align-middle"></i>
                </a>
            </div>

            <div class="menu-inner-shadow"></div>

            <ul class="menu-inner py-1">
                <!-- Dashboard -->
                <li class="menu-item ">
                    <a href="/admin/main" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-home-circle"></i>
                        <div data-i18n="Analytics">메인 페이지</div>
                    </a>
                </li>

                <!-- Layouts -->


                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text">Pages</span>
                </li>
                <li class="menu-item">
                    <a href="/admin/memberList" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
                        <div data-i18n="Basic">회원관리</div>
                    </a>
                </li>
                <!-- Components -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text">Product</span></li>
                <!-- Cards -->
                <li class="menu-item">
                    <a href="/admin/productList" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-collection"></i>
                        <div data-i18n="Basic">상품리스트</div>
                    </a>
                </li>
                <li class="menu-item active">
                    <a href="/admin/productRegist" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-box"></i>
                        <div data-i18n="Basic">상품등록</div>
                    </a>
                </li>

                <!-- Misc -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text">배송</span></li>
                <li class="menu-item">
                    <a
                            href="/admin/delivery"
                            class="menu-link"
                    >
                        <i class="menu-icon tf-icons bx bx-support"></i>
                        <div data-i18n="Support">배송관리</div>
                    </a>
                </li>
                <li class="menu-header small text-uppercase"><span class="menu-header-text">Q&A</span></li>
                <li class="menu-item">
                    <a
                            href="/admin/oneList"
                            class="menu-link"
                    >
                        <i class="menu-icon tf-icons bx bx-file"></i>
                        <div data-i18n="Documentation">1:1 문의글</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a
                            href="/admin/qnaList"
                            class="menu-link"
                    >
                        <i class="menu-icon tf-icons bx bx-file"></i>
                        <div data-i18n="Documentation">QnA</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a
                            href="/admin/faqList"
                            class="menu-link"
                    >
                        <i class="menu-icon tf-icons bx bx-file"></i>
                        <div data-i18n="Documentation">FaQ</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a
                            href="/admin/dataList"

                            class="menu-link"
                    >
                        <i class="menu-icon tf-icons bx bx-file"></i>
                        <div data-i18n="Documentation">자료실</div>
                    </a>
                </li>
                <li class="menu-item">
                    <a
                            href="/admin/noticeList"

                            class="menu-link"
                    >
                        <i class="menu-icon tf-icons bx bx-file"></i>
                        <div data-i18n="Documentation">공지사항</div>
                    </a>
                </li>
            </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Navbar -->



            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">상품/</span> 상품 등록</h4>

                    <!-- Basic Layout & Basic with Icons -->
                    <div class="row">
                        <!-- Basic Layout -->
                        <div class="col-xxl">
                            <div class="card mb-4">
                                <div class="card-header d-flex align-items-center justify-content-between">
                                    <h5 class="mb-0">상품 등록</h5>
                                    <small class="text-muted float-end">*표시는 필수입력사항</small>
                                </div>
                                <div class="card-body">
                                    <form name="frm" id="form" enctype="multipart/form-data">

                                        <div class="row mb-3">
                                            <label class="col-sm-2 col-form-label" for="pro_name">* 상품 이름</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="pro_name" id="pro_name" placeholder="" value=""/>
                                            </div>
                                            <span id="final_titleChk" style="display: none; color: red;">공백 없이 입력해주세요.</span>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-2 col-form-label" for="pro_company">* 출판사</label>
                                            <div class="col-sm-10">
                                                <input
                                                        type="text"
                                                        class="form-control"
                                                        id="pro_company"
                                                        placeholder=""
                                                        name="pro_company"
                                                        value=""
                                                />
                                            </div>
                                            <span id="final_companyChk" style="display: none; color: red;">공백 없이 입력해주세요.</span>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-2 col-form-label" for="pro_writer">* 저자</label>
                                            <div class="col-sm-10">
                                                <div class="input-group input-group-merge">
                                                    <input
                                                            type="text"
                                                            id="pro_writer"
                                                            class="form-control"
                                                            placeholder=""
                                                            aria-label=""
                                                            aria-describedby="basic-default-email2"
                                                            name="pro_writer"
                                                            value=""
                                                    />

                                                </div>

                                            </div>
                                            <span id="final_writerChk" style="display: none; color: red;">공백 없이 입력해주세요.</span>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-2 col-form-label" for="pro_video">유튜브 링크</label>
                                            <div class="col-sm-10">
                                                <input
                                                        type="text"
                                                        id="pro_video"
                                                        class="form-control phone-mask"
                                                        placeholder=""
                                                        aria-label="658 799 8941"
                                                        aria-describedby="basic-default-phone"
                                                        name="pro_video"
                                                        value=""
                                                />
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-2 col-form-label" for="pro_content">상세 설명</label>
                                            <div class="col-sm-10">
                            <textarea
                                    id="pro_content"
                                    class="form-control"
                                    name="pro_content"
                                    value=""
                                    rows="30"
                                    aria-describedby="basic-icon-default-message2"
                            ></textarea>
                                            </div>
                                        </div>


                                        <!-- Basic with Icons -->
                                        <div class="col-xxl">
                                            <div class="card mb-4">

                                                <div class="card-body">

                                                    <div class="row mb-3">
                                                        <label class="col-sm-2 col-form-label" for="pro_price">* 상품 가격</label>
                                                        <div class="col-sm-10">
                                                            <div class="input-group input-group-merge">
                              <span id="basic-icon-default-fullname2" class="input-group-text"
                              ><i class="bx bx-user"></i
                              ></span>
                                                                <input
                                                                        type="text"
                                                                        class="form-control"
                                                                        id="pro_price"
                                                                        placeholder=""
                                                                        aria-label=""
                                                                        aria-describedby="basic-icon-default-fullname2"
                                                                        name="pro_price"
                                                                        value=""
                                                                />
                                                            </div>
                                                            <span id="final_priceChk" style="display: none; color: red;">공백 없이 입력해주세요.</span>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <label class="col-sm-2 col-form-label" for="pro_amount">* 상품 수량</label>
                                                        <div class="col-sm-10">
                                                            <div class="input-group input-group-merge">
                              <span id="basic-icon-default-company2" class="input-group-text"
                              ><i class="bx bx-buildings"></i
                              ></span>
                                                                <input
                                                                        type="text"
                                                                        id="pro_amount"
                                                                        class="form-control"
                                                                        placeholder=""
                                                                        aria-label=""
                                                                        aria-describedby="basic-icon-default-company2"
                                                                        name="pro_amount"
                                                                        value=""
                                                                />
                                                            </div>
                                                            <span id="final_amountChk" style="display: none; color: red;">공백 없이 입력해주세요.</span>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <label class="col-sm-2 col-form-label" for="pro_sale">* 상품 할인율</label>
                                                        <div class="col-sm-10">
                                                            <div class="input-group input-group-merge">
                                                                <span class="input-group-text"><i class="bx bx-envelope"></i></span>
                                                                <input
                                                                        type="text"
                                                                        id="pro_sale"
                                                                        class="form-control"
                                                                        placeholder=""
                                                                        aria-label=""
                                                                        aria-describedby="basic-icon-default-email2"
                                                                        name="pro_sale"
                                                                        value=""
                                                                />
                                                            </div>
                                                            <span id="final_saleChk" style="display: none; color: red;">공백 없이 입력해주세요.</span>
                                                        </div>
                                                    </div>

                                                    <%--     <div class="row mb-3">
                                                             <label class="col-sm-2 form-label" for="basic-icon-default-phone">* 상품 이미지</label>
                                                             <div class="col-sm-10">
                                                                 <div class="input-group input-group-merge">

                                                                     <input
                                                                             type="text"
                                                                             id="basic-icon-default-phone"
                                                                             class="form-control phone-mask"
                                                                             placeholder=""
                                                                             aria-label=""
                                                                             aria-describedby="basic-icon-default-phone2"
                                                                             name="pro_img"
                                                                          &lt;%&ndash;   value="${productDetail.pro_img}"&ndash;%&gt;
                                                                     />
                                                                 </div>
                                                             </div>
                                                         </div>--%>
                                                    <div class="row mb-3">
                                                        <label class="col-sm-2 col-form-label" for="pro_category1">* 카테고리 1</label>
                                                        <div class="col-sm-10">
                                                            <div class="input-group input-group-merge">
                                              <span id="category1" class="input-group-text"
                                              ><i class="bx bx-user"></i
                                              ></span>
                                                                <select class="form-control" id="pro_category1" name="pro_category1">
                                                                    <option  disabled="disabled" selected="selected">학력 선택</option>
                                                                    <option value="유아">유아</option>
                                                                    <option value="초등">초등</option>
                                                                    <option value="중학">중학</option>
                                                                    <option value="고등">고등</option>
                                                                </select>
                                                            </div>
                                                            <span id="final_category1Chk" style="display: none; color: red;">공백 없이 입력해주세요.</span>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <label class="col-sm-2 col-form-label" for="pro_category2"> 카테고리 2</label>
                                                        <div class="col-sm-10">
                                                            <div class="input-group input-group-merge">
                                              <span id="category2" class="input-group-text"
                                              ><i class="bx bx-user"></i
                                              ></span>
                                                                <select class="form-control" id="pro_category2" name="pro_category2" >

                                                                </select>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <label class="col-sm-2 col-form-label" for="pro_category3">* 카테고리 3</label>
                                                        <div class="col-sm-10">
                                                            <div class="input-group input-group-merge">
                                              <span id="category3" class="input-group-text"
                                              ><i class="bx bx-user"></i
                                              ></span>
                                                                <select class="form-control" id="pro_category3" name="pro_category3" >

                                                                </select>
                                                            </div>
                                                            <span id="final_category3Chk" style="display: none; color: red;">공백 없이 입력해주세요.</span>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <label class="col-sm-2 col-form-label" for="file">* 이미지</label>
                                                        <div class="col-sm-10">
                                                            <div class="input-group input-group-merge">
                                                          <span id="image" class="input-group-text"
                                                          ></span>
                                                                <input
                                                                        type="file"
                                                                        class="form-control"
                                                                        id="file"

                                                                        name="file"

                                                                />
                                                            </div>
                                                            <span id="final_imageChk" style="display: none; color: red;">공백 없이 입력해주세요.</span>
                                                        </div>
                                                    </div>
                                                   <%-- <div id="result_card">
                                                        <div class="imgDeleteBtn">x</div>
                                                        <img src="/resources/resources/img/books/book1.jpg"/>
                                                    </div>--%>
                                                    <div class="row justify-content-end">
                                                        <div class="col-sm-10">
                                                            <button id="modifyBtn" type="button" class="btn btn-primary">저장</button>
                                                        </div>
                                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- / Content -->

                <!-- / Footer -->

                <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>

    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>
</div>
<!-- / Layout wrapper -->
<script src="/media/jquery-1.12.4.min.js"></script>
<script>
    // 전체 유효성 검사
    let titleCheck = false;
    let companyCheck = false;
    let wrtierCheck = false;
    let priceCheck = false;
    let amountCheck = false;
    let saleCheck = false;
    let category1Check = false;

    let category3Check = false;
/*    let imgCheck = false;*/
/*

    document.querySelector("#file").addEventListener("change", () => {
        // 파일 입력(input) 요소에서 파일 리스트를 가져오기
        const fileInput = document.querySelector("#file").files;

        // 파일이 선택되지 않은 경우 예외 처리
        if (fileInput.length === 0) {
            alert("파일을 선택해주세요.");
            return;
        }

        // 첫 번째 파일 객체 가져오기
        const fileObj = fileInput[0];

        // FormData 객체 생성
        const formData = new FormData();

        // FormData에 파일 객체 추가
        formData.append("uploadFile", fileObj);
        console.log(fileInput[0].name+"AAAA");
        console.log(fileInput+"###f");
        console.log(fileObj+"###f");
        // FormData 출력
        console.log(formData+"###f");

        // AJAX 요청 전송
        $.ajax({
            url: '/admin/uploadAjaxAction',
            processData: false,
            contentType: false,
            data: formData,
            type: 'POST',
            dataType: 'json',
            success: function (result) {
                console.log(result);
                /!* showUploadImage(result);*!/
            },
            error: function (result) {
                alert("이미지 파일이 아닙니다.");
            }
        });
    });
*/

    /*  function showUploadImage(uploadResultArr){
           if(!uploadResultArr || uploadResultArr.length == 0){
               return
           }
         //  let uploadResult = ${"#uploadResult"};
        let obj = uploadResultArr[0];
        let str = "";
        let fileCallPath = obj.uploadFolder + "\\" + obj.newName + obj.fileExt;

        str += "<div id='result_card'>";
        str += "<img src = '/display?fileName=" + fileCallPath + "'>";
        str += "<div class='imgDeleteBtn'>x</div>";
        str += "</div>";

        uploadResult.append(str);
    }*/



    document.querySelector("#pro_category1").addEventListener("change", function (e) {
        let selectValue = this.value;
        let pro_category2 = document.querySelector("#pro_category2");
        console.log("###" + selectValue);
        let str = "";
        if (selectValue === "유아") {
            str = "";
            pro_category2.innerHTML = str; // 이전에 추가된 내용을 지워야 함
        } else if (selectValue === "초등") {
            str = "";
            str += "<option value='disabled' disabled='disabled' selected='selected'>초등학년 학년 선택</option>";
            str += " <option value='1'>1학년</option>";
            str += " <option value='2'>2학년</option>";
            str += " <option value='3'>3학년</option>";
            str += " <option value='4'>4학년</option>";
            str += " <option value='5'>5학년</option>";
            str += " <option value='6'>6학년</option>";
            pro_category2.innerHTML = str; // 이전에 추가된 내용을 지워야 함
        } else if(selectValue === "중학"){
            str = "";
            str += "<option value='disabled' disabled='disabled' selected='selected'>중학교 학년 선택</option>";
            str += " <option value='1'>1학년</option>";
            str += " <option value='2'>2학년</option>";
            str += " <option value='3'>3학년</option>";
            pro_category2.innerHTML = str; // 이전에 추가된 내용을 지워야 함
        } else {
            str = "";
            str += "<option value='disabled' disabled='disabled' selected='selected'>고등학교 학년 선택</option>";
            str += " <option value='1'>1학년</option>";
            str += " <option value='2'>2학년</option>";
            str += " <option value='3'>3학년</option>";
            pro_category2.innerHTML = str; // 이전에 추가된 내용을 지워야 함
        }


        let selectValue1 = this.value;
        let pro_category3 = document.querySelector("#pro_category3");

        let str1 = "";
        if (selectValue1 === "유아") {
            str1 = "";
            str1 += "<option value='disabled' disabled='disabled' selected='selected'>과목 선택</option>";
            str1 += " <option value='한글'>한글</option>";
            str1 += " <option value='영어'>영어</option>";
            str1 += " <option value='수학'>수학</option>";
            pro_category3.innerHTML = str1; // 이전에 추가된 내용을 지워야 함
        } else{
            str1 = "";
            str1 += "<option value='disabled' disabled='disabled' selected='selected'>과목 선택</option>";
            str1 += " <option value='국어'>한글</option>";
            str1 += " <option value='수학'>수학</option>";
            str1 += " <option value='영어'>영어</option>";
            str1 += " <option value='사회'>사회</option>";
            str1 += " <option value='과학'>과학</option>";
            pro_category3.innerHTML = str1; // 이전에 추가된 내용을 지워야 함
        }

    });

    const frm = document.querySelector("#form");
    document.querySelector("#modifyBtn").addEventListener("click",function (e){
        e.preventDefault();
        let title = document.querySelector("#pro_name").value;
        let company = document.querySelector("#pro_company").value;
        let writer = document.querySelector("#pro_writer").value;
        let price = document.querySelector("#pro_price").value;
        let amount = document.querySelector("#pro_amount").value;
        let sale = document.querySelector("#pro_sale").value;
        let category1 = document.querySelector("#pro_category1").value;

        let category3 = document.querySelector("#pro_category3").value;
      /*  let image = document.querySelector("#pro_image").value;*/
        //ID 공백 체크
        if(title == ""){
            document.querySelector("#final_titleChk").style.display = 'block';
            titleCheck = false;
        } else {
            document.querySelector("#final_titleChk").style.display = 'none';
            titleCheck = true;
        }
        //PWD 공백 체크
        if(company == ""){
            document.querySelector("#final_companyChk").style.display = 'block';
            companyCheck = false;
        } else {
            document.querySelector("#final_companyChk").style.display = 'none';
            companyCheck = true;
        }
        //PWD 재확인 공백 체크
        if(writer == ""){
            document.querySelector("#final_writerChk").style.display = 'block';
            wrtierCheck = false;
        } else {
            document.querySelector("#final_writerChk").style.display = 'none';
            wrtierCheck = true;
        }
        //이메일 공백 체크
        if(price == ""){
            document.querySelector("#final_priceChk").style.display = 'block';
            priceCheck = false;
        } else {
            document.querySelector("#final_priceChk").style.display = 'none';
            priceCheck = true;
        }
        //핸드폰 공백 체크
        if(amount == ""){
            document.querySelector("#final_amountChk").style.display = 'block';
            amountCheck = false;
        } else {
            document.querySelector("#final_amountChk").style.display = 'none';
            amountCheck = true;
        }
        //주소 공백 체크
        if(sale == ""){
            document.querySelector("#final_saleChk").style.display = 'block';
            saleCheck = false;
        } else {
            document.querySelector("#final_saleChk").style.display = 'none';
            saleCheck = true;
        }
        //이름 공백 체크
        if(category1 == ""){
            document.querySelector("#final_category1Chk").style.display = 'block';
            category1Check = false;
        } else {
            document.querySelector("#final_category1Chk").style.display = 'none';
            category1Check = true;
        }
        //이름 공백 체크

        //이름 공백 체크
        if(category3 == ""){
            document.querySelector("#final_category3Chk").style.display = 'block';
            category3Check = false;
        } else {
            document.querySelector("#final_category3Chk").style.display = 'none';
            category3Check = true;
        }

   /*     if(image == ""){
            document.querySelector("#final_imageChk").style.display = 'block';
            imgCheck = false;
        } else {
            document.querySelector("#final_imageChk").style.display = 'none';
            imgCheck = true;
        }*/
        if(titleCheck&&companyCheck&&wrtierCheck&&priceCheck&&amountCheck&&saleCheck&&category1Check&&category3Check){
            frm.method = "post";
            frm.action = "/admin/productRegistPro";
            frm.submit();
        }

        return;
    });

</script>
<%--<script>
document.querySelector("#modifyBtn").addEventListener("click",function (e){
    const frm = document.querySelector("#form");
    frm.method = "post";
    frm.action = "/admin/productRegistPro";
    frm.submit();
});
</script>--%>
<!-- Core JS -->

<script src="/resources/resources/assets/vendor/libs/jquery/jquery.js"></script>
<script src="/resources/resources/assets/vendor/libs/popper/popper.js"></script>
<script src="/resources/resources/assets/vendor/js/bootstrap.js"></script>
<script src="/resources/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="/resources/resources/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="/resources/resources/assets/js/main.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
