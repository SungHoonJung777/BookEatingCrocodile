<%--
  Created by IntelliJ IDEA.
  User: ryuri
  Date: 2024-04-25
  Time: PM 3:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>회원정보 수정</title>

    <meta name="description" content="" />

    <!-- Favicon -->


    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/resources/resources/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/resources/resources/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/resources/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="/resources/resources/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/resources/resources/assets/js/config.js"></script>
    <style>
        #body {
            margin-top: 180px;
        }

    </style>

</head>

<body id="body">
<jsp:include page="../common/header.jsp"/>
<!-- Layout wrapper -->
<%--<div class="layout-wrapper layout-content-navbar">--%>
<div class="container">
    <div class="layout-container">
        <!-- Menu -->

        <jsp:include page="nav.jsp"/>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">마이페이지 /</span> 정보수정</h4>

                    <div class="row">
                        <div class="col-md-12">
                            <ul class="nav nav-pills flex-column flex-md-row mb-3">
                                <li class="nav-item">
                                   <i class="bx bx-user me-1"></i> Account
                                </li>

                            </ul>
                            <div class="card mb-4">
                                <h5 class="card-header">Profile Details</h5>
                                <!-- Account -->
                                <form id="formAccountSettings" method="POST" action="/member/modify" enctype="multipart/form-data">
                                    <input type="hidden" value="${member.member_id}" name="member_id">
                                    <div class="card-body">
                                        <div class="d-flex align-items-start align-items-sm-center gap-4">
                                            <img src="/resources/resources/uploads/img/member/${member.member_img}" alt="user-avatar" class="d-block rounded"  height="100" width="100" id="preview"  />
                                            <div class="button-wrapper">
                                                <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                                                    <span class="d-none d-sm-block">Upload new photo</span>
                                                    <i class="bx bx-upload d-block d-sm-none"></i>
                                                    <input type="file" id="upload" name="upload" class="account-file-input" hidden  accept="image/png, image/jpeg" onchange="readURL(this)" />
                                                </label>
                                                <input type="hidden" name="member_img" value="${member.member_img}">
<%--                                                <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">--%>
<%--                                                    <i class="bx bx-reset d-block d-sm-none"></i>--%>
<%--                                                    <span class="d-none d-sm-block">Reset</span>--%>
<%--                                                </button>--%>

                                                <p class="text-muted mb-0">JPG 또는 PNG 파일만 업로드 가능합니다. 최대 사이즈는 800K 입니다.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="my-0" />
                                    <div class="card-body">

                                        <div class="row">
                                            <div class="mb-3 col-md-6">
                                                <label for="name" class="form-label">이름</label>
                                                <input class="form-control" type="text" id="name"  name="member_name" value="${member.member_name}" />
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="phone">전화번호</label>

                                                    <input type="text" id="phone" name="member_phone" class="form-control" value="${member.member_phone}" />

                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="zonecode">우편번호</label>
                                                <div class="input-group input-group-merge">
                                                    <input readonly type="address" id="zonecode" name="member_zonecode" class="form-control" value="${member.member_zonecode}" />
                                                </div>
                                            </div>
                                            <div class="mb-3 col-md-6">
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label class="form-label" for="addr1">주소</label>
                                                    <input type="text" id="addr1" name="member_addr1" class="form-control" value="${member.member_addr1}" onclick="address()" />
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="addr2" class="form-label">상세주소</label>
                                                <input type="text" class="form-control" id="addr2" name="member_addr2" value="${member.member_addr2}"/>
                                            </div>
                                            <div class="mt-4">
                                                <button type="button" id="pwdModify" class="btn btn-outline-secondary">비밀번호 변경</button>
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="pwd" class="form-label">비밀번호</label>
                                                <input class="form-control" disabled type="password" id="pwd" name="member_pwd" value=""/>
                                            </div>
                                            <div class="mb-3 col-md-6">
                                                <label for="pwdCheck" class="form-label">비밀번호 확인</label>
                                                <input disabled type="password" class="form-control" id="pwdCheck" name="pwdCheck" value="" />
                                            </div>
                                            <input type="hidden" name="pwdYN" id="pwdYN" value="Y">
                                        </div>
                                        <div class="mt-2">
                                            <button type="submit" id="btnSubmit" class="btn btn-primary me-2">Save changes</button>
                                            <button type="reset" id="btnReset" onclick="resetFrm()" class="btn btn-outline-secondary">Cancel</button>
                                        </div>

                                    </div>
                                </form>
                                <!-- /Account -->
                            </div>
                            <div class="card">
                                <h5 class="card-header">회원탈퇴</h5>
                                <div class="card-body">
                                    <div class="mb-3 col-12 mb-0">
                                        <br>
                                        <div class="alert alert-warning">
                                            <h6 class="alert-heading fw-bold mb-1">탈퇴 하시겠습니까?</h6>
                                            <p class="mb-0">탈퇴를 하시면 다시 조회를 하실 수 없습니다. 위 사항을 확인해 주십시오.</p>
                                        </div>
                                    </div>
                                    <form id="frmDelete" action="/member/delete" method="post" >

                                        <div class="form-check mb-3">
                                            <input type="hidden" value="${member.member_id}" name="member_id">
                                            <input
                                                    class="form-check-input"
                                                    type="checkbox"
                                                    name="accountActivation"
                                                    id="accountActivation"
                                            />
                                            <label class="form-check-label" for="accountActivation">네, 탈퇴하겠습니다.</label>
                                        </div>
                                        <button type="button" class="btn btn-danger deactivate-account" id="btnDelete" onclick="deleteAlert()">회원탈퇴</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



            </div>

        </div>

    </div>



</div>
<jsp:include page="../common/footer.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/resources/assets/js/pages-account-settings-account.js"></script>
<script src="/resources/resources/assets/js/main.js"></script>
<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->

<script src="/resources/resources/assets/vendor/libs/jquery/jquery.js"></script>
<script src="/resources/resources/assets/vendor/libs/popper/popper.js"></script>
<script src="/resources/resources/assets/vendor/js/bootstrap.js"></script>
<script src="/resources/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="/resources/resources/assets/vendor/js/menu.js"></script>
<script>

    //프로필 사진 미리보기
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
    }


    // 주소 api
    function address() {
        let zonecode = document.getElementById("zonecode");
        let addr1 = document.getElementById("addr1");
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                addr1.value = data.roadAddress;
                zonecode.value= data.zonecode;
            }
        }).open();
    }

    // 탈퇴 체크박스
    function deleteAlert() {
        let check = document.getElementById("accountActivation");
        let frm = document.getElementById("frmDelete");
        if (!check.checked){
            window.alert("체크사항을 확인해 주세요.");
        }
        else {
            let confirmYN = window.confirm("정말 탈퇴하시겠습니까?");
            if (confirmYN) {
                document.getElementById("frmDelete").submit();
            }
        }
    }




    //비밀번호 재확인
    let pwd = document.getElementById("pwd");
    let pwdChk = document.getElementById("pwdCheck");
    let frm = document.getElementById("formAccountSettings");
    let pwdYN = document.getElementById("pwdYN")

    document.getElementById("pwdModify").addEventListener("click", () => {

        pwd.disabled = false;
        pwdChk.disabled = false;

        pwdYN.value = "N";
        console.log(pwdYN);

    });

    //비밀번호 유효성 체크
    function strongPassword (pwd) {
        return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(pwd);
    }


    //비밀번호 맞지 않을 시, 전화번호 형식 안맞을 시, 이름 형식 안맞을 시, 빈칸일 시 제출 못함

    let pwCheck = true;
    let pwReCheck = true;
    let nameCheck = true;
    let emailCheck = true;
    let addressCheck = true;
    let phoneCheck = true;


    document.getElementById("btnSubmit").addEventListener("click", (e) => {
        let phone = document.getElementById("phone").value;
        let regPhone = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
        let name = document.querySelector("#name");
        let addr1 = document.getElementById("addr1");
        let addr2 = document.getElementById("addr2");




        if (name.value.length < 1) {
            alert("이름을 입력해 주세요.");
            nameCheck = false;
        } else {
            nameCheck = true;
        }

        if (addr1.value.length < 1) {
            alert("주소를 입력해 주세요.");
            addressCheck = false;
        } else {
            addressCheck = true;
        }

        if (addr2.value.length < 1) {
            alert("상세 주소를 입력해 주세요.");
            addressCheck = false;
        } else {
            addressCheck = true;
        }



            if (pwdYN.value === "N" || pwCheck === false) {
                if ( strongPassword(pwd.value) === false) {
                    alert("비밀번호는 특수문자 포함 8자리 이상입니다.");
                    pwCheck = false;
                } else {
                    pwCheck = true;
                }
                if (pwd.value === pwdChk.value) {
                    pwdYN.value = "Y"
                    pwReCheck = true;
                } else {
                    alert("비밀번호가 일치하지 않습니다.");
                    pwReCheck = false;
                }
            }




        if (!regPhone.test(phone)) {
            alert("전화번호 형식에 맞춰주세요. ex)010-1234-5678");
            phoneCheck = false;
        } else {
            phoneCheck = true;
        }

        if (pwCheck && pwReCheck && nameCheck && emailCheck && addressCheck && phoneCheck && pwdYN.value === "Y") {
            alert("수정 완료");
            frm.submit();
        }

        e.preventDefault();
    });


    //초기화 버튼
    function resetFrm() {
        location.href = "/member/modify";
    }





    //
    //

    // let id = document.querySelector("#idn");
    // let pwd = document.querySelector("#password");
    // let pwd2 = document.querySelector("#password2");
    // let birthY = document.querySelector("#selectborn1");
    // let birthM = document.querySelector("#selectborn2");
    // let birthD = document.querySelector("#selectborn3");
    // let tel = document.querySelector("#telnumber");
    // let email = document.querySelector("#email");
    // let interest = document.querySelector("#interest");
    // let grade = document.querySelector("#grade");
    // let emailSelect = document.querySelector("#emailSelect");
    // let typing = document.querySelector("#typing");
    // let frm = document.querySelector("#frm");
    //
    // // 밸리데이션체크 준비
    // let nameChk = document.querySelector("#nameChk");
    // let idChk = document.querySelector("#idChk");
    // let pwdChk = document.querySelector("#pwdChk");
    // let pwd2Chk = document.querySelector("#pwd2Chk");
    // let birthChk = document.querySelector("#birthChk");
    // let telChk = document.querySelector("#telChk");
    // let emailChk = document.querySelector("#emailChk");
    //
    // // 이름 체크
    // name.addEventListener("keyup", ()=> {
    //     noSpaceForm(name);
    //     characterCheck(name);
    //     numberCheck(name);
    // });
    // name.addEventListener("change", () => {
    //     noSpaceForm(name);
    //     characterCheck(name);
    //     numberCheck(name);
    // });
    //
    //
    // //공백체크
    // function noSpaceForm(obj) { // 공백사용못하게
    //     var regExp = /\s/;  // 공백체크
    //     if(regExp.test(obj.value)) { //공백 체크
    //         alert("이름에는 공백을 사용할수 없습니다.");
    //         obj.focus();
    //         obj.value = obj.value.replace(/\s| /gi,''); // 공백제거
    //         return false;
    //     }
    // }
    //
    // // 특수문자 입력 방지
    // function characterCheck(obj){
    //     var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
    //     // 허용할 특수문자는 여기서 삭제하면 됨
    //     // 지금은 띄어쓰기도 특수문자 처리됨 참고하셈
    //     if( regExp.test(obj.value) ){
    //         alert("이름에 특수문자를  없습니다.");
    //         obj.focus();
    //         obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
    //     }
    // }
    //
    // //숫자 입력 방지
    // function numberCheck(obj) {
    //     var regExp = /\d/;
    //     if (regExp.test(obj.value)) {
    //         alert("이름에 숫자를 넣을 수 없습니다.");
    //         obj.focus();
    //         obj.value = obj.value.substring(0, obj.value.length - 1);
    //     }
    // }
    //
    // //한글 잘 써넣기
    // function hanCheck(obj) {
    //     var regExp = /[ㄱ-ㅎㅏ-ㅣ]/gi;
    //     if (regExp.test(obj.value)) {
    //         alert("정규 한글 표현만 가능합니다.");
    //         obj.value = obj.value.substring(0, obj.value-length - 1);
    //     }
    // }
    //
    // var regularHanCheck = /[ㄱ-ㅎ|ㅏ-ㅣ]/gi;
    // var hanCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힇]/;
    // var expCheck = /[~!@#\#$%<>^&*]/;
    // var numCheck = /[0-9]/;
    // var engCheck = /[a-zA-Z]/;
    //
    //
    //
    //
    //
    //
    //
    //
    // document.querySelector("#btnRegist").addEventListener("click", (e) => {
    //     let name = document.querySelector("#iname");
    //     let id = document.querySelector("#idn");
    //     let pwd = document.querySelector("#password");
    //     let pwd2 = document.querySelector("#password2");
    //     let birthY = document.querySelector("#selectborn1");
    //     let birthM = document.querySelector("#selectborn2");
    //     let birthD = document.querySelector("#selectborn3");
    //     let tel = document.querySelector("#telnumber");
    //     let email = document.querySelector("#email");
    //     let interest = document.querySelector("#interest");
    //     let grade = document.querySelector("#grade");
    //     let radio = document.querySelectorAll("input[type='radio']");
    //     let cc1 = document.querySelector("#cc1");
    //     let cc2 = document.querySelector("#cc2");
    //
    //
    //     e.preventDefault();
    //
    //     //이름 비어있을 때
    //     if (name == null || name.value.length == 0) {
    //         nameChk.style.display = "block";
    //         name.focus();
    //         return false;
    //     }
    //     //아이디 비어있을 때
    //     if (id == null || id.value.length == 0) {
    //         idChk.style.display = "block";
    //         id.focus();
    //         return false;
    //     }
    //
    //     //비밀번호 비어있을 때
    //     if (pwd == null || pwd.value.length == 0) {
    //         alert("비밀번호를 입력하세요. ");
    //         pwd.focus();
    //         return false;
    //     }
    //
    //
    //     //비밀번호 재입력 비어있을 때
    //     if (pwd2 == null || pwd2.value.length == 0) {
    //         alert("비밀번호 재입력을 확인해 주세요.");
    //         pwd2.focus();
    //         return false;
    //     }
    //     // 생년월일 비어있을 때
    //     if (birthY == null || birthY.value.length == 0) {
    //         alert("생년월일을 선택해 주세요.");
    //         birthY.focus();
    //         return false;
    //     }
    //     if (birthM == null || birthM.value.length == 0) {
    //         alert("생년월일을 선택해 주세요.");
    //         birthM.focus();
    //         return false;
    //     }
    //     if (birthD == null || birthD.value.length == 0) {
    //         alert("생년월일을 선택해 주세요.");
    //         birthD.focus();
    //         return false;
    //     }
    //     // 휴대번호 비어있을 때
    //     if (tel == null || tel.value.length == 0) {
    //         telChk.style.display = "block";
    //         tel.focus();
    //         return false;
    //     }
    //
    //     // 이메일 비어있을 때
    //     if (email == null || email.value.length == 0) {
    //         emailChk.style.display = "block";
    //         email.focus();
    //         return false;
    //     }
    //
    //     //관심분야 비어있을 때
    //     if (interest == null || interest.value.length == 0) {
    //         alert("관심사항을 선택해 주세요.");
    //         interest.focus();
    //         return false;
    //     }
    //
    //     // 학년 비어있을 때
    //     if (grade == null || grade.value.length == 0) {
    //         alert("학년을 선택해 주세요.");
    //         grade.focus();
    //         return false;
    //     }
    //     //성별 체크
    //     var cnt = 0;
    //     for (var i=0; i<radio.length; i++) {
    //         if (radio[i].checked == true) {
    //             cnt++;
    //         }
    //     }
    //     if (cnt < 1) {
    //         alert("성별을 선택해 주세요.");
    //         return false;
    //     }
    //
    //     //필수항목 체크
    //     if (!cc1.checked || !cc2.checked) {
    //         alert("필수 항목을 체크해 주세요.");
    //         return false;
    //     }
    //
    //     // 이름 정규 한글 표현
    //     if (regularHanCheck.test(name.value)) {
    //         alert("이름은 정규 한글 표현만 가능합니다.");
    //         return false;
    //     }
    //
    //     //이름 영문 또는 한글만 가능
    //     if (engCheck.test(name.value) && hanCheck.test(name.value)) {
    //         alert("이름은 영어 또는 한글 둘 중 하나만 사용 가능합니다.");
    //         return false;
    //     }
    //
    //
    //
    //
    //     // 비밀번호 벨리데이션 체크
    //     if (!(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{10,16}$/.test(pwd.value))) {
    //         pwdChk.style.display = "block";
    //         pwd.focus();
    //         return false;
    //     }
    //
    //     // 비밀번호 재입력 확인
    //     if (!(pwd.value === pwd2.value)) {
    //         pwd2Chk.style.display = "block";
    //         pwd2.focus();
    //         return false;
    //     }
    //
    //
    //
    //
    //     else {
    //         alert("T ClASS 회원가입이 완료되었습니다.");
    //         frm.submit();
    //     }
    //
    // }, false);
    //
    //





</script>
</body>
</html>
