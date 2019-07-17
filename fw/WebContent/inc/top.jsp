<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값이 없으면  login | join
// 세션값이 있으면  kim님 | logout
if(id==null){
	%><div id="login"><a href="../member/login.jsp">로그인</a> | <a href="../member/join.jsp">회원가입</a></div><%
}else{
	%><div id="login"><%=id %>님 | <a href="../member/updateForm.jsp">회원정보수정</a> | <a href="../member/logout.jsp">로그아웃</a></div><%
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo_dog01.png" alt="강아지대통령"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">홈</a></li>
	<li><a href="../company/welcome.jsp">강아지대통령</a></li>
	<li><a href="../center/notice.jsp">연구소</a></li>
	<li><a href="../company/map.jsp">오시는 길</a></li>
</ul>
</nav>
</header>