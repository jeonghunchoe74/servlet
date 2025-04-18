<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길이 변환</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<%
		int length = Integer.valueOf(request.getParameter("length"));
		double inch = length / 2.54;
		double pit = length / 30.48;
		double yard = length / 91.44;
		double meter = (double)length / 100;
		
		String unitArr[] = request.getParameterValues("unit");
	%>
	
	<div class="container">
		<h1>길이 변환 결과</h1>
		<h3><%= length %>cm</h3>
		<hr>
		<h2>
			<%
				if (unitArr != null){
					for (String unit : unitArr){
						if (unit.equals("인치")){
							out.print(inch + " in<br>");
						} else if (unit.equals("야드")){
							out.print(yard + " yd<br>");
						} else if (unit.equals("피트")){
							out.print(pit + " ft<br>");
						} else
							out.print(meter + " m");
					}
				} else
					out.print("아무것도 체크되지 않았습니다.");
			%>
		</h2>
		
	</div>
</body>
</html>