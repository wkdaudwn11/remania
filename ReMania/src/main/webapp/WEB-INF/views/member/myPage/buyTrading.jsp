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
.boardList {
	font-size: 1em;
}

.boardList th, .boardList td {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	padding: 14px 0 10px 0;
}

.boardList th {
	background: #f8f8f8;
	text-align: center;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#myPageIndex").on("click", function(){
			location.replace("myPageIndex");
		});
		$("#buyWriteHistory").on("click", function(){
			location.replace("writeHistory?trade=buyer");
		});
		$("#buyEndHistoryBtn").on("click", function(){
			location.replace("endHistory?trade=buyer&process=end");
		});
	});
</script>

</head>
<body>
	<br /><br />
	<jsp:include page="../../include/nav.jsp" flush="true" />

	<div class="container">

		<br /><br /><br /><br /><br /><br />

		<div class="panel-group">
			<div class="panel panel-danger">
				<div class="panel-heading" style="background-color: #d9534f;">
					<font size="5" color="white">${sessionScope.login.name}</font>
					<font size="4" color="white">님의 구매중인 상품입니다.</font>　
				</div>
				<!-- .panel-heading -->
				<div class="panel-body">
					<table width="100%" cellpadding="0" cellspacing="0" border="0" class="boardList">
						<tr height="30">
							<th width="50">번 호</th>
							<th width="100">사 진</th>
							<th width="200">제 목</th>
							<th width="50">판매자</th>
							<th width="50">구매자</th>
							<th width="150">작성일</th>
						</tr>
						<c:forEach var="buyDTO" items="${buyList}" varStatus="i">
							<tr height="30">
								<td width="50" align="center">${i.count}</td>
								<td width="50" align="center">
									<c:choose>
										<c:when test="${!empty buyDTO.image1}">
											<img src="buy/${buyDTO.buynum}_${buyDTO.email}/${buyDTO.image1}.jpg" width="50" height="50">
										</c:when>
										<c:otherwise>
											<img src="images/ImgNotFound.png" width="50" height="50">
										</c:otherwise>
									</c:choose>
								</td>
								<td width="200" align="center">
									<a href="trade?tradenum=${tradenum[i.count-1]}">${buyDTO.title}</a>
								</td>
								<td width="50" align="center">${sellerName[i.count-1]}</td>
								<td width="50" align="center">${buyDTO.author}</td>
								<td width="150" align="center">${buyDTO.writeday}</td>
							</tr>
						</c:forEach>
					</table>
					<!-- boardList -->

				</div>
				<!-- .panel-body -->
			</div>
			<!-- .panel panel-primary -->
		</div>
		<!-- .panel-group -->
		
		<p style="text-align: left; float: left;">
			<button type="button" class="btn btn-danger" id="buyWriteHistory">
				삽니다에 등록한 게시글
			</button>
			<button type="button" class="btn btn-danger" id="buyEndHistoryBtn">
				구매종료내역
			</button>
		</p>

		<p style="text-align: right;">
			<button type="button" class="btn btn-danger" id="myPageIndex">
				마이페이지로 돌아가기
			</button>
		</p>

	</div>
	<!-- .container -->
	<br /><br /><br /><br /><br /><br />
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>