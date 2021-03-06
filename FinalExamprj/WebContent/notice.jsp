<%@page import="web.index.entity.Notice"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	// 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
	if (session.getAttribute("Signedid") == null) {
		out.println("<script>alert('로그인 후 이용하실 수 있습니다.');</script>");
		out.println("<script>location.href='/login.jsp'</script>");
	}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>공지사항 페이지</title>

<style type="text/css">
body {
	padding-bottom: 10px;
}

.navbar-text {
	font-size: 20px;
	font-family: monospace;
	font-weight: bold;
}

li {
	padding-top: 2px; font-size;
	font-family: sans-serif;
	font-weight: bold;
}

.footer-bs {
	background-color: #3c3d41;
	padding: 60px 40px;
	color: rgba(255, 255, 255, 1.00);
	margin-bottom: 20px;
	border-bottom-right-radius: 6px;
	border-top-left-radius: 0px;
	border-bottom-left-radius: 6px;
}

.footer-bs .footer-brand, .footer-bs .footer-nav, .footer-bs .footer-social,
	.footer-bs .footer-ns {
	padding: 10px 25px;
}

.footer-bs .footer-nav, .footer-bs .footer-social, .footer-bs .footer-ns
	{
	border-color: transparent;
}

.footer-bs .footer-brand h2 {
	margin: 0px 0px 10px;
}

.footer-bs .footer-brand p {
	font-size: 12px;
	color: rgba(255, 255, 255, 0.70);
}

.footer-bs .footer-nav ul.pages {
	list-style: none;
	padding: 0px;
}

.footer-bs .footer-nav ul.pages li {
	padding: 5px 0px;
}

.footer-bs .footer-nav ul.pages a {
	color: rgba(255, 255, 255, 1.00);
	font-weight: bold;
	text-transform: uppercase;
}

.footer-bs .footer-nav ul.pages a:hover {
	color: rgba(255, 255, 255, 0.80);
	text-decoration: none;
}

.footer-bs .footer-nav h4 {
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 3px;
	margin-bottom: 10px;
}

.footer-bs .footer-nav ul.list {
	list-style: none;
	padding: 0px;
}

.footer-bs .footer-nav ul.list li {
	padding: 5px 0px;
}

.footer-bs .footer-nav ul.list a {
	color: rgba(255, 255, 255, 0.80);
}

.footer-bs .footer-nav ul.list a:hover {
	color: rgba(255, 255, 255, 0.60);
	text-decoration: none;
}

.footer-bs .footer-social ul {
	list-style: none;
	padding: 0px;
}

.footer-bs .footer-social h4 {
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 3px;
}

.footer-bs .footer-social li {
	padding: 5px 4px;
}

.footer-bs .footer-social a {
	color: rgba(255, 255, 255, 1.00);
}

.footer-bs .footer-social a:hover {
	color: rgba(255, 255, 255, 0.80);
	text-decoration: none;
}

.footer-bs .footer-ns h4 {
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 3px;
	margin-bottom: 10px;
}

.footer-bs .footer-ns p {
	font-size: 12px;
	color: rgba(255, 255, 255, 0.70);
}

@media ( min-width : 768px) {
	.footer-bs .footer-nav, .footer-bs .footer-social, .footer-bs .footer-ns
		{
		border-left: solid 1px rgba(255, 255, 255, 0.10);
	}
	.footer-bs {
		margin-top: -111px;
		margin-left: -62px;
		margin-right: -62px;
		padding: -50px
	}
	body {
		margin-top: 110px;
		margin-bottom: 50px
	}
	#page {
		margin-top: 120px;
		padding-left: 500px;
	}
	.table {
		width: 1150px;
		margin-left: 50px;
		margin-bottom: 20px;
	}
	h1 {
		margin-left: 70px;
		margin-bottom: 10px;
		margin-top: 70px; <!--
		font-family: monospace; -->
		font-weight: bolder;
	}
	.table-form {
		margin-left: 900px;
		margin-bottom: 30px;
		margin-top: -40px;
	}
	#main {
		width: 1500px;
	}
}
</style>

</head>

<body>
	<header>
		<nav class="navbar navbar-default  navbar-fixed-top">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				     <p class="navbar-text"><a href="welcomeindex.jsp" style="color: black;">Myongji</a> </p>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li><a href="/enrollment">수강 신청</a></li>
			<li><a href="/mypage">신청 내역</a></li>
			<li><a href="/deleteLecture">수강 정정</a></li>
			<li><a href="/notice">공지사항</a></li>
			<li><a href="/LectureEvaluation">강의 평가</a></li>
			<li><a href="/book.jsp">도서검색</a>
			<li><a href="/delivery">택배안심 보관함</a></li>
      </ul>


					<ul class="nav navbar-nav navbar-right">
						 <li><a href="/miridamgi">미리담기</a></li>
                           <li><a href="/mybag">책가방</a></li>
						<li><a href="/myinfo">내 정보</a></li>
						<li><a href="/logout.jsp">로그 아웃</a></li>
						<li><a href="http://pf.kakao.com/_FMxnUxb" target = "_blank" ><img width="100px;"   src="data:image/png;base64,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" /></a></li>
						
					</ul>


				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</header>
	<main class="main">
		<h1>공지사항</h1>

		<form class="table-form" action="/notice" method="get">

			<select name="selection" style="padding-left:3px; padding-bottom:6px;">
				<option value="title" ${(param.selection=="title")?"selected":"" }>제목</option>
				<option value="nickname"  ${(param.selection=="nickname")? "selected" : "" }>작성자</option>
			</select> <input type="text" autocomplete="off" name="search"  value="${param.search}"/>
			 <input class="btn btn-search"	type="submit" value="검색" />

		</form>

		<div id="table">
			<table class="table table-hover">
				<thead>
					<tr>

						<th scope="col">&nbsp;&nbsp;번호</th>
						<th scope="col" style="text-align: justify ;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목</th>
						<th scope="col">닉네임</th>
						<th scope="col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일</th>
						<th scope="col">조회수</th>

					</tr>
				</thead>
				<tbody>

					<c:forEach items="${list}" var="n">
					<!-- NOTICE 테이블로부터 조건에 맞는 리스트를 꺼내온다. -->
						<tr>
							<th scope="row">&nbsp;&nbsp;&nbsp;&nbsp;${n.id}</th>
							<td style="text-align: center;"><a href="/detail?id=${n.id}"style="color: black;">${n.title}</a></td>
							<!-- 공지사항의 제목을 클릭하면 해당 공지사항의 상세페이지로 이동한다. -->
							<!-- 공지사항의 제목을 클릭하면 /detail 페이지로 get방식으로 id가 id라는 이름으로 전달된다.-->
							<!-- /detail페이지에서 "id"라는 이름으로 클릭한 글의 id를 꺼낼 수 있다. -->
							<td>&nbsp;&nbsp;${n.nickname}</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;	<fmt:formatDate value="${n.date}" pattern="YY-MM-dd "/></td>
							<!-- 날짜의 출력 형식을 YY-MM-dd로 지정(포맷)한다. -->
							<td>&nbsp;&nbsp;&nbsp;&nbsp;${n.hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="margin-top align-center pager">

			<div>

				<c:set var="page" value="${param.p ==null?1:param.p}" />
				<!--  page라는 이름의 변수의 값을 ${param.p ==null?1:param.p}로 설정한다. pram.p: p파라미터의 값 
				page를 선택하지 않으면, 1저장. -> 공지사항 페이지가 처음 표출될 때는 페이지가 선택되지 않은 상태인데,  이때 1페이지가 노출되어야 하기 때문이다.-->
				
				<c:set var="startNum" value="${page-(page-1)%5 }" />
				<!-- 페이지의 시작 번호는 page-(page-1)%5로 구할 수 있다. 중요 !!!!!!!  -->
				<!-- 예를 들어 17페이지의 시작 페이지 번호는 17-(16%5) 즉, 16이다. -->
				<!--  5페이지의 시작 페이지 번호는 5-(4%5) 즉, 1이다. -->
				<!-- !!!!!!!!!!!!! 페이징 처리:  page-(page-1)%5 !!!!!!!!!!!!!!!! -->
				
				<!-- startNum이라는 이름의 변수의 값을 페이지의 값이 달라짐에 따라 동적으로 설정 -->
				<!-- page의 값이 17이면 startNum의 값은 16, page의 값이 5이면 startNum의 값은 1  -->

			</div>

		
			<c:set var="lastNum" value="10" />
			<!-- 임의로 10으로 설정했으나 시간이 남으면 NOTICE레코드 수를 구해서 그것을 value로 설정할 부분 -->
	


			<ul class="-list- center" style="margin-left:-30px; margin-top:15px;">
				<c:forEach var="i" begin="0" end="4"> <!-- 페이지 번호 5개씩, 0부터 4까지 i라는 이름으로 루핑을 돈다. -->
					<li><a style="color:  ${ (page == (startNum+i ))?'black':'gray'} " 
						href="/notice?p=${startNum+i }&selection=${param.selection }&search=${param.search}">${startNum+i}</a></li>
				</c:forEach>
       <!-- 선택한 페이지 번호가 현재 페이지 번호와 같으면 검정색, 아니면 회색  -->
       <!-- startNum+i가 현재 페이지 번호 -->
       <!-- 페이지 번호를 선택하면 그에 맞는 공지사항 리스트를 보여준다.  -->
			</ul>
			
			<div>

				<c:if test="${ startNum!=1}">
				<!-- 12345
				      678910
				     -->
				<!-- test속성에 조건문을 입력, 조건을 만족하면 if태그 안의 내용을 실행, 만족하지 않으면 실행하지 않음.  -->
				<!-- 시작 페이지가 1이 아니면 이전 페이지로 이동할 수 있음.  -->
				<!-- startNum이 6이라면 5페이지로 이동하므로 이전 페이지로 이동한 것. -->
				<!-- 마찬가지로 startNum이 11이라면  -->
					<a href="?p=${startNum-1 }&t=&q=" class="btn btn-prev"  style="color:black;">이전</a>
				</c:if>

				<c:if test="${ startNum==1}">
				<!-- 시작 번호가 1이면 이전페이지로 이동할 수 없으므로 '이전 페이지가 없습니다' 표출 -->
					<span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다.');" style="color:black;">이전</span>
				</c:if>

				<c:if test="${startNum+5 <lastNum }">
				<!--  다음 페이지가 표출되도록 하려면 다음 페이지로 넘어갔을 때의 startNum이 무조건 lastNum보다 작아야한다. -->
					<a href="?p=${startNum+5 }&t=&q=" class="btn btn-next" style="color:black;">다음</a>
				</c:if>

				<c:if test="${startNum+5 >=lastNum}">
				<!-- startNum+5: 다음페이지로 넘어갔을 때의 startNum -->
				<!-- startNum+4가 그 startNum과 같은 범주에 속하는 마지막 페이지 번호이다. 즉 startNum+5를 한다면 다음 페이지로 넘어가게 된다. -->
					<!-- 12345
				      678910
				     -->
				     <!-- 예를 들어 startNum이 1이라면 같은 범주에 속하는 마지막 페이지 번호는 startNum+4인 5이다.
				     만약 startNum+5를 하게 된다면 페이지 번호는 6이 되고 , 페이지에 범주가 변경되게 된다. -->
				     <!-- 이때, startNum인 6에 5를 더한다면 11이 된다. lastNum을 10으로 설정했으므로 startNumdl 6일때는 다음을 누르더라도 다음페이지로
				     이동하지 않도록 해야한다. 따라서 '다음 페이지가 없습니다.'라는 메시지를 표출한다.   -->
					<span class="btn btn-next" onclick="alert('다음 페이지가 없습니다.');" style="color:black;">다음</span>
				</c:if>

			</div>
		</div>


	</main>

</body>
</html>