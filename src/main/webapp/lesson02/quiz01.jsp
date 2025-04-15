<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz01</title>
</head>
<body>
	<!-- 1.  -->
	<%!
		public int sum(int n) { // input -> process -> output
		int sum = 0;
		for (int i = 1; i <= n; i++){
			sum += i;
		}
		return sum;
	}
	%>
	
	<b>1부터 50까지의 합은 <%= sum(50) %>입니다.</b><br><br>
	
	<!-- 2. 점수들의 평균 구하기 -->
	<%
		int[] scores = {81, 90, 100, 95, 80};
		
		int sum = 0;
		for (int i = 0; i < scores.length; i++){
			sum += scores[i];
		}
		double avg = (double)sum / scores.length;
	%>
	 <b> 평균 점수는 <%= avg %>입니다.</b> <br><br>

	<!--  3. 채점 결과 -->

	<%
	 	// 3
	 	List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
		
		Iterator<String> iter = scoreList.iterator();
		int score = 0;
		while(iter.hasNext()){
			String check = iter.next();
			if (check.equals("O")){
				score += (100 / scoreList.size());
			}
		}
	%>	
	<b>채점 결과는 <%= score %>입니다.</b> <br><br>
	
	<!-- 4. 나이 구하기 -->
	<%
		String birthDay = "20010820";
	
		String year = birthDay.substring(0, 4);
		int age = 2025 - Integer.valueOf(year) + 1;
		// out.println(year);
	%>
	
	<b><%= birthDay %>의 나이는 <%= age %>세입니다.</b>
</body>
</html>