<%--
  Created by IntelliJ IDEA.
  User: paksa
  Date: 2024-04-25
  Time: 오후 5:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .footer-logo {
            float: left;
            padding: 33px 0 0 0;
        }

        #footer .footer-info {
            padding: 25px 0 0;
            width: 100%;
            display: inline-block;
        }

        #footer .footer-info > div {
            float: left;
            display: inline-block;
            vertical-align: top;
            font-size: 12px;
        }

        #footer .footer-info > div:first-child {
        }

        #footer .footer-info .footer-link {
            float: right;
            margin: 5px 0 0 0;
        }

        #footer .footer-info .footer-link > a {
            display: inline-block;
            width: 130px;
            padding: 13px 0;
            margin: 0 30px;
            color: #262626;
            font-size: 18px;
            font-weight: 300;
            border: 1px solid #262626;
            border-radius: 30px;
            box-sizing: border-box;
            letter-spacing: -0.5px;
            text-align: center;
        }

        #footer .xans-layout-footer {
            width: auto;
            height: auto;
            float: left;
            text-align: left;
            margin-left: 105px;
            overflow: hidden;
        }

        #footer .xans-layout-footer .address {
            color: #1e1e1e;
            font-size: 16px;
            font-weight: 300;
            line-height: 1.6;
            padding: 10px 0 0;
            margin-left: -6px;
        }

        #footer .xans-layout-footer .address span {
            padding: 0 8px 0 10px;
            position: relative;
        }

        #footer .xans-layout-footer .address span:after {
            content: "";
            position: absolute;
            top: 7px;
            left: 1px;
            height: 13px;
            border-right: 1px solid #b7b7b7;
        }

        #footer .xans-layout-footer .address span a {
            color: #1e1e1e;
        }

        #footer .xans-layout-footer .copyright {
            position: relative;
            color: #8c8b8b;
            font-size: 16px;
            font-weight: 300;
            height: auto;
            line-height: 1.6;
            margin-left: 4px;
        }

        #footer .xans-layout-footer .copyright strong {
            font-weight: 400;
        }
    </style>
</head>
<body>
<hr>
<div class="container-fluid text-white-50 footer pt-5 mt-5">
    <div id="footer">
        <div class="inner">
            <div class="footer-info">
                <div>
                    <div class="xans-element- xans-layout xans-layout-logobottom footer-logo "><a href="/"></a>
                    </div>
                    <div class="xans-element- xans-layout xans-layout-footer ">
                        <p class="address">
                            <span>책먹는 악어</span><span>대표: 정성훈</span> <br/><span>주소: 서울특별시 금천구 디지털로9길 23 11층</span>	<span>고객센터: 02-1234-5678</span><br/><span>사업자 등록번호: 123-45-67890</span><span>통신판매신고번호: 제 2016-서울금천-1306호</span><span><a href="#none" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1198170643', 'bizCommPop', 'width=750, height=950;');return false;">[사업자정보확인]</a></span><span>신고기관명: 서울금천구청</span><br/><span>호스팅서비스 제공자: (주)천재교육</span> <span>전자우편: hong@gmail.com</span><br/></p>
                        <p class="copyright">Copyright © 2004 By CHUNJAETEXTBOOK Co.,Ltd All Rights Reserved.</p>
                    </div>


                </div>


                <div class="footer-link">
                    <a href="/shopinfo/cscenter.html">고객만족센터</a>
                    <!-- <a href="#none">SITEMAP</a> -->
                    <p style="margin-top:65px;">
                    </p>
                </div>




            </div>

            <div class="wrap-pop" id="popup-email" style="display: none;">
                <div class="pop-email">
                    <div class="area-pop">
                        <div class="tit-area">
                            <h3>이메일주소 무단수집거부</h3>
                            <button class="close" ng-click="$root.hideEmailConfirm()"><span class="blind">닫기</span></button>
                        </div>
                        <div class="cnt-area">
                            <p>본 사이트에서 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며, 이를 위반 시 정부통신망법에 의해 형사 처벌됨을 유념하여 주시기 바랍니다.</p>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
</body>
</html>
