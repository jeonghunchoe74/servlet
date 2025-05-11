<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멜롱-아이유</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<style>
a {text-decoration:none;}
a:hover {text-decoration:none;}

#wrap {width:1200px; margin:auto;}

header {height:100px;}
header .logo {width:150px;}
header .search {width:1050px;}
header .search .search-bar {width:450px;}

nav {height:40px;}

footer {height:200px;}
</style>
</head>
<body>
<%
// 아티스트 정보 

    Map<String, Object> artistInfo = new HashMap<>();
    artistInfo.put("name", "아이유");
    artistInfo.put("debute", 2008);
    artistInfo.put("agency", "EDAM엔터테인먼트");
    artistInfo.put("photo", "data:image/jpeg;base64,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");


// 아이유 노래 리스트 
    List<Map<String, Object>> musicList = new ArrayList<>();

    Map<String, Object> musicInfo = new HashMap<>();
    musicInfo.put("id", 1);
    musicInfo.put("title", "팔레트");
    musicInfo.put("album", "Palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 2);
    musicInfo.put("title", "좋은날");
    musicInfo.put("album", "Real");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/3/3c/IU_-_Real.jpg");
    musicInfo.put("time", 233);
    musicInfo.put("composer", "이민수");
    musicInfo.put("lyricist", "김이나");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 3);
    musicInfo.put("title", "밤편지");
    musicInfo.put("album", "palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
    musicInfo.put("time", 253);
    musicInfo.put("composer", "제휘,김희원");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 4);
    musicInfo.put("title", "삐삐");
    musicInfo.put("album", "삐삐");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://ww.namu.la/s/5ea8ba97baf8af3cc13f2972d9d23bcd17e19b8b8a96ce86d50c4bd03ad4df30321fc7e012738ad4b00c50642195ef7a68ff484ad760b15ff46bb1dc45ffb3fc399e4345c5d4dd2240820b59f3a573a57f84b8a6a2e4fb26ce5e81ad66d85f77debc979900275f6cf7a51386c8c39aa9");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "이종훈");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 5);
    musicInfo.put("title", "스물셋");
    musicInfo.put("album", "CHAT-SHIRE");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://w.namu.la/s/4a817b8f4ec9caca4027a6991651a401d683a7691f1926bd60e59908f306d439f7cc251af5ef263a6f0a249e831d5d9cf641855bf590dadd86869ff941aad8dc236bc91bac89f84cff60c981d8d6c85f57a2ff4df00b5efe3bbc10e9745ce13571eda48f1912435423317450475d6ffe");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 6);
    musicInfo.put("title", "Blueming");
    musicInfo.put("album", "Love poem");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/6/65/%EC%95%84%EC%9D%B4%EC%9C%A0_-_Love_poem.jpg");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);
%>    
	<div id="wrap">
		<header class="d-flex align-items-center">
			<%-- 로고 영역 --%>
			<div class="col-2">
				<h3><a href="list_template.jsp" class="text-success">Melong</a></h3>
			</div>
			
			<%-- 검색 영역 --%>
			<div class="col-10">
				<form method="get" action="/lesson02/quiz10.jsp">
					<div class="input-group">
						<input type="text" class="form-control col-6" name="search">
						<div class="input-group-append">
							<input type="submit" class="btn btn-info" value="검색">
						</div>
					</div>
				</form>
			</div>
		</header>

		<nav>
			<ul class="nav">
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">멜롱차트</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">최신음악</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">장르음악</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">멜롱DJ</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">뮤직어워드</a></li>
			</ul>
		</nav>
		
		<section class="contents">
			<%-- 아티스트 정보 영역 --%>
			<div class="singer-info d-flex mt-4 border border-success p-3">
				<div class="singer-photo mr-4">
					<img src="<%=artistInfo.get("photo") %>" alt="가수 이미지" width="150">
				</div>
				<div class="singer-info">
					<h3><%=artistInfo.get("name") %></h3>
					<div><%=artistInfo.get("agency") %></div>
					<div><%=artistInfo.get("debute") %></div>
				</div>
			</div>
			
			<%-- 곡 목록 영역 --%>
			<div class="music-list mt-3">
				<h4>곡 목록</h4>
				<table class="table text-center">
					<thead>
						<tr>
							<th>no</th>
							<th>제목</th>
							<th>앨범</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Map<String, Object> info : musicList) {
						%>
						<tr>
							<td><%=info.get("id") %></td>
							<td><a href="/lesson02/quiz10.jsp?id=<%=info.get("id") %>"><%=info.get("title") %></a></td>
							<td><%=info.get("album") %></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</section>
				
		<hr>
		<footer>
			<small class="text-secondary">Copyright 2024. melong All Rights Reserved.</small>
		</footer>
	</div>
</body>
</html>