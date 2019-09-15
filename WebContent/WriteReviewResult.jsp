<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mirim.hs.kr.*"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<jsp:useBean id="review" class="mirim.hs.kr.Review" scope="page" />
<jsp:setProperty name="review" property="rtitle" />
<jsp:setProperty name="review" property="rcontent" />
<jsp:setProperty name="review" property="email" />
<jsp:setProperty name="review" property="ano" />
<jsp:setProperty name="review" property="star" />

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
		
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'Login.jsp'");
			script.println("</script>");
		} else {

			if (review.getEmail() == null || review.getRtitle() == null){
				PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다')");
					script.println("history.back()");
					script.println("</script>");
			} else {
				ReviewDAO reviewDAO = new ReviewDAO();
				int result = reviewDAO.enterReview(review.getRtitle(), review.getEmail(), review.getRcontent(), review.getAno(), review.getStar());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('리뷰등록에 실패하셨습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('리뷰가 등록되었습니다.')");
					script.println("location.href='AppInfo.jsp?ANO="+review.getAno()+"'");
					script.println("</script>");
				}

			}

		}
	%>
</body>
</html>
