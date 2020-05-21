<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
	if (session.getAttribute("Signedid") == null) {
		out.println("<script>alert('로그인 후 이용하실 수 있습니다.');</script>");
		out.println("<script>location.href='/login.jsp'</script>");
	}
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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

.navbar-text {
	font-size: 20px;
	font-family: monospace;
	font-weight: bold;
}

	body {
		margin-top: 110px;
		margin-bottom: 50px;
	   padding-bottom: 10px;
	}
body{
	width: 1150px;
	height:900px;
	margin-left: 60px;}
	
.btn-secondary
{
margin-bottom:5px;
margin-left: 550px;
margin-top: 5px;
width: 100px;
border-color: silver;
font-size: 16px;
text-align: center;
}
th{width: 90px; }

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
					<p class="navbar-text">
						<a href="welcomeindex.jsp">Myongji University</a>
					</p>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="#">수강 신청</a></li>
						<li><a href="#">강의 평가</a></li>
						<li><a href="/notice">공지사항</a></li>
						<li><a href="#">커뮤니티</a></li>
					</ul>


					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">책가방</a></li>
						<li><a href="#">마이페이지</a></li>
						<li><a href="/logout.jsp">로그 아웃</a></li>
					</ul>


				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</header>
	
	
	
	<main class="main">
	
	<div class="margin-top first">
					<h3 class="hidden">공지사항 내용</h3>
					<table class="table table-striped">
						<tbody>
							<tr>
								<th>제목</th>
								<td class="text-align-left text-indent text-strong text-orange"
									colspan="3">${notice.title }</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td class="text-align-left text-indent" colspan="3">	<fmt:formatDate value="${notice.date }" pattern="yyyy-MM-dd / hh:mm:ss"/></td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td>${notice.nickname } </td>
								<th>조회수</th>
								<td>${notice.hit }</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								
							<td colspan="3" style="text-align:left; " >${notice.files }</td>
							
							</tr>
							<tr class="content">
								<td colspan="4" style="padding-bottom: 450px; text-align: justify; font-size:16px; padding-left:20px; padding-right:20px;
								 padding-top: 20px;">${notice.content}</td>
							</tr>
							
								<tr>
								<th></th>
								<td colspan="3" class="text-align-left text-indent"><a
									class="text-blue text-strong" href=""></a></td>
							</tr>
							</tbody>
							</table>
							</div>
						<div>
							<button type="button" class="btn btn-secondary" onclick="location='/notice'">목록</button>
			      	</div>
	


</main>

</body>
</html>