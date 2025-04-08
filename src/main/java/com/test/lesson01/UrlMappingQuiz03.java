package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlMappingQuiz03 extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// response header
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/M/d HH:mm:ss");
		
		out.print("<html><head><title>마론달 뉴스</title></head><body>");
		out.print("<h1>[단독] 고양이가 야옹해</h1>");
		out.print("<p>기사 입력 시간: " + sdf.format(now) + "</p>");
		out.print("<hr>");
		out.print("<p>끝</p>");
		out.print("</body></html>");
		
		
		
	}
}
