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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>

	<jsp:include page="../include/nav.jsp" flush="true" />

	<div class="container">

		<br /><br /><br /><br /><br /><br />
		<center>
			<font size="100"><b>접수 목록</b></font><br />
			<br />
		</center>

		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<img src="images/zzz.jpg">
					<font color="#7777ca" size="5">관리자님!</font>
					<font size="4"> 회원들의 신고 목록입니다.</font>
				</div>
				<div class="panel-body">
					<table width="100%" cellpadding="0" cellspacing="0" border="0" class="boardList">
						<tr height="30">
							<th width="50">번 호</th>
							<th width="300">내 용</th>
							<th width="100">신고자</th>
							<th width="150">작성일</th>
						</tr>
						<c:forEach var="buyDTO" items="${buyList}" varStatus="i">
							<tr height="30">
								<td width="50" align="center">${i.count}</td>
									<c:choose>
										<c:when test="${!empty buyDTO.image1}">
											<img src="buy/${buyDTO.buynum}_${buyDTO.email}/${buyDTO.image1}.jpg" width="50" height="50">
										</c:when>
										<c:otherwise>
											<img src="images/ImgNotFound.png" width="50" height="50">
										</c:otherwise>
									</c:choose>
								</td>
								<td width="300" align="center">
									<a href="trade?tradenum=${tradenum[i.count-1]}">${buyDTO.title}</a>
								</td>
								<td width="100" align="center">${buyDTO.author}</td>
								<td width="150" align="center">${buyDTO.writeday}</td>
							</tr>
						</c:forEach>
					</table>
					<!-- boardList -->
				</div> <!-- .panel-body -->
			</div> <!-- .panel panel-default -->
			<br />	
		</div> <!-- .panel-group -->
		
	</div> <!-- .container -->
	<br /><br /><br /><br />
	
	<jsp:include page="../include/footer.jsp" flush="true" />
</body>
</html>