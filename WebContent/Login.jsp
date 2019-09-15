<%@page import="mirim.hs.kr.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- 뷰포트 -->
		<meta name="viewport" content="width=device-width" initial-scale="1">
		<!-- 스타일시트 참조  -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
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
				<li><a href="index.jsp">메인</a></li>
				<li><a href="AppList.jsp">앱 목록</a></li>
				<li><a href="ReviewList.jsp">리뷰 모아보기</a></li>
				<li><a href="EnterApp.jsp">앱 추천받기</a></li>
				<%
					if (userID == null) {
				%>
						<li class="active"><a href="Login.jsp">로그인</a></li>
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
	 <!-- 로긴폼 -->
	 <div class="container">
		  <div class="col-lg-4"></div>
			  <div class="col-lg-4">
			  <!-- 점보트론 -->
				   <div class="jumbotron" style="padding-top: 20px;">
				   <!-- 로그인 정보를 숨기면서 전송post -->
				   <form method="post" action="LoginResult.jsp">
					    <h3 style="text-align: center;"> 로그인화면 </h3>
					    <div class="form-group">
					     	<input type="text" class="form-control" placeholder="아이디" name="email" maxlength="20">
					    </div>    
					    <div class="form-group">
					     	<input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="20">
					    </div>
					    <input type="submit" class="btn btn-primary form-control" value="로그인">
				   </form>
			  </div>
		 </div>
	</div>
	
	 <!-- 애니매이션 담당 JQUERY -->
	 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
	 <!-- 부트스트랩 JS  -->
	 <script src="js/bootstrap.js"></script>
	</body>
</html>