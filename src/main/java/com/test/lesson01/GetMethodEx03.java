package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/lesson01/ex03")
public class GetMethodEx03 extends HttpServlet {
	
	// 노트북에서 주석 추가
	// 주석 한 번 더 추가
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		response.setContentType("text/plain");
		response.setContentType("text/json");
		response.setCharacterEncoding("utf-8");
		
		// request parameter
		String userId = request.getParameter("user_id");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		PrintWriter out = response.getWriter();
//		out.println("<h1>서블릿 화면</h1>");
//		out.println("user_id:" + userId);
//		out.println("name:" + name);
//		out.println("age:" + age);
		
		// JSON (Javascript Object Notation)으로 응답 body 구성
		// {"user_id": "lhhck123", "name":"최정훈", "age":26}
		out.print("{\"user_id\": \"" + userId + "\", \"name\":\"" 
				+ name + "\", \"age\":" + age + "}");
	}
}
