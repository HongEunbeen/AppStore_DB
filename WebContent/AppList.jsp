<%@page import="mirim.hs.kr.User"%>
<%@page import="java.util.ArrayList"%>
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
	<%
 		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		String sortString = "NONE";
		
		int pageNumber = 1;
		String listSort = "ANO";
		
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		if (request.getParameter("listSort") != null) {
			listSort = request.getParameter("listSort");
		}

		AppDAO appDAO = new AppDAO();
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
				<li class="active"><a href="AppList.jsp">앱 목록</a></li>
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
			
		
            <div class="row">
            	<div class="col-md-4 pull-right">
                 	<div class="input-group pull-right">
                 		<div class="btn-group">
                     		<a id="headerUserButton" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" href="AppList.jsp?pageNumber=<%=pageNumber%>">
                         		<%=sortString %> <span class="caret"></span>
                         	</a>
		                     <ul class="dropdown-menu">
		                     	 <li><a href= "AppList.jsp?pageNumber=<%=pageNumber%>&listSort=<%="ANO" %>"><%sortString = "NONE"; %>NONE</a></li>
		                         <li><a href= "AppList.jsp?pageNumber=<%=pageNumber%>&listSort=<%="CDATE" %>"><%sortString = "최근 등록 순"; %>최근 등록 순</a></li>
		                         <li><a href= "AppList.jsp?pageNumber=<%=pageNumber%>&listSort=<%="RANK" %>"><%sortString = "좋아요 순"; %>좋아요 순</a></li>
		                         <li><a href= "AppList.jsp?pageNumber=<%=pageNumber%>&listSort=<%="TITLE" %>"><%sortString = "앱 이름 순"; %>앱 이름 순</a></li>
		                     </ul>
                 		</div><!--- /.btn-group --->
                 	</div>
                 </div>
             </div>
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeeee; text-align: center;">앱 이름</th>
							<th style="background-color: #eeeeee; text-align: center;">개발자</th>
							<th style="background-color: #eeeeee; text-align: center;">회사명</th>
							<th style="background-color: #eeeeee; text-align: center;">범주</th>
							<th style="background-color: #eeeeee; text-align: center;">별점</th>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<App> list = appDAO.getAllList(pageNumber, listSort);
							String userCom = appDAO.getCompany(userID);
							for (int i = 0; i < list.size(); i++) {
						%>
							<tr>
								<td><%=(i+1)%></td>
								<td><a href="AppInfo.jsp?ANO=<%=list.get(i).getNo()%>"><%=list.get(i).getTitle()%></a></td>
								<td><%=list.get(i).getEmail()%></td>
								<td><%=list.get(i).getCompany()%></td>
								<td><%=list.get(i).getCategory()%></td>
								<td><%if(appDAO.getStar(list.get(i).getNo()) == -1){%>0<%}else{%><%=appDAO.getStar(list.get(i).getNo()) %><%} %></td>
							</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<!-- 페이지 넘기기 -->
				<%
					if (pageNumber != 1) {
				%>
						<a href="AppList.jsp?pageNumber=<%=pageNumber - 1%>&listSort=<%=listSort%>" class="btn btn-success btn-arrow-left">줄이기</a>
				<%
					}
					if (appDAO.nextPage(pageNumber, listSort)) {
				%>
						<a href="AppList.jsp?pageNumber=<%=pageNumber + 1%>&listSort=<%=listSort%>" class="btn btn-success btn-arrow-left">더 보기</a>
				<%
					}
				%>

				<!-- 회원만넘어가도록 -->
				<%
					if (userID != null && userCom != null) {
				%>
						<a href="EnterApp.jsp" class="btn btn-primary pull-right">앱 등록하기</a>
				<%
					}
					else if(userCom != null){
				%>
						<button class="btn btn-primary pull-right"
							onclick="if(confirm('로그인을 해주세요'))location.href='Login.jsp';"
							type="button">앱 등록하기</button>
				<%
					}
				%>
	
			</div>
		</div>	
		<!-- 애니매이션 담당 JQUERY -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<!-- 부트스트랩 JS  -->
		<script src="js/bootstrap.js"></script>
	
	</body>
	</html>