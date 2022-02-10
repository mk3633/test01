<%@page import="board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">
<link href="../css/reset.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css" href="../css/owl.carousel.css" />
<link rel="stylesheet" type="text/css" href="../css/owl.theme.default.css" />

<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/owl.carousel.js"></script>
<script src="../js/script.js"></script>

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

<div id="wrap"> <!-- 972 -->

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />

<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div class="visual-wrap">
        <div class="visual owl-carousel owl-theme">
            <div class="img01">
                <div class="text">
                    <strong>반려견 패션<br>알아보기</strong>
                </div>
                <a href="#" class="btn">MORE</a>
            </div>
            <div class="img02">
                <div class="text">
                    <strong>한숨쉬는 이유<br>상황별로 알아보기</strong>
                </div>
                <a href="#" class="btn">MORE</a>
            </div>
            <div class="img03">
                <div class="text">
                	<strong>장난감 종류 및<br>취향 파악하기</strong>
                </div>
                <a href="#" class="btn">MORE</a>
            </div>
        </div>
</div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div class="main_section">
  <ul class="sect_inner">
    <li>
      <span class="thumb">
        <img src="../images/icon1.jpg" alt="" />
      </span>
      <p class="name">강아지 연구소</p>
      <p class="sect_tit">다양한 반려견의 이야기를 알아보세요.</p>
      <a class="btn_more" href="#" onclick="return false;">
        <span>준비중</span>
      </a>
    </li>
    <li>
      <span class="thumb">
       <img src="../images/icon2.jpg" alt="" />
      </span>
      <p class="name">고양이연구소 야옹야옹</p>
      <p class="sect_tit">다양한 반려묘의 이야기를 알아보세요.</p>
      <a class="btn_more" href="#" onclick="return false;">
        <span>준비중</span>
      </a>
    </li>
    <li>
      <span class="thumb">
        <img src="../images/icon3.jpg" alt="" />
      </span>
      <p class="name">기타 반려동물 연구소</p>
      <p class="sect_tit">다양한 반려동물의 이야기를 알아보세요.</p>
      <a class="btn_more" href="#" onclick="return false;">
        <span>준비중</span>
      </a>
    </li>
  </ul>
</div>


<div class="main_center">


<!-- <div class="clear"></div> -->
<div id="news_notice">
<h3 class="brown">공지사항</h3>


<table>
<%
// BoardDAO bdao  객체생성
BoardDAO bdao = new BoardDAO();
// int count=getBoardCount() 메서드 호출

int count = bdao.getBoardCount();

int pageSize = 5;
int startRow = 1;

String pageNum=request.getParameter("pageNum");
//pageNum 이 없으면 "1"로 설정
if(pageNum==null){
	pageNum="1";
}
int currentPage=Integer.parseInt(pageNum);

//int startRow = 구하기
//int startRow = (currentPage-1)*pageSize+1;
//int endRow = 구하기
int endRow=currentPage*pageSize;

List<BoardBean> boardList = null;
// 게시판 글 있으면
// boardList = getBoardList(시작행, 가져올 글 개수)
if(count!=0){
	boardList=bdao.getBoardList(startRow, pageSize);
	for(int i = 0; i < boardList.size(); i++){
		BoardBean bb=boardList.get(i);
		%>
		<tr>
		<td class="contxt">
		<a href="../center/content.jsp?num=<%=bb.getNum()%>&pageNum=1"><%=bb.getSubject() %></a>
		</td>
    	<td>
    	<%=bb.getDate() %>
    	</td>
    	</tr>
		<%
	}
}
%>
</table>
</div>
<div id="news_notice">
<h3 class="brown">다운로드 자료실</h3>


<table>
<%
// BoardDAO bdao  객체생성
BoardDAO bdao2 = new BoardDAO();
// int count=getBoardCount() 메서드 호출

int count2 = bdao.getBoardCount();

int pageSize2 = 5;
int startRow2 = 1;

String pageNum2=request.getParameter("pageNum");
//pageNum 이 없으면 "1"로 설정
if(pageNum2==null){
	pageNum2="1";
}
int currentPage2=Integer.parseInt(pageNum);

//int startRow = 구하기
//int startRow = (currentPage-1)*pageSize+1;
//int endRow = 구하기
int endRow2=currentPage*pageSize;

List<BoardBean> boardList2 = null;
// 게시판 글 있으면
// boardList = getBoardList(시작행, 가져올 글 개수)
if(count!=0){
	boardList2=bdao.getBoardList2(startRow, pageSize);
	for(int i = 0; i < boardList2.size(); i++){
		BoardBean bb=boardList2.get(i);
		%>
		<tr>
		<td class="contxt">
		<a href="../center/fcontent.jsp?num=<%=bb.getNum()%>&pageNum=1"><%=bb.getSubject() %></a>
		</td>
    	<td>
    	<%=bb.getDate() %>
    	</td>
    	</tr>
		<%
	}
}
%>
</table>
	
</div>
</div> <!-- main center end -->
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />


</div> <!-- wrap -->
</body>
</html>