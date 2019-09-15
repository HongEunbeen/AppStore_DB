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
			<a class="navbar-brand" href="index.jsp">APP STORE</a>
		</div>
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a></li>
				<li><a href="AppList.jsp">앱 목록</a></li>
				<li class="active"><a href="ReviewList.jsp">리뷰 모아보기</a></li>
				<li><a href="EnterApp.jsp">앱 추천받기</a></li>
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
<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="앱 이름" name="title" maxlength="20"/></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="등록자" name="email" maxlength="30"/></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="등록일" name="cdate" maxlength="20"/></td>
						</tr>
						<tr>
							<td>
							<select class="form-control"name="device">
								<option value="android">안드로이드</option>
								<option value="ios">IOS</option>
							</select>
							</td>
						</tr>
						<tr>
							<td>
							<select class="form-control"name="category">
								<%
									
								%>
							</select>
							</td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="앱 설명" name="content" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
						
					</tbody>
				</table>	
				<input type="submit" class="btn btn-primary pull-right" value="앱 등록하기" />
			</form>
		</div>
	</div>



	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
</body>
</html>