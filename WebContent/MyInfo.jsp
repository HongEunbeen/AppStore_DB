<%@page import="java.util.ArrayList"%>
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
		UserDAO userDAO = new UserDAO();
		
		User user = new User();
		if(userDAO.checkCom(userID)){
			user = userDAO.getUser(userID);
		}else{
			user = userDAO.getUser_Com(userID);
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
					<li class="active"><a href="MyInfo.jsp">마이 페이지</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#logout">로그아웃</button>
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#outuser">회원탈퇴</button>
			<button type="button" class="btn btn-info btn-lg" data-toggle="collapse" data-target="#modifyUser">회원수정</button>
			<div class="modal fade" id="logout" role="dialog">
			    <div class="modal-dialog modal-lg">
				      <div class="modal-content">
					        <div class="modal-header">
					          	<button type="button" class="close" data-dismiss="modal">&times;</button>
					          	<h4 class="modal-title">로그아웃</h4>
					        </div>
					        <div class="modal-body">
					          	<p>로그아웃을 하시겠습니까?</p>
					        </div>
					        <div class="modal-footer">
					         	 <button class="btn btn-default" data-dismiss="modal" onclick="location.href='Logout.jsp'">로그아웃하기</button>
					        </div>
				      </div>
			    </div>
		  </div>
		  <div class="modal fade" id="outuser" role="dialog">
			    <div class="modal-dialog modal-lg">
				      <div class="modal-content">
					        <div class="modal-header">
					          	<button type="button" class="close" data-dismiss="modal">&times;</button>
					          	<h4 class="modal-title">회원탈퇴</h4>
					        </div>
					        <div class="modal-body">
					          	<p>회원탈퇴를 하시겠습니까?</p>
					        </div>
					        <div class="modal-footer">
					         	 <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='DeleteUser.jsp'">회원탈퇴하기</button>
					        </div>
				      </div>
			    </div>
		  	</div>
		
		
			<div id="modifyUser" class="collapse">
				<form method="post" action="UserModifyResult.jsp">
					<h3 style="text-align: center;">회원수정</h3>
					<div class="form-group">
						<input type="email" class="form-control" name="email" maxlength="30" value="<%=user.getEmail()%>" readonly>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="password" maxlength="20" value="<%=user.getPassword()%>">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="name" maxlength="20" value="<%=user.getName()%>">
					</div>
					<div class="form-group">
						<input type="number" class="form-control" placeholder="전화번호" name="phone" maxlength="20" value="<%=user.getPhone()%>">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"> 
								<input type="radio" name="gender" autocomplete="off" value="남자" <%if(user.getGender().equals("남자")){ %> checked = "checked"<%}%>>남자
							</label> 
							<label class="btn btn-primary"> 
								<input type="radio" name="gender" autocomplete="off" value="여자" <%if(user.getGender().equals("여자")){ %> checked = "checked"<%}%>>여자
							</label>
						</div>
					</div>
					<div class="form-group">
					    <label for="age">나이</label>
					    
					    <select class="form-control" id="age" name = "age">
					      <%
					      	for(int i = 0; i < 100; i++){
					      		if(i == Integer.parseInt(user.getAge())){
					      			out.println("<option value = '"+i+"' selected = 'selected'>" + i + "</option>");
					      		}else{
					      			out.println("<option value = '"+i+"'>" + i + "</option>");
					      		}	      		
					      	}
					      %>
					    </select>
					</div>
					<input type="submit" class="btn btn-primary form-control" value="회원정보 수정">
				</form>
			</div>
		</div>
		<%
			ReviewDAO reviewDAO = new ReviewDAO();
			ArrayList<String> reviewList = reviewDAO.getReviewEmail(userID);
		%>
		<div class="row">
			<table class="table table-striped">
			    <thead>
			      	<tr>
						<th colspan="4" style="background-color: #eeeeee; text-align: center;">내가 작성한 리뷰</th>
					</tr>
			    </thead>
			    <tbody>
				     <tr>
				        <th>앱 이름</th>
				        <th>리뷰제목</th>
				        <th>별점</th>
			      	</tr>
			      <%for (int i = 0; i < reviewList.size(); i++) { 	
			      %>
						<tr>
							<td colspan="3"><%=reviewList.get(i)%></td>
						</tr>
						<%} %>
			    </tbody>
			 </table>
	  	</div>
	  	<%if(user.getCompany() != null) {
		  	AppDAO appDAO = new AppDAO();
		  	ArrayList<App> listMyApp= appDAO.getMyApp(userID);
			
		%>
			<div class="row">
				<table class="table table-striped">
				    <thead>
				      	<tr>
							<th colspan="4" style="background-color: #eeeeee; text-align: center;">내가 등록한 앱</th>
						</tr>
				    </thead>
				    <tbody>
					     <tr>
					        <th>앱 이름</th>
					        <th>다운받은 유저의 이름</th>
				      	</tr>
				       <%for (int i = 0; i < listMyApp.size(); i++) { 
				    	   String listMyAppUser = appDAO.getMyAppUser(listMyApp.get(i).getNo());
				       	%>
						<tr>
							<td><%=listMyApp.get(i).getTitle()%></td>
							<td><%=listMyAppUser%></td>
						</tr>
						<%} %>
				    </tbody>
				 </table>
				  <div class="modal fade" id="downlist" role="dialog">
				    <div class="modal-dialog modal-lg">
					      <div class="modal-content">
						        <div class="modal-header">
						          	<button type="button" class="close" data-dismiss="modal">&times;</button>
						          	<h4 class="modal-title">다운로드 진행한 유저</h4>
						        </div>
						        <div class="modal-body">
						          	<p><% %></p>
						        </div>
						        <div class="modal-footer">
						         	 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						        </div>
					      </div>
				    </div>
			  	</div>
		 	</div>
		 	<%
		 		ArrayList<User> list = userDAO.getComPeople(user.getCompany());
		 	if(list != null){
		 	%>
		  	<div class="row">
				<table class="table table-striped">
				    <thead>
				      	<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">같은 회사 목록</th>
						</tr>
						<tr>
							<th style="text-align: center;"><%=user.getCompany() %></th>
							<th style="text-align: center;">회사 등록 앱</th>
							<th style="text-align: center;">
								<%
									ArrayList<String> appon = userDAO.getComApp(user.getCompany());
									for(int i =0; i < appon.size(); i++){
								%>
										<%=appon.get(i) + ","%>	
								<%	
									}
								%>
							</th>
						</tr>
				    </thead>
				    <tbody>
					     <tr>
					        <th>이름</th>
					        <th>이메일</th>
					        <th>전화번호</th>
				      	</tr>
				      <%for (int i = 0; i < list.size(); i++) { %>
						<tr>
							<td><%=list.get(i).getName() %></td>
							<td><%=list.get(i).getEmail() %></td>
							<td><%=list.get(i).getPhone()%></td>
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>
		<%} %>
	<%} %>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
</body>
</html>