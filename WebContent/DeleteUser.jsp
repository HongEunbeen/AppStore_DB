<%@page import="mirim.hs.kr.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		UserDAO userDAO = new UserDAO();
		userDAO.delete(userID);
			
		session.invalidate();
	%>
	<script>
		location.href = 'index.jsp';
	</script>
</body>
</html>