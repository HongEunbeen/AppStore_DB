<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="mirim.hs.kr.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<jsp:useBean id="userNew" class="mirim.hs.kr.User" scope="page" />
<jsp:setProperty name="userNew" property="email" />
<jsp:setProperty name="userNew" property="password" />
<jsp:setProperty name="userNew" property="name" />
<jsp:setProperty name="userNew" property="phone" />
<jsp:setProperty name="userNew" property="company" />
<jsp:setProperty name="userNew" property="comphone" />
<jsp:setProperty name="userNew" property="age" />
<jsp:setProperty name="userNew" property="gender" />
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
	
		if (userNew.getName() == null || userNew.getEmail() == null || userNew.getGender() == null
				|| userNew.getPassword() == null || userNew.getPhone() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.update_user(userNew);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원수정에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원수정이 완료되었습니다.')");
				script.println("location.href='MyInfo.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
