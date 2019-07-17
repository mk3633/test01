<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// center/writePro.jsp
// 한글처리
request.setCharacterEncoding("utf-8");
// 파라미터값 변수에 저장
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// BoardBean bb 객체 생성
BoardBean bb = new BoardBean();
// 멤버변수 <= 파라미터 값 저장
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);

// BoardDAO bdao 객체 생성
BoardDAO bdao = new BoardDAO();
// insertBoard bb 
bdao.insertBoard(bb);

%>
<script type="text/javascript">
	alert("게시물 등록완료★");
	location.href="../center/notice.jsp";
</script>
<%

%>
</body>
</html>