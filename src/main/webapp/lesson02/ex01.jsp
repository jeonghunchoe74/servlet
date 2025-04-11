<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제1</title>
</head>
<body>
	<!-- HTML 주석: 소스보기에서 보임 -->
	<%-- jsp 주석: 사라진다 --%>
	
	<% 
		// java 문법 시작
		// scriptlet(legacy)
		int sum = 0;
		for (int i = 1; i <= 10; i++){
			sum += i;
		}
	%>
	<b>합계:</b>  
	<input type="text" value="<%= sum %>">   <!-- expression 표현식 -->
	<hr>
	
	<%!
		// 선언문 - 클래스 정의 느낌
		// 필드, 메소드 정의
		
		// 필드
		int num = 100;
		
		// 메소드
		public String getHelloWorld() {
			return "Hello world";
		}
	%>
	
	<%= num + 30 %>
	<br>
	<%= getHelloWorld() %>
</body>
</html>