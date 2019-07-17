<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updateForm.jsp</title>
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
 
 <script type="text/javascript">
 function check(){
	if(document.fr.pass.value==""){
		alert("비밀번호를 입력하세요.");
		document.fr.pass.focus();
		return false;
	} 
 }
 </script>
</head>
<body>
<%
// 세션값 가져와서 변수에 저장
String id=(String)session.getAttribute("id");

// MemberDAO mdao 객체 생성
// MemberBean mb = getMember(id) 호출
MemberDAO mdao = new MemberDAO();
MemberBean mb = mdao.getMember(id);

%>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../member/updateForm.jsp">나의 정보 수정</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1 class="subtitle"><em>회원</em>정보수정</h1>
<form action="../member/updatePro.jsp" id="join" method="post" name="fr">
<fieldset>
<legend>필수 정보</legend>
<label>아이디</label>
<input type="text" name="id" class="id" value="<%=id %>" readonly><br>
<label>비밀번호</label>
<input type="password" name="pass"><br>
<label>닉네임</label>
<input type="text" name="name" value="<%=mb.getName() %>"><br>
<label>이메일</label>
<input type="email" name="email" value="<%=mb.getEmail() %>"><br>
</fieldset>

<fieldset>
<legend>선택 정보</legend>
<label>주소</label>
<input type="text" id="post" placeholder="우편번호" name="post" value="<%=mb.getPost() %>">
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="dup"><br>
<label>도로명 주소</label>
<input type="text" id="address" class="address" placeholder="도로명주소" name="address" value="<%=mb.getAddress() %>"><br>
<!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
<span id="guide" style="color:#999;display:none"></span>
<label>상세 주소</label>
<input type="text" id="address2" placeholder="상세주소" name="address2" value="<%=mb.getAddress2() %>"><br>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraRoadAddr !== ''){
                     extraRoadAddr = ' (' + extraRoadAddr + ')';
                 }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById('post').value = data.zonecode;
                 document.getElementById("address").value = roadAddr;

                 var guideTextBox = document.getElementById("guide");

            }
        }).open();
    }
</script>

<!-- <label>주소</label> -->
<!-- <input type="text" name="id" class="id"> -->
<!-- <label></label> -->
<!-- <input type="text" name="address" class="address" value ="상세주소"><br> -->
<label>전화번호</label>
<input type="text" name="phone" value="<%=mb.getPhone() %>"><br>
<label>휴대폰 번호</label>
<input type="text" name="mobile" value="<%=mb.getMobile() %>"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="회원수정" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>