<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mirim.hs.kr.*"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<jsp:useBean id="app" class="mirim.hs.kr.App" scope="page" />
<jsp:setProperty name="app" property="title" />
<jsp:setProperty name="app" property="category" />
<jsp:setProperty name="app" property="content" />
<jsp:setProperty name="app" property="rank" />
<jsp:setProperty name="app" property="icon" />
<jsp:setProperty name="app" property="device" />
<%
	System.out.println(app);
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
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'Login.jsp'");
			script.println("</script>");
		} else {

			if (app.getTitle() == null|| app.getCategory() == null|| app.getContent() == null
					 || app.getRank() == 0 || app.getDevice() == null){
				PrintWriter script = response.getWriter();
				if(app.getRank() == 0){
					script.println("<script>");
					script.println("alert('별점 0점은 존재하지 않습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다')");
					script.println("history.back()");
					script.println("</script>");
				}
				
			} else {
				AppDAO appDAO = new AppDAO();
				if(app.getIcon() == null){
					app.setIcon("none");
				}
				int result = appDAO.enterApp(app.getTitle(), userID, app.getCategory()
						,app.getContent(), app.getRank(), app.getDevice(), app.getIcon());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('앱 등록을 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='AppList.jsp'");
					script.println("</script>");
				}

			}

		}
	%>
</body>
</html>
