<%@page import="mirim.hs.kr.App"%>
<%@page import="mirim.hs.kr.AppDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
<jsp:useBean id="apps" class="mirim.hs.kr.App" scope="request" />
<jsp:setProperty name="apps" property="title" />
<jsp:setProperty name="apps" property="email" /> 
<jsp:setProperty name="apps" property="cdate" /> 
<jsp:setProperty name="apps" property="category" /> 
<jsp:setProperty name="apps" property="content" /> 
<jsp:setProperty name="apps" property="device" /> 
	<%
/* 		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1; //기본 페이지 넘버		
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
 */
	%>
<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>

	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">JSP 게시판</a>
		</div>
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="AppList.jsp">앱 목록</a></li>
				<li><a href="ReviewList.jsp">리뷰 모아보기</a></li>
				<li><a href="EnterApp.jsp">앱 등록하기</a></li>
				<li><a href="MyInfo.jsp">마이 페이지</a></li>
			</ul>
			<%
				//라긴안된경우
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="Login.jsp">로그인</a></li>
						<li><a href="Join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"
				 role="button" aria-haspopup="true" aria-expanded="false">
					회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="Logout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<!-- 게시판 -->
	<div class="container">
		<div class ="row">
			<select class="form-control">
				<option></option>
				<option></option>
				
			</select>
		</div>
		<div class = "row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd"> 
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">NO</th>
						<th style="background-color: #eeeeee; text-align: center;">TITLE</th>
						<th style="background-color: #eeeeee; text-align: center;">EMAIL</th>
						<th style="background-color: #eeeeee; text-align: center;">CDATE</th>
						<th style="background-color: #eeeeee; text-align: center;">CATEGORY</th>
						<th style="background-color: #eeeeee; text-align: center;">CPMTEMT</th>
						<th style="background-color: #eeeeee; text-align: center;">DEVICE</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					
					<% 
					AppDAO appDAO = new AppDAO(); //인스턴스생성
						App app = appDAO.setAllList();
						out.println("<td>");
			            	out.println(apps.getNo());
			            out.println("</td>");
			           	out.println("<td>");
		            		out.println(apps.getTitle());
		           		out.println("</td>");
		           		out.println("<td>");
			            	out.println(apps.getEmail());
			            out.println("</td>");
			           	out.println("<td>");
		            		out.println(apps.getCdate());
		           		out.println("</td>");	
			           	out.println("<td>");
		            		out.println(apps.getCategory());
			           	out.println("</td>");
			           	out.println("<td>");
	            			out.println(apps.getDevice());
           			out.println("</td>");
						%>
					</tr>
				</tbody>
			</table>	
		</div>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
</body>
</html>