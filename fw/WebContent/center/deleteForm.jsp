<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
//세션값 가져와서 변수에 저장
int num= Integer.parseInt(request.getParameter("num"));
String pageNum=request.getParameter("pageNum");

//num 파라미터 가져오기
// int num= Integer.parseInt(request.getParameter("num"));
// String pageNum=request.getParameter("pageNum");
//BoardDAO bdao 객체생성
BoardDAO bdao = new BoardDAO();
//BoardBean bb  =  getBoard(num) 메서드호출
BoardBean bb = bdao.getBoard(num);
//조회수 증가
//updateReadcount(num);
bdao.updateReadcount(num);

String content = bb.getContent();
if(content!=null){
	//			\r\n => <br>바꾸기 문자열.replace("old문자열", "new문자열")
	content=content.replace("\r\n", "<br>");
}


%>
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

<!-- 게시판 -->
<article>
<h1 class="subtitle"><em>N</em>otice delete</h1>
<table id="notice">
    <h1 id="bo_v_title"><%=bb.getSubject() %></h1>
    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        작성자 <strong><%=bb.getName() %></strong>
        <span class="bo_v_date">작성일</span><strong><%=bb.getDate() %></strong>
        조회<strong><%=bb.getReadcount() %>회</strong>
        댓글<strong>0건</strong>
    </section>
    

	<section id="bo_v_atc">
    	<%=content %>
    </section>
    <section id ="bo_v_can"">
    	
		<form action="deletePro.jsp?pageNum=<%=pageNum %>" method="post" name="fr">
		<input type="hidden" name="num" value="<%=num %>">
		<ul>
		<li>비밀번호 : 
		<input type="password" name="pass">
		<input type="submit" value="글삭제" class="btn">
		</li>
		</ul>
	</form>
	</section>

<div id="table_search">
<%
// 세션값 가져오기
String id = (String)session.getAttribute("id");
// 세션값 있으면
// 세션값과 글의 작성자와 비교 일치하면 글수정 글삭제 버튼이 보이기
if(id!=null){
	if(id.equals(bb.getName())){
		%>
		<input type="button" value="글수정" class="btn" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
		
		<% 
		
	}
}

%>

<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">
</div>
 
</table>

<!-- <div id="table_search"> -->
<!-- <input type="submit" value="글쓰기" class="btn"> -->
<!-- </div> -->

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