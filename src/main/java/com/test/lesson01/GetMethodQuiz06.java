package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/lesson01/quiz06")
public class GetMethodQuiz06 extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/json");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		// request parameter
		int number1 = Integer.valueOf(request.getParameter("number1"));
		int number2 = Integer.valueOf(request.getParameter("number2"));
		
		/* {
	    "addition": 1570,
	    "subtraction": 1430,
	    "multiplication": 105000,
	    "division": 21 } */
		int addition = number1 + number2;
		int subtraction = number1 - number2;
		int multiplication = number1 * number2;
		int division = number1 / number2;
		out.print("{\"addition\": " + addition + ", \"subtraction\": " 
				+ subtraction + ", \"multiplication\": " + multiplication
				+ ", \"division\": " + division + "}");
		
	}
}
