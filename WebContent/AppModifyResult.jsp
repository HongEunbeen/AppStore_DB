<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="mirim.hs.kr.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<jsp:useBean id="appNew" class="mirim.hs.kr.App" scope="page" />
<jsp:setProperty name="appNew" property="title" />
<jsp:setProperty name="appNew" property="category" />
<jsp:setProperty name="appNew" property="content" />
<jsp:setProperty name="appNew" property="icon" />
<jsp:setProperty name="appNew" property="device" />

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
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'Login.jsp'");
			script.println("</script>");
		} 
		
		//글이 유효한지 판별
		int ano = 0;
		if (request.getParameter("ANO") != null) {
			ano = Integer.parseInt(request.getParameter("ANO"));
		}
		if (ano == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'AppList.jsp'");
			script.println("</script>");
		}
		App app = new AppDAO().getApp(ano);
		if (!userID.equals(app.getEmail())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'AppList.jsp'");
			script.println("</script>");				
		} else {
			if (appNew.getTitle() == null || appNew.getContent() == null || appNew.getCategory() == null || appNew.getIcon() == null || appNew.getDevice() == null||
					appNew.getTitle() == "" || appNew.getContent() == "" || appNew.getCategory() == "" || appNew.getIcon() == "" || appNew.getDevice() == "") {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				AppDAO appDAO = new AppDAO();
				int result = appDAO.update(ano, appNew.getTitle(), appNew.getCategory(), appNew.getContent() , appNew.getDevice(), appNew.getIcon());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정이 완료되었습니다.')");
					script.println("location.href='AppInfo.jsp?ANO="+ ano +"'");
					script.println("</script>");
				}

			}

		}
	%>
</body>
</html>
