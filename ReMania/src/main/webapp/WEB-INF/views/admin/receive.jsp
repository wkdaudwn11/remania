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
					<font size="4"> 회원들의 신고 및 취소 접수 목록입니다.</font>
				</div>
				<div class="panel-body">
					<table style="width: 100%; font-size: 1.2em;">
						<tr>
							<td width="250"><img src="images/yyy.jpg">&nbsp;신고 접수</td>
							<td>0</td>
						</tr>
						<tr>
							<td><img src="images/yyy.jpg">&nbsp;취소 접수</td>
							<td>0</td>
						</tr>
					</table>
				</div> <!-- .panel-body -->
			</div> <!-- .panel panel-default -->
			<br />	
		</div> <!-- .panel-group -->
		
	</div> <!-- .container -->
	<br /><br /><br /><br />
	
	<jsp:include page="../include/footer.jsp" flush="true" />
</body>
</html>