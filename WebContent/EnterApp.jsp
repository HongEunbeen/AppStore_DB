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
<link rel="stylesheet" href="css/bootstrap.css.star.css">
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
				<li ><a href="AppList.jsp">앱 목록</a></li>
				<li><a href="RecomApp.jsp">리뷰 모아보기</a></li>
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
			<form method="post" action="EnterAppResult.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">앱 등록하기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="앱 제목" name="title" maxlength="100"/></td>
						</tr>
						<tr>
							<td>
								<label class="radio-inline"><input type="radio" name="category" value="여행">여행</label>
								<label class="radio-inline"><input type="radio" name="category" value="자동차/교통">자동차/교통</label>
								<label class="radio-inline"><input type="radio" name="category" value="커뮤니케이션">커뮤니케이션</label>
								<label class="radio-inline"><input type="radio" name="category" value="홈/인테리어">홈/인테리어</label>
								<label class="radio-inline"><input type="radio" name="category" value="교육/라이브러리">교육/라이브러리</label>
								<label class="radio-inline"><input type="radio" name="category" value="엔터테이먼트">엔터테이먼트</label>
								<label class="radio-inline"><input type="radio" name="category" value="금융">금융</label>
								<label class="radio-inline"><input type="radio" name="category" value="건강/운동">건강/운동</label>
								<label class="radio-inline"><input type="radio" name="category" value="지도/내비게이션">지도/내비게이션</label>
								<label class="radio-inline"><input type="radio" name="category" value="사진">사진</label>
								<label class="radio-inline"><input type="radio" name="category" value="생산성">생산성</label>
								<label class="radio-inline"><input type="radio" name="category" value="쇼핑">쇼핑</label>
								<label class="radio-inline"><input type="radio" name="category" value="스포츠">스포츠</label>
								<label class="radio-inline"><input type="radio" name="category" value="날씨">날씨</label>
								<label class="radio-inline"><input type="radio" name="category" value="스포츠">여행스포츠</label>
								<label class="radio-inline"><input type="radio" name="category" value="라이프스타일">라이프스타일</label>
								<label class="radio-inline"><input type="radio" name="category" value="음악 및 오디오">음악 및 오디오</label>
								<label class="radio-inline"><input type="radio" name="category" value="게임">게임</label>
							</td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="앱 소개(링크)" name="content" maxlength="200"></textarea></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="아이콘" name="icon" maxlength="150"/></td>
						</tr>
						<tr>
							<td>
								<label class="radio-inline"><input type="radio" name="device" value="android">ANDROID</label>
								<label class="radio-inline"><input type="radio" name="device" value="apple">APPLE</label>
							</td>
						</tr>		
					</tbody>
				</table>	
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" />
			</form>
		</div>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
	<script src="js/star.js"></script>
</body>
</html>