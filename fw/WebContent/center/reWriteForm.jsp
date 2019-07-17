<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<jsp:include page="../inc/board_left_nav.jsp" />
<!-- 왼쪽메뉴 -->
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값 없으면
if(id==null){
	response.sendRedirect("../member/login.jsp");
}

int num=Integer.parseInt(request.getParameter("num"));
int re_ref=Integer.parseInt(request.getParameter("re_ref"));
int re_lev=Integer.parseInt(request.getParameter("re_lev"));
int re_seq=Integer.parseInt(request.getParameter("re_seq"));
%>
<!-- 게시판 -->
<article>
<h1 class="subtitle"><em>N</em>otice re</h1>
<form action="reWritePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="re_ref" value="<%=re_ref%>">
<input type="hidden" name="re_lev" value="<%=re_lev%>">
<input type="hidden" name="re_seq" value="<%=re_seq%>">

<table id="notice2">
<tr><td class="ftwrite">글쓴이</td>
   <td class="fttitle">
   <input type="text" class="text" name="name" value="<%=id%>" readonly></td></tr>
<tr><td class="ftwrite">비밀번호</td>
    <td class="fttitle"><input type="password" name="pass"></td></tr>
<tr><td class="ftwrite">제목</td>
    <td class="fttitle"><input type="text" name="subject" style="width:500px;" value="[답글]"></td></tr>
<!-- <tr><td class="ftwrite">파일</td> -->
<!--     <td class="fttitle"><input type="file" name="file"></td></tr>   -->
<tr><td class="ftwrite">글내용</td>
    <td class="fttitle"><textarea name="content" rows="10" cols="20"></textarea></td></tr>
</table>

<div id="table_search">
<input type="submit" value="글쓰기" class="btn">
</div>
</form>
<div class="clear"></div>
<div id="page_control">
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>




