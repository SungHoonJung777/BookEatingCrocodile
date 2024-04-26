<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
  />
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">    <title>Login Basic - Pages | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

  <meta name="description" content="" />

  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  function sample6_execDaumPostcode() {
    new daum.Postcode({
      oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        var extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
          addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
          addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if(data.userSelectedType === 'R'){
          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            extraAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if(data.buildingName !== '' && data.apartment === 'Y'){
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if(extraAddr !== ''){
            extraAddr = ' (' + extraAddr + ')';
          }
          // 조합된 참고항목을 해당 필드에 넣는다.


        } else {

        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('zoneCode').value = data.zonecode;
        document.getElementById("addr1").value = addr;
        // 커서를 상세주소 필드로 이동한다.
        document.getElementById("addr2").focus();
      }
    }).open();
  }
</script>
<!-- Content -->

<div class="container-xxl">
  <div class="authentication-wrapper authentication-basic container-p-y">
    <div class="authentication-inner">
      <!-- Register Card -->
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
          <h4 class="mb-2">Adventure starts here 🚀</h4>
          <p class="mb-4">Make your app management easy and fun!</p>

          <form id="formAuthentication" class="mb-3" >
            <div class="mb-3">
              <label for="username" class="form-label">이름</label>
              <input
                      type="text"
                      class="form-control"
                      id="username"
                      name="member_name"
                      placeholder="Enter your username"
                      autofocus
                      style="margin-bottom: 10px;"
              />
              <span id="final_nameChk" style="display: none; margin-bottom: 10px; color: red">이름을 3글자 이상으로 입력해주세요.</span>
            </div>
            <div class="mb-3">
              <label for="member_id" class="form-label">ID</label>
              <input
                      type="text"
                      class="form-control"
                      id="member_id"
                      name="member_id"
                      placeholder="ID를 입력하세요."
                      autofocus

                      style="margin-bottom: 10px;"
              />
              <span id="trueId" style="display: none; color: green; ">가입 가능한 아이디 입니다.</span>
              <span id="warnId" style="display: none; color: red;">이미 가입 된 아이디 입니다.</span>
              <span id="final_idChk" style="display: none; color: red"" >아이디는 영문자와 숫자만 입력 가능합니다.</span>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">이메일</label>
              <input type="text" class="form-control" id="email" name="member_email" placeholder="Enter your email" />
              <input type="text" class="form-control" id="emailCheck"  name="emailCheck" placeholder="인증번호를 입력해주세요." style="display: none; margin-top: 20px; margin-bottom: 10px;"/>
              <span class="emailTrue" id="emailTrue" style="color:green;"></span>

            </div>
            <div style="margin-top: 20px;">
              <span id="final_mailChk" style="display: none; margin-top: 20px; margin-bottom: 10px; color: red"" >이메일 형식으로 입력해주세요.</span>
            </div>
            <div>
              <button type="button" name="emailBtn" id="emailBtn" class="btn btn-primary d-grid w-20" style="margin-bottom: 10px;">인증번호 발급</button>
            </div>
            <div class="mb-3 form-password-toggle">
              <label class="form-label" for="password">비밀번호</label>
              <div class="input-group input-group-merge" >
                <input
                        type="password"
                        id="password"
                        class="form-control"
                        name="member_pwd"
                        placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                        aria-describedby="password"
                />
                <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>

              </div>
            </div>
            <div>
              <span id="final_pwdChk" style="display: none; margin-bottom: 10px; color: red"">비밀번호는 특수문자 포함 8자리 이상입니다.</span>
            </div>
            <div class="mb-3 form-password-toggle">
              <label class="form-label" for="password">비밀번호 확인</label>
              <div class="input-group input-group-merge">
                <input
                        type="password"
                        id="passwordCheck"
                        class="form-control"
                        name="passwordCheck"
                        placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                        aria-describedby="passwordCheck"
                />
                <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>

              </div>
            </div>
            <div>
              <span id="pwdChk_input_1"  style="display: none; margin-bottom: 30px; color: green;">비밀번호가 일치합니다.</span>
              <span id="pwdChk_input_2"  style="display: none; margin-bottom: 30px; color: red;">비밀번호가 일치하지 않습니다.</span>
              <span id="final_pwdReChk" style="display: none; margin-bottom: 30px; color: red; ">비밀번호는 특수문자 포함 8자리 이상입니다.</span>
            </div>
            <div class="mb-3">
              <label for="phone" class="form-label">핸드폰 번호</label>
              <input type="tel" class="form-control" id="phone" name="member_phone" placeholder="핸드폰 번호를 입력해주세요." style="margin-bottom: 10px;"/>
              <span id="final_phoneChk" style="display: none; color: red;">핸드폰 번호는 11자리로 입력해주세요.</span>
            </div>
            <div class="mb-3">
              <label for="addr1" class="form-label">주소</label>
              <input type="text" class="form-control" id="addr1" name="member_addr1" placeholder="주소 입력" value="" readonly="readonly" style="margin-bottom: 10px;"/>
              <span id="final_addrChk" style="display: none; color: red;">주소를 입력해주세요.</span>
            </div>
            <div>
              <button type="button" name="addrSearchBtn" id="addrSearchBtn" class="btn btn-primary d-grid w-20" onclick="sample6_execDaumPostcode()" style="margin-bottom: 10px;">주소찾기</button>
            </div>
            <div class="mb-3">
              <label for="addr2" class="form-label">상세 주소</label>
              <input type="text" class="form-control" id="addr2" name="member_addr2" placeholder="상세 주소를 입력해주새요." />
            </div>
            <div class="mb-3">
              <label for="phone" class="form-label">우편 번호</label>
              <input type="tel" class="form-control" id="zoneCode" name="member_zonecode" placeholader="우편 번호 입력" value="" readonly="readonly"/>
            </div>
            <div class="mb-3">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" id="terms-conditions" name="terms" />
                <label class="form-check-label" for="terms-conditions">
                  I agree to
                  <a href="javascript:void(0);">privacy policy & terms</a>
                </label>
              </div>
            </div>
            <button type="button" id="joinBtn" class="btn btn-primary d-grid w-100">Sign up</button>
          </form>

          <p class="text-center">
            <span>Already have an account?</span>
            <a href="auth-login-basic.html">
              <span>Sign in instead</span>
            </a>
          </p>
        </div>
      </div>
      <!-- Register Card -->
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- Page JS -->
<%--<script>

  // 전체 유효성 검사
  let idCheck = false;
  let idDutCheck = false;
  let pwCheck = false;
  let pwReCheck = false;
  let nameCheck = false;
  let emailCheck = false;
  let emailNumCheck = false;
  let addressCheck = false;
  let phoneCheck = false;

  function  strongName(name){
    return /^[가-힣]{2,6}$/.test(name);
  }
  //ID 유효성 검사
  function onlyNumberAndEnglish(id) {
    return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(id);
  }
  //PWD 유효성 검사
  function strongPassword (pwd) {
    return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(pwd);
  }
  //이메일 유효성 검사
  function strongEmail (email) {
    return /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test(email);
  }
  //핸드폰 유효성 검사
  function isHpFormat(phone) {
    var phoneRule = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
    return /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/.test(phone);
  }


  //ID 중복검사
  document.querySelector("#member_id").addEventListener("blur",function(){


    let memberId = document.querySelector("#member_id").value;
    let data = {memberId : memberId};

    if(memberId != "" && onlyNumberAndEnglish(memberId) == true){
      document.querySelector("#final_idChk").style.display = 'none';
      $.ajax({
        type : "post",
        url : "/member/memberIdChk",
        data : data,
        success : function (result){
          if(result == 'fail' ){

            document.querySelector("#warnId").style.display = 'block';
            document.querySelector("#trueId").style.display = 'none';
            idDutCheck = false;
          } else {
            document.querySelector("#warnId").style.display = 'none';
            document.querySelector("#trueId").style.display = 'block';
            idDutCheck = true;
          }
        }
      });
    } else {
      document.querySelector("#final_idChk").style.display = 'block';
      document.querySelector("#warnId").style.display = 'none';
      document.querySelector("#trueId").style.display = 'none';
      idCheck = false;
    }

  })
  // 비밀번호 유효성
  document.querySelector("#passwordCheck").addEventListener("blur",function () {
    if(strongPassword(document.querySelector("#passwordCheck").value) == false){
      document.querySelector("#final_pwdChk").style.display = 'block';
      pwCheck = false;
    } else {
      document.querySelector("#final_pwdChk").style.display = 'none';
      pwCheck = true;
    }
  });

  //PWD 재확인 유효성 검사
  document.querySelector("#passwordCheck").addEventListener("blur",function () {
    let pwd = document.querySelector("#password").value;
    let pwdChk = document.querySelector("#passwordCheck").value;

    if(pwd == pwdChk){
      document.querySelector("#pwdChk_input_1").style.display = 'block';
      document.querySelector("#pwdChk_input_2").style.display = 'none';
      pwReCheck = true;
    } else {
      document.querySelector("#pwdChk_input_1").style.display = 'none';
      document.querySelector("#pwdChk_input_2").style.display = 'block';
      pwReCheck = false;
    }
  });
  //인증번호 코드
  let code = "";
  document.querySelector("#emailBtn").addEventListener("click",function (e){
      e.preventDefault();
      if(document.querySelector("#email").value == "" || strongEmail(document.querySelector("#email").value) === false){
          document.querySelector("#final_mailChk").style.display = 'block';
      } else {
        document.querySelector("#final_mailChk").style.display = 'none';
        let emailCheckForm = document.querySelector("#emailCheck").style.display = 'block';
        document.querySelector("#emailBtn").style.backgroundColor = 'grey';
        document.querySelector("#emailBtn").setAttribute("disabled","disabled");


        let email = document.querySelector("#email");
        let emailValue = email.value;
        let checkBox = $("#emailCheck");  // 인증번호 입력란
        let boxWrap = $(".emailTrue");   // 인증번호 입력란 박스
        $.ajax({

          type:"GET",
          url:"/member/email?email=" + emailValue,
          success : function (data){
            console.log("data : " + data);
            checkBox.attr("disabled",false);
            boxWrap.attr("id", "mail_check_input_box_true");
            code = data;
          }

        });
      }

  })

  /* 인증번호 비교 */
  $("#emailCheck").blur(function(){
    let inputCode = $("#emailCheck").val();        // 입력코드
    let checkResult = $(".emailTrue") ; // 비교 결과

    if(inputCode == code){
      checkResult.empty().html("인증번호가 일치합니다.");
      emailNumCheck = true;
    } else {
      checkResult.empty().html("인증번호를 다시 확인해주세요.");
      emailNumCheck = false;
    }
  });

  $(document).ready(function (){
    document.querySelector("#joinBtn").addEventListener("click", function (){
      let id = document.querySelector("#member_id").value;
      let pwd = document.querySelector("#password").value;
      let pwdChk = document.querySelector("#passwordCheck").value;
      let name = document.querySelector("#username").value;
      let email = document.querySelector("#email").value;
      let phone = document.querySelector("#phone").value;
      let addr = document.querySelector("#addr1").value;

      //ID 공백 체크
      if(id == ""){
        document.querySelector("#final_idChk").style.display = 'block';
        idCheck = false;
      } else {
        document.querySelector("#final_idChk").style.display = 'none';
        idCheck = true;
      }
      //PWD 공백 체크
      if(pwd == ""){
        document.querySelector("#final_pwdChk").style.display = 'block';
        pwCheck = false;
      } else {
        document.querySelector("#final_pwdChk").style.display = 'none';
        pwCheck = true;
      }
      //PWD 재확인 공백 체크
      if(pwdChk == ""){
        document.querySelector("#final_pwdReChk").style.display = 'block';
        pwReCheck = false;
      } else {
        document.querySelector("#final_pwdReChk").style.display = 'none';
        pwReCheck = true;
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
      //주소 공백 체크
      if(addr == ""){
        document.querySelector("#final_addrChk").style.display = 'block';
        addressCheck = false;
      } else {
        document.querySelector("#final_addrChk").style.display = 'none';
        addressCheck = true;
      }
      //이름 공백 체크
      if(name == ""){
        document.querySelector("#final_nameChk").style.display = 'block';
        nameCheck = false;
      } else {
        document.querySelector("#final_nameChk").style.display = 'none';
        nameCheck = true;
      }
      //이름 유효성 검사
      if(strongName(name) == false){
        document.querySelector("#final_nameChk").style.display = 'block';
        nameCheck = false;
      } else {
        document.querySelector("#final_nameChk").style.display = 'none';
        nameCheck = true;
      }
      //ID 유효성 검사
      if(onlyNumberAndEnglish(id) == false){
        document.querySelector("#final_idChk").style.display = 'block';
        idCheck = false;
      } else {
        document.querySelector("#final_idChk").style.display = 'none';
        idCheck = true;
      }
      //PWD 유효성 검사
      if(strongPassword (pwd) == false){
        document.querySelector("#final_pwdChk").style.display = 'block';
        pwCheck = false;
      } else {
        document.querySelector("#final_pwdChk").style.display = 'none';
        pwCheck = true;
      }
      //이메일 유효성 검사
      if(strongEmail (email) == false){
        document.querySelector("#final_mailChk").style.display = 'block';
        emailCheck = false;
      } else {
        document.querySelector("#final_mailChk").style.display = 'none';
        emailCheck = true;
      }
      //핸드폰 유효성 검사
       if(isHpFormat(phone) == false) {
         document.querySelector("#final_phoneChk").style.display = 'block';
         phoneCheck = false;
       } else {
         document.querySelector("#final_phoneChk").style.display = 'none';
         phoneCheck = true;
       }

      let frm = document.querySelector("#formAuthentication");
      if(idCheck&&idDutCheck&&pwCheck&&pwReCheck&&nameCheck&&emailCheck&&emailNumCheck&&addressCheck&&phoneCheck){
          frm.method = "post";
          frm.action = "/member/join";
          frm.submit();
      }

      return false;


    });
  });

</script>--%>
<script>
  $(document).ready(function (){
    document.querySelector("#joinBtn").addEventListener("click", function (){
      let frm = document.querySelector("#formAuthentication");
      frm.method = "post";
      frm.action = "/member/join";
      frm.submit();
    });
  });
</script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
