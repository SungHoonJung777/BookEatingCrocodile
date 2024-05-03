# 📍프로젝트 명

<p align="center">
  <br>
   <img src="/src/main/webapp/resources/img/BEClogo.png" >
  <br>
</p>

### 책먹는 악어

<br>

## 💻프로젝트 소개

### 프로젝트 개요
<p>유아 · 초등 · 중등 · 고등 학생들을 대상으로 한 교육 도서 판매 사이트</p>

### 프로젝트 기간
<p>2024년 04월 24일 ~ 2024년 05월 03일</p>
<br>

## ⚙기술 스택 및 개발 환경

### 기술 스택
<div>
   <img src="https://img.shields.io/badge/-Spring-6DB33F?style=flat&logo=spring&logoColor=white"/>
   <img src="https://img.shields.io/badge/-JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white"/>
   <img src="https://img.shields.io/badge/-HTML-E34F26?style=flat&logo=HTML5&logoColor=white"/>
   <img src="https://img.shields.io/badge/-CSS-1572B6?style=flat&logo=CSS3&logoColor=white"/>
</div>

### 개발 환경
<div>
  <img src="https://img.shields.io/badge/-IntelliJ IDEA-000000?style=flat&logo=intellijidea&logoColor=white"/>
   <img src="https://img.shields.io/badge/-MariaDB-003545?style=flat&logo=mariadb&logoColor=white"/>
   <img src="https://img.shields.io/badge/-Apache Tomcat-F8DC75?style=flat&logo=apachetomcat&logoColor=white"/>
</div>


<br>

## 🧑‍💻역할 분담

### 정성훈(팀장)
* 회원 기능 구현
  * 이메일 인증 후 회원 가입
  * 로그인 및 로그아웃
  * 비밀번호 찾기
  * validation 체크
* 로그인 filter 기능 구현
  * 회원만 이용 가능한 게시판 등록
* 관리자 페이지 기능 구현
  * 회원 리스트 조회 기능
  * 회원 관리 기능
    * 회원 수정 및 삭제
  * 도서 상품 관리 기능
    * 도서 상품 조회 및 수정, 삭제
  * 배송 관리 기능
    * 결제 완료 된 배송 상품 조회
    * 배송 상태 수정 기능
* 도서 추천 이벤트 기능 구현
  * 테스트 진행 후 도서 추천
  

### 박상렬(팀원)
* 로고 제작
* Header, Footer 공통기능 구현
* 장바구니 기능 구현
  * 장바구니 상품 리스트 정보 가져오기
* 상품 결제 기능 구현
  * 장바구니에서 선택한 상품 정보 가져오기
  * 배송 정보 validation 체크
  * 결제 완료 시 장바구니에서 선택한 상품 삭제 및 구매 도서에 대한 재고량 감소
* 상품 상세페이지 기능 구현
  * 상품 장바구니 담기 - 장바구니에 해당 상품이 있는 경우 update 없는 경우 insert  
* 주문 내역 기능 구현
  * 주문 정보 리스트 가져오기
  * 주문 상세 내역 modal창으로 구현
  * 상세 정보 가져오는 부분 AJAX 처리

### 류림(팀원)
* 공지사항 기능 구현
  * 조회, 작성, 수정, 삭제, 검색
* QnA 기능 구현
  * 조회, 작성, 수정, 삭제, 답변하기, 검색
* FAQ 기능 구현
  * 조회, 작성, 수정, 삭제, 검색
* 관리자 페이지 기능 구현
  *  QnA, FaQ, 공지사항, 자료실 게시글 관리
  *  각 게시판 별로 글 조회, 수정, 삭제 검색, 등록 가능
* 마이페이지
  * 회원 정보 수정 및 프로필 이미지 수정
  * 자신의 게시글 조회, 리뷰 조회
  * 1:1 게시판 글 조회, 작성, 수정, 삭제
* 회사 소개 페이지 구현

### 장인우(팀원)
* 메인 페이지 기능 구현
  * 최신 도서 추천 리스트
  * 인기 도서 추천 리스트
* 도서 메인 페이지 기능 구현
  * 도서 검색 기능
  * 도서 최신순, 오래된순, 가격 높은순, 낮은순 정렬
  * 유아, 초등, 중등, 고등 별로 카테고리 구분
* 도서 상세 페이지 기능 구현
  * 도서 상품 상세 내용
  * 리뷰 작성 및 조회
  
<br>

## 📎구현 기능

### 회원기능
1. 회원가입
    * 이메일 인증 후 회원가입 가능
    * 아이디 중복 확인 기능
      - 유효성 검사 체크
       
2. 로그인
    * 사용자가 입력한 아이디, 비밀번호와 같은 데이터가 DB에 존재하면 로그인 성공 처리
     
3. 비밀번호 찾기 기능
    * 아이디 , 이메일, 휴대폰 번호 체크 후 이메일로 임시 비밀번호 발급
     
### 마이페이지
1. 회원 정보 조회 및 수정
    * 회원 정보 조회 및 수정
    * 회원 탈퇴
       
2. 주문 내역 조회
    * 회원이 주문한 주문 내역 리스트 조회
    
3. 장바구니 기능 구현
    * 장바구니 상품 리스트 정보 가져오기
    * 상품 +, - 버튼 클릭 시 해당 상품의 장바구니 수량 증감 AJAX 처리
    * 상품 삭제 AJAX 처리
    * 상품 전체 선택 및 해제
    * 선택한 상품에 따라 결제 금액 변경 JS 처리
    
4. 1:1 문의글 기능 구현
    * 관리자와 1:1 문의 기능
    * 글 조회, 작성, 수정, 삭제 기능
    * 답변 완료 시 수정 및 삭제 불가
    
5. 상품 문의글 기능 구현
    * 글 조회, 작성, 수정, 삭제 기능
    * 답변 완료 시 수정 및 삭제 불가
    
6. 리뷰 조회 기능 구현
    * 본인이 작성한 리뷰 리스트 조회
    
### 도서 상품 리스트
1. 카테고리 기능 구현
    * 대분류 : 유아, 초등, 중등, 고등
    * 중분류 : 1학년, 2학년, 3학년, 4학년, 5학년, 6학년
    * 소분류 : 한글, 국어, 영어, 수학, 사회, 과학
2. 도서 검색 기능 구현
    * 책 제목, 내용으로 검색
3. 도서 최신순, 오래된순, 가격 높은순, 가격 낮은순으로 조회
4. 도서 상세 페이지 기능 구현
    * 도서 상세 내용 출력
    * 리뷰 조회 및 작성, 리뷰 작성한 회원 및 관리자만 삭제 가능
    * 리뷰 별점 매기기
    * 도서 관련 동영상 출력
    
### 관리자페이지
1. 메인 페이지
    * 총 회원 수, 상품 수, 총 판매 금액, 미확인 문의 건 조회
2. 회원 관리
    * 회원 리스트 조회 및 수정, 삭제 기능
3. 상품 관리
    * 상품 리스트 조회 및 수정, 삭제 기능
    * 상품 등록 기능, 도서 이미지 등록
4. 배송 관리
    * 배송 주문 리스트 조회
    * 회원이 결제 완료 시 배송기사 선택 가능
    * 배송기사는 배정된 배송 상품 확인 후 배송 상태 변경 가능
  
### 게시판
1. 공지사항 게시판 구현
    * 관리자만 작성 가능한 공지사항 게시판
    * 조회, 작성, 수정, 삭제, 검색
2. QnA 게시판 구현
    * 회원 질문 게시판
    * 조회, 작성, 수정, 삭제, 답변하기, 검색
    * 회원의 질문에 관리자가 답변 완료 수정 불가
3. FAQ 게시판 구현
    * 자주 묻는 질문 게시판
    * 조회, 작성, 수정, 삭제, 검색
4. 자료실 게시판 구현
    * 회원 전용 게시판, 비회원 이용 불가
    * 조회, 작성, 수정, 삭제, 검색
    * 파일(이미지, 동영상, pdf 등) 업로드 기능

### 도서 추천 기능
1. 메인 페이지에서 도서 추천 이벤트 기능 구현
    * Depth 별로 질문을 통해 추천 도서 출력 
<br>

## ERD

## 발표 순서

## 배운 점 & 아쉬운 점

<p align="justify">

</p>

<br>


