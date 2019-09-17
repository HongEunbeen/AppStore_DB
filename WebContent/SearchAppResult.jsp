<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mirim.hs.kr.*"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	String search = request.getParameter("search");
	String option = request.getParameter("option");
%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
		}
		if (search == null){
			PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('검색어를 입력해 주세요')");
				script.println("history.back()");
				script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('검색어를 입력해 주세요')");
			script.println("location.href = 'SearchApp?search="+search+"&option="+option+".jsp'");
			script.println("</script>");
			
		}
	%>
</body>
</html>
