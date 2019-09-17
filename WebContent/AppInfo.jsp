<%@page import="java.util.ArrayList"%>
<%@page import="mirim.hs.kr.AppDAO"%>
<%@page import="mirim.hs.kr.*"%>
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
		
		int ano = 0;

		if (request.getParameter("ANO") != null) {
			ano = Integer.parseInt(request.getParameter("ANO"));
		}
		if (ano == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		App app = new AppDAO().getApp(ano);

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
				<li><a href="ReviewList.jsp">리뷰 모아보기</a></li>
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
<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;"><%= app.getTitle() %></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성자</td>
						<td><%=app.getEmail() %></td>
					</tr>
					<tr>
						<td>범주</td>
						<td><%=app.getCategory() %></td>
					</tr>
					<tr>
						<td>회사</td>
						<td><%=app.getCompany() %></td>
					</tr>
					<tr>
						<td>등록일</td>
						<td><%=app.getCdate() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><%=app.getContent() %></td>
					</tr>
					<tr>
						<td>디바이스</td>
						<td><%=app.getDevice() %></td>
					</tr>
				</tbody>
			</table>	
		</div>
		<div class = "row">
		<%
			if(userID != null){
					if(userID.equals(app.getEmail())){
		%>
						<button class = "btn btn-success pull-right"" onclick="location.href='AppModify.jsp?ANO=<%=app.getNo()%>';">앱 정보 수정하기</button>
						<button class = "btn btn-success pull-right"" onclick="location.href='AppDelete.jsp?ANO=<%=app.getNo()%>';">앱 삭제하기</button>
		<%
					}
		%>
					<button class = "btn btn-primary btn-block" onclick="location.href='AppDown.jsp?ANO=<%=app.getNo()%>';">앱 다운받기</button>
		<% 
						
			}
			else{
		%>
			<button class = "btn btn-primary btn-block" onclick="if(confirm('로그인을 해주세요'))location.href='Login.jsp';">앱 다운받기</button>
		<%		
			}
		%>
			
			
		</div>
		<%
			AppDAO appDAO = new AppDAO();
			if(appDAO.downReview(app.getNo(), userID)){
		%>
			<div class = "row">
				<form method="post" action="WriteReviewResult.jsp">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">댓글 작성하기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td ><input type="text" class="form-control" name="ano" readonly value="<%=app.getNo()%>"/></td>
								<td><input type="text" class="form-control" name="email" readonly value="<%=userID%>"/></td>
							</tr>
							<tr>
								<td colspan="2"><input type="text" class="form-control" placeholder="리뷰 제목" name="rtitle" maxlength="50"/></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="리뷰 내용" name="rcontent" rows="5"></textarea></td>
								<td><input type="number" class="form-control" name="star" placeholder="별점" min="1" max="100"></td>
							</tr>
						</tbody>
					</table>	
					<input type="submit" class="btn btn-primary pull-right" value="리뷰 작성하기" />
				</form>
			</div>
		<% 
			}
			else{	
				out.println("앱을 다운 받으면 리뷰을 작성할 수 있습니다.");
			}
		%>
		<%
			ReviewDAO reviewDAO = new ReviewDAO();
			ArrayList<Review> reviewList =  reviewDAO.getReviewList(app.getNo());
			if(reviewList != null){
		%>
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="6" style="background-color: #eeeeee; text-align: center;">리뷰</th>
						</tr>
					</thead>
					<tbody>
					<%for (int i = 0; i < reviewList.size(); i++) { %>
						<tr>
							<td>번호</td>
							<td><%=(i+1) %></td>
							<td>작성자</td>
							<td><%=reviewList.get(i).getEmail() %></td>
							<td>별점</td>
							<td><%=reviewList.get(i).getStar()%></td>
						</tr>
						<tr>
							<td colspan = "2">제목</td>
							<td colspan = "4"><%=reviewList.get(i).getRtitle() %></td>
						</tr>
						<tr>
							<td colspan = "2">내용</td>
							<td colspan = "4"><%=reviewList.get(i).getRcontent() %></td>
						</tr>
						<tr>
							<td colspan = "6"><%
									if(userID != null){
										if(userID.equals(reviewList.get(i).getEmail())){
									%>
											<button class = "btn btn-success pull-right" onclick="location.href='ReviewDelete.jsp?RNO=<%=reviewList.get(i).getRno()%>';">리뷰 삭제하기</button>
									<%
										}		
									}%>
							</td>
						</tr>
					<%} %>
					</tbody>
				</table>
					
			</div>
		<%} %>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
</body>
</html>