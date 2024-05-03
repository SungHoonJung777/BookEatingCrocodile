
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <meta charset="utf-8">
    <title>상품 페이지</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/resources/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/resources/css/style.css" rel="stylesheet">

    <!-- sidebars css -->
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <link href="/resources/resources/css/product.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;

        }

        body {
            background: url("/resources/resources/img/choice/main3.jpg");
            background-size: cover;
            height: 600px;

        }

        #main{
            background-color: white;
            width: 80%;
            text-align: center;
            border-radius: 20px;
            height: 800px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.75);
            margin-top: 200px;
            margin-left: 140px;

        }

        #main img {
            width: 20%;
            margin-top: 230px;
            margin-bottom: 10px;
            height: auto;

        }
        #qna{
            display: none;
            background-color: white;
            width: 80%;
            text-align: center;
            border-radius: 20px;
            height:810px;
            margin-left: 140px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.75);
            margin-top: 200px;
        }
        .qBox{
            background-color: #008000;
            text-align: center;
            border-radius: 20px;
            font-size: 26px;
            width: 80%;
            color: whitesmoke;
        }
        .answerList{
            background-color: whitesmoke;
            border-radius: 20px;
            display: block;
            width: 70%;
            border: 0px;
            font-size: 20px;
        }
        .answerList:hover, .answerList:focus {
            background-color: #008000;
            color: whitesmoke;
        }
        .status{
            height: 20px;
            width: 80%;
            background-color: white;
            border-radius: 20px;
        }
        #result{
            display: none;
            background-color: whitesmoke;
            width: 80%;
            text-align: center;
            border-radius: 20px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.75);

            margin-top: 200px;

        }
        #result > h1 {
            margin-top: 200px;
        }
        .resultDesc{
            font-size: 20px;
        }

        .resultname{
            font-size: 20px;
        }

    </style>
</head>
<body>

<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>
<form name="frm" id="frm">
    <div class="container">
        <section id="main">
            <div class="col-lg-6 col-md-8 col-sm-10 col-12 mx-auto" >
                <img src="/resources/resources/img/choice/logo.png" alt="mainImage" class="img-fluid">
                <h3>책 먹는 악어가 책을 추천해드립니다.</h3><br>
                자신과 최대한 비슷한 항목을 체크해주세요.<br>
                자신과 최대한 비슷한 항목을 체크해주세요.<br>
                자신과 최대한 비슷한 항목을 체크해주세요.<br>
                자신과 최대한 비슷한 항목을 체크해주세요.<br>
            </div>


            <button type="button" class="btn btn-success mt-3" onclick="js:begin()">시작하기</button>
        </section>
        <section id="qna" style="display: none;">
            <div class="status mx-auto mt-5">
                <div class="statusBar">

                </div>
            </div>
            <div class="qBox my-5 py-3 mx-auto">

            </div>
            <div class="answerBox">

            </div>
        </section>
        <section id="result" class="mx-auto my-5 py-5 px-3" style="display: none;">
            <h1>제가 추천해드리는 책은...</h1>
            <div class="resultname"></div>
     <%--       <div id="spinner1" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center spinner1"
            style="display:none;">
                <div class="spinner-grow text-primary" role="status"></div>
            </div>--%>
            <div id="resultImg" class="my-3 col-lg-6 col-md-8 col-sm-10 col-12 mx-auto" >
                <img id="img" class="img" src="" style="width: 70%; height: auto;"/>
            </div>
            <div class="resultDesc">

            </div>


            <button type="button" class="btn btn-success mt-3" id="mainBtn">메인으로</button>
            <button type="button" class="btn btn-success mt-3" id="cartBtn">장바구니 담기</button>
        </section>
    </div>
</form>
    <script charset="utf-8">
        let qnaList = [
            {
                q: '🐊 수학 문제를 보면 눈물이 나고 잠을 자고 싶다.',
                a:[
                    { answer: '매우 그렇다', type: [1]},
                    { answer: '그렇다',type: [2]},
                    { answer: '보통이다', type: [3]},
                    { answer: '그렇지 않다', type: [4]},
                    { answer: '메우 그렇지 않다', type: [5]}
                ]
            } ,
            {
                q: '🐊 수학 문제에 대한 개념이 부족한거 같다.',
                a:[
                    { answer: '매우 그렇다', type: [1]},
                    { answer: '그렇다',type: [2]},
                    { answer: '보통이다', type: [3]},
                    { answer: '그렇지 않다', type: [4]},
                    { answer: '메우 그렇지 않다', type: [5]}
                ]
            } ,
            {
                q: '🐊 수학의 개념은 알지만 응용이 어렵다',
                a:[
                    { answer: '매우 그렇다', type: [1]},
                    { answer: '그렇다',type: [2]},
                    { answer: '보통이다', type: [3]},
                    { answer: '그렇지 않다', type: [4]},
                    { answer: '메우 그렇지 않다', type: [5]}
                ]
            } ,
            {
                q: '🐊 나는 수학 올림피아드를 준비하고 있다.',
                a:[
                    { answer: '매우 그렇다', type: [1]},
                    { answer: '그렇다',type: [2]},
                    { answer: '보통이다', type: [3]},
                    { answer: '그렇지 않다', type: [4]},
                    { answer: '메우 그렇지 않다', type: [5]}
                ]
            } ,
            {
                q: '🐊 수학문제를 보면 시시해서 죽고싶어진다.',
                a:[
                    { answer: '매우 그렇다', type: [1]},
                    { answer: '그렇다',type: [2]},
                    { answer: '보통이다', type: [3]},
                    { answer: '그렇지 않다', type: [4]},
                    { answer: '메우 그렇지 않다', type: [5]}
                ]
            } ,


        ];
        let resultLists = [
            "기초가 매우 부족합니다. 수학의 개념을 다시 정립하세요. 이 책을 추천드립니다.", "기출문제를 많이 풀어보셔야 합니다. 이 책을 추천드립니다." , "최신유형과 응용문제를 많이 풀어보세요. 이 책을 추천드립니다." ,"수학과 조금 더 가까워져야 할거 같아요. 이 책을 추천드립니다."
            ,"필수 유형을 반드시 확인하셔야 합니다. 이 책을 추천드립니다." ,"악악악악 필수 유횽을 반드시 확인하셔야 합니다. 이 책을 추천드립니다."
        ]

        let main = document.querySelector("#main");
        let qna = document.querySelector("#qna");
        let result = document.querySelector("#result");

        let endIdx =5;
        let select =  [0,0];


        function begin(){
            main.style.WebkitAnimation = "fadeOut 1s";
            main.style.animation = "fadeOut 1s";

            setTimeout( function (){
                qna.style.WebkitAnimation = "fadeIn 1s";
                qna.style.animation = "fadeIn 1s";
                setTimeout( function (){
                    main.style.display = 'none';
                    qna.style.display = 'block';
                },450)
                let qIdx = 0;
                next(qIdx);
            } , 450);
        }

        function next(qIdx) {

            if(qIdx === endIdx) {
                resultSet();
                return;
            }
            let box = document.querySelector('.qBox');
            box.innerHTML = qnaList[qIdx].q;
            for(let i in qnaList[qIdx].a){
                addButton(qnaList[qIdx].a[i].answer, qIdx, i);
            }


        }

        function addButton(answerText , qIdx , idx){
            let a = document.querySelector('.answerBox');
            let answer  = document.createElement('button');

            answer.classList.add('answerList');
            answer.classList.add('my-3');
            answer.classList.add('py-3');
            answer.classList.add('mx-auto');
            answer.classList.add('fadeIn');
            a.appendChild(answer);

            answer.innerHTML = answerText;
            answer.addEventListener('click', function (){
                let goNext = document.querySelectorAll('.answerList');
                goNext.forEach( (e) => {
                    e.disabled = true;
                    e.style.WebkitAnimation = 'fadeOut 0.6s';
                    e.style.animation = "fadeOut 0.5s";
                    e.style.display = 'none';
                })
                setTimeout(() => {

                    let target = qnaList[qIdx].a[idx].type;
                    console.log(target+"SDFSDFSDFSDF");
                    select[qIdx] = target;

                    qIdx++;
                    next(qIdx);
                },450)

            });

        };

        function resultSet(){
            qna.style.WebkitAnimation = "fadeOut 1s";
            result.style.animation = "fadeOut 1s";
            let sum  = 0;
            select.forEach( (element) =>{
                sum += Number(element);
            });

            let avg =  Math.floor(sum/ select.length);

            setTimeout( function (){
                result.style.WebkitAnimation = "fadeIn 1s";
                result.style.animation = "fadeIn 1s";
                setTimeout( function (){
                    qna.style.display = 'none';
                    result.style.display = 'block';
                },450)

            } , 450);

            let img = document.querySelector("#img");
            let imgUrl = avg;
            img.setAttribute("src" , "/resources/resources/img/choice/"+avg+".jpg");
            let dec = document.querySelector(".resultDesc");
            let text = document.createTextNode(resultLists[avg]);
            dec.appendChild(text);
        }

        let spinner1 = function () {
            setTimeout(function () {
                if ($('#spinner1').length > 0) {
                    $('#spinner1').removeClass('show');
                }
            }, 1);
        };

        // 페이지 로딩 시작 시 스피너 보여주기
       // document.getElementById('spinner1').style.display = 'flex';

        // 페이지 로딩 완료 시 스피너 숨기기
 /*       window.onload = function() {
            document.getElementById('spinner1').style.display = 'none';
        };
*/
        document.querySelector("#mainBtn").addEventListener("click", function (){
            let frm  = document.querySelector("#frm");
            frm.action = "/";
            frm.submit();
        });
    </script>
    <script src="" charset="utf-8">

    </script>
    <!-- JavaScript Libraries -->


</body>
</html>
