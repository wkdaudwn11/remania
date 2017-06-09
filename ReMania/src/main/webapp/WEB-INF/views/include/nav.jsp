
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../../fonts.googleapis.com/css-family=Lato.html" rel="stylesheet" type="text/css">
<link href="../../fonts.googleapis.com/css-family=Montserrat.html" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<link href="css/style.css" rel="stylesheet" type="text/css" />
<!-- 페이스북 -->
<jsp:include page="sns/facebook.jsp" flush="true"></jsp:include>


<script>
	function logout(){
		var sns = '${sessionScope.login.sns}';
		if(sns == 'facebook'){
			logoutFB();
		}
		location.replace("logout");
	}
</script>

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home">
				<span style="color: white; font: bold;">중고</span>매니아
			</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="home">Home</a></li>
				
				<c:choose>
					<c:when test="${empty login}">
						<li><a href="login">Sign in</a></li>
						<li><a href="join">Sign up</a></li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">
								Find<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="findIdUI">Find ID</a></li>
								<li><a href="findPwdForEmailUI">Find Password</a></li>
							</ul>
						</li>
					</c:when>
					<c:when test="${!empty login}">
						<li><a href="javascript:logout()">Logout</a></li>
						<c:if test="${login.email != 'admin'}">
							<li><a href="myPageIndex">Mypage</a></li>
						</c:if>
						<c:if test="${login.email == 'admin'}">
							<li><a href="receive">Receive</a></li>
						</c:if>
					</c:when>
				</c:choose>
				
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						Board<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="freeBoardList">Free</a></li>
						<li><a href="questionList">Question</a></li>
					</ul>
				</li>
				<li><a href="buyList">Buy</a></li>
				<li><a href="sellList">Sell</a></li>
			</ul>
		</div>
	</div>
</nav>