<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	$(document).ready(function() {
		
	});
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
					<font color="#7777ca" size="5">[장명주]</font>
					<font size="4">님의 Mypage 간단 정보입니다.</font>　　
					<a href="pwdCheck">
						<button type="button" class="btn btn-default">회원정보수정</button>
					</a>　　　　　　　　　　　　　　　　　　　　<!-- 공백 건들지 말 것! -->
					<button type="button" class="btn btn-danger">
						회원탈퇴
					</button>
				</div>
				<div class="panel-body">
					<table style="width: 100%; font-size: 1.2em;">
						<tr>
							<c:if test="${sessionScope.login.sns == null}">
								<td width="250"><img src="images/yyy.jpg">&nbsp;회원가입일</td>
							</c:if>
							<td><%-- ${sessionScope.login.joindate} --%>2017-05-12 15:27</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;로그인 한 시간</td>
							<td><%-- ${sessionScope.login.logindate} --%>2017-05-12 15:27</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;거래 횟수</td>
							<td>0건</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;등급</td>
							<td>플래티넘</td>
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
								<a href="sellWriteHistory">0건</a>
							</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;판매중인상품</td>
							<td>
								<a href="sellTrading">0건</a>
							</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;판매종료내역</td>
							<td>
								<a href="sellEndHistory">0건</a>
							</td>
						</tr>
					</table>
				</div> <!-- .panel-body -->
			</div> <!-- .panel panel-primary -->
			<br />
			
			<div class="panel panel-danger">
				<div class="panel-heading">
					<font size="4">구매내역</font>
				</div> <!-- .panel-heading -->
				<div class="panel-body">
					<table style="width: 100%; font-size: 1.2em;">
						<tr>
							<td width="250">
								<img src="images/yyy.jpg">&nbsp;삽니다에 등록한 게시글
							</td>
							<td>
								<a href="buyEndHistory">0건</a>
							</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;구매중인상품</td>
							<td>
								<a href="buyTrading">0건</a>
							</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;구매종료내역</td>
							<td>
								<a href="buyEndHistory">0건</a>
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