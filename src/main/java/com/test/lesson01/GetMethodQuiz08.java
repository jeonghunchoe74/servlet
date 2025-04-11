package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/lesson01/quiz08")
public class GetMethodQuiz08 extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
			
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		// request parameter
		String keyword = request.getParameter("keyword");
		
		List<String> list = new ArrayList<>(Arrays.asList(
		        "강남역 최고 맛집 소개 합니다.", 
		        "오늘 기분 좋은 일이 있었네요.", 
		        "역시 맛집 데이트가 제일 좋네요.", 
		        "집에 가는 길에 동네 맛집 가서 안주 사갑니다.",
		        "자축 저 오늘 생일 이에요."));
		
		out.print("<html><head><title>검색 결과</title></head><body>");
		
		Iterator<String> iter = list.iterator();
		while(iter.hasNext()) {
			String line = iter.next();
			
			if (line.contains(keyword)) {
				// out.print(line + "<br>");
				
				// 풀이 1) indexOf
				//line.indexOf(keyword);  keyword.length();
//				out.print(line.substring(0, line.indexOf(keyword)));
//				out.print("<b>" + line.substring(line.indexOf(keyword), 
//						line.indexOf(keyword) + keyword.length()) + "</b>");
//				out.print(line.substring(line.indexOf(keyword) + keyword.length()) + "<br>");
				
				// 풀이 2) split
//				String [] text = line.split(keyword);
//				out.print(text[0] + "<b>" + keyword + "</b>" + text[1] + "<br>");
				
				// 풀이 3) 맛집 -> <b>맛집</b> replace method 이용
				out.print(line.replace(keyword, "<b>" + keyword + "</b>") + "<br>");
				
			}
			
		}
		
		out.print("</body></html>");
	}
}
