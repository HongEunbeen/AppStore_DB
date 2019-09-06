<%@page import="mirim.hs.kr.UserDAO"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="mirim.hs.kr.User" scope="page" />
<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="password" /> 


<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>jsp 게시판 웹사이트</title>
	</head>
	<body>
		<%
			UserDAO userDAO = new UserDAO(); //인스턴스생성
			int result = userDAO.login(user.getEmail(), user.getPassword());
			
			//로그인 성공
			if(result == 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("<location.href = 'main.jsp'");
				script.println("</script>");
			}
			//로그인 실패
			else if(result == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 틀립니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			//아이디 없음
			else if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			//DB오류
			else if(result == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('DB오류가 발생했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}		
		
		%>
	</body>
</html>