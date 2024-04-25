어노테이션
1. 스프링에서 가장 많이 사용
2. 특정 경로의 요청 (request) 을 하기 위해 사용
3. 컨트롤러 클래스 선언부에 사용 또는 메서드에 사용
	- 클래스 선언부에 사용 시 경로가 이어지고 이어짐

4. 서블릿 중심 MVC 서비스에서는 Servlet을 상속받아서 -> doGet, doPost 오버라이드 해서 사용
5. 스프링 MVC 에서는 하나의 컨트롤러에 여러개의 메서드(경로)를 호출해서 모두 처리 가능 (컨트롤러 갯수 줄어듦)
6. method 속성
	- GET/POST 처리 방식
	- @RequsetMapping(value="경로") -> GET/POST 둘 다 응답
	- @RequestMapping(value="경로", method=Reqeust.GET)
	- @RequestMapping(value="경로", method=Reqeust.POST)
	- @RequestMapping(value="경로", method={Reqeust.GET, Requset.POST})
	- @GetMapping("경로") -> GET
	- @PostMapping("경로") -> POST --> 스프링4 이후에 추가된 것


===========================================================================


1. 컨트롤러 선언부에 사용하는 어노테이션
	- @Controller
	- @RestController --> 헤더값이 text.html에서 text.jsonObject로 바뀜
	- @RequestMapping
2. 컨트롤러 내부의 메서드 선언부에 사용하는 어노테이션
	- @RequestMapping
	- @GetMapping, @PostMapping
	- @ResponseBody (@RestController랑 엮임)
3. 메서드의 파라미터에 사용하는 어노테이션
	- @RequestParam : Request에 있는 파라미터 받아서 처리하려고 사용
	- @PathVariable : URL 경로의 일부분을 변수로 처리하려고 사용
	- @ModelAttribute : 해당 파라미터는 반드시 Model에 포함되어서 View로 전달됨을 명시해줘야 함
		주로 기본자료형, Wrapper 클래스(Integer 요런거 -> 기본자료형인데 대문자로 시작하는거)
		문자열에 주로 사용
4. 기타
	- @ SessionAttribute
	- @ Valid
	- @ RequestBody
	- Rest 방식에서 문자열이나, JSON 데이터 그대로 전송할 때 사용
