<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mirim.hs.kr.UserDAO" %>
<%@ page import="mirim.hs.kr.User" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="user" class="mirim.hs.kr.User" scope="request" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="company" />
<jsp:setProperty name="user" property="gender" />
<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="password" /> 
<jsp:setProperty name="user" property="phone" />
<jsp:setProperty name="user" property="comphone" />
<jsp:setProperty name="user" property="age" />
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>jsp 게시판 웹사이트</title>
	</head>
	<body>
		<%
		if (user.getName() == null || user.getEmail() == null || user.getGender() == null
		|| user.getCompany() == null || user.getComphone() == null || user.getPassword() == null || user.getPhone() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')");
					script.println("history.back()");
				script.println("</script>");
		}else if (user.getCompany() == null && user.getComphone() == null){
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join_user(user);	
			if(result == -1){ // 아이디가 기본키기. 중복되면 오류.
				PrintWriter script = response.getWriter();
				script.println("<script>");
					script.println("alert('이미 존재하는 아이디 입니다.')");
					script.println("history.back()");
				script.println("</script>");
			}
			//가입성공
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
					script.println("location.href = 'index.jsp'");
				script.println("</script>");
			}
		}  
		else{
			UserDAO userDAO = new UserDAO(); //인스턴스생성
			int result = userDAO.join(user);				
			if(result == -1){ // 아이디가 기본키기. 중복되면 오류.
				PrintWriter script = response.getWriter();
				script.println("<script>");
					script.println("alert('이미 존재하는 아이디 입니다.')");
					script.println("history.back()");
				script.println("</script>");
			}
			//가입성공
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
					script.println("location.href = 'index.jsp'");
				script.println("</script>");
			}
		}
			%>
	</body>
</html>