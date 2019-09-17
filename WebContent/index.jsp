<%@page import="mirim.hs.kr.Count"%>
<%@page import="mirim.hs.kr.CountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<%
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
			<a class="navbar-brand" href="index.jsp">APP STORE</a>
		</div>
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">메인</a></li>
				<li><a href="AppList.jsp">앱 목록</a></li>
				<li><a href="SearchApp.jsp">앱 검색하기</a></li>
				<li><a href="RecommApp.jsp">앱 추천받기</a></li>
				<%
					if (userID == null) {
				%>
						<li><a href="Login.jsp">로그인</a></li>
						<li><a href="Join.jsp">회원가입</a></li>
				<%
					} else {
				%>
					<li><a href="MyInfo.jsp">마이 페이지</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class = "row">
			<div class="jumbotron">
		    <h1>App Store</h1>
		    <p>앱을 다운받을 수 있는 페이지 입니다.</p>
		  </div>
		</div>
		<div class="row">
		<%
			CountDAO countDAO = new CountDAO();
			Count count_register = countDAO.getCount("REGISTER");
			Count count_app = countDAO.getCount("APP");
			Count count_review = countDAO.getCount("REVIEW");
		%>
		  	<div class="col-sm-4">
		     	<div class="panel panel-primary">
      				<div class="panel-heading">총 회원 수</div>
      				<div class="panel-body"><%=count_register.getCnt() %></div>
    			</div>
		   	</div>
			<div class="col-sm-4">
			     <div class="panel panel-primary">
      				<div class="panel-heading">총 등록된 APP 수</div>
      				<div class="panel-body"><%=count_app.getCnt() %></div>
    			</div>
			</div>
			<div class="col-sm-4">
		  		<div class="panel panel-primary">
      				<div class="panel-heading">총 작성된 REVIEW 수</div>
      				<div class="panel-body"><%=count_review.getCnt() %></div>
    			</div>
	    	</div>
		</div>
	</div>

	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
</body>
</html>