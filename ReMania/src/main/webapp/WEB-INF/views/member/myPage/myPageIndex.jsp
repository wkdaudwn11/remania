<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania</title>

<style>
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	
	function pwdcheck2(){
		
	}

</script>

</head>
<body>

	<jsp:include page="../../include/nav.jsp" flush="true" />

	<div class="container">

		<br />
		<br />
		<center>
			<font size="100"><b>마이페이지</b></font><br />
			<br />
		</center>

		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<img src="images/zzz.jpg">
					<font color="#7777ca" size="5">${login.name}</font>
					<font size="4">님의 Mypage 간단 정보입니다.</font>
						<c:if test="${login.sns == 'remania' || login.sns == '1'}">
							<a href="pwdCheck">
								<button type="button" class="btn btn-default">회원정보수정</button>
							</a>　　　　　　　　　　　　　　　　　　　　<!-- 공백 건들지 말 것! -->
						</c:if>
						<c:if test="${login.sns != 'remania' && login.sns != '1'}">
							<a href="updateMemberUI">
								<button type="button" class="btn btn-default">회원정보수정</button>
							</a>　　　　　　　　　　　　　　　　　　　　<!-- 공백 건들지 말 것! -->
						</c:if>
					<button type="button" onclick="pwdcheck2" class="btn btn-danger">
						회원탈퇴
					</button>
				</div>
				<div class="panel-body">
					<table style="width: 100%; font-size: 1.2em;">
						<tr>
							<c:choose>
								<c:when test="${login.sns == 'remania'}">
									<td width="250"><img src="images/yyy.jpg">&nbsp;회원가입일</td>
								</c:when>
								<c:otherwise>
									<td width="250"><img src="images/yyy.jpg">&nbsp;최초로그인</td>
								</c:otherwise>
							</c:choose>
							<td>${login.joindate}</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;로그인 한 시간</td>
							<td>${login.logindate}</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;거래 횟수</td>
							<td>${mypageDTO.buyend}건</td> <!-- 원래 팝니다+삽니다 해야하는데 시간상 팝니다를 구현안했으므로 삽니다만.. -->
						</tr>
						
					</table>

				</div> <!-- .panel-body -->
			</div> <!-- .panel panel-default -->
			<br />
			
			<div class="panel panel-primary">
				<div class="panel-heading">
					<font size="4">판매내역</font>
				</div> <!-- .panel-heading -->
				<div class="panel-body">
					<table style="width: 100%; font-size: 1.2em;">
						<tr>
							<td width="250"><img src="images/yyy.jpg">&nbsp;팝니다에 등록한 게시글</td>
							<td>
								<a href="writeHistory?trade=seller">${mypageDTO.sellwrite}건</a>
							</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;판매중인상품</td>
							<td>
								<a href="trading?trade=seller&process=trading">${mypageDTO.selltrading}건</a>
							</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;판매종료내역</td>
							<td>
								<a href="endHistory?trade=seller&process=end">${mypageDTO.sellend}건</a>
							</td>
						</tr>
					</table>
				</div> <!-- .panel-body -->
			</div> <!-- .panel panel-primary -->
			<br />
			
			<div class="panel panel-danger">
				<div class="panel-heading" style="background-color: #d9534f;">
					<font size="4" color="white">구매내역</font>
				</div> <!-- .panel-heading -->
				<div class="panel-body">
					<table style="width: 100%; font-size: 1.2em;">
						<tr>
							<td width="250">
								<img src="images/yyy.jpg">&nbsp;삽니다에 등록한 게시글
							</td>
							<td>
								<a href="writeHistory?trade=buyer">${mypageDTO.buywrite}건</a>
							</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;구매중인상품</td>
							<td>
								<a href="trading?trade=buyer&process=trading">${mypageDTO.buytrading}건</a>
							</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;구매종료내역</td>
							<td>
								<a href="endHistory?trade=buyer&process=end">${mypageDTO.buyend}건</a>
							</td>
						</tr>
					</table>
				</div> <!-- .panel-body -->
			</div> <!-- .panel panel-danger -->
		
		</div> <!-- .panel-group -->
		
	</div> <!-- .container -->

	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>