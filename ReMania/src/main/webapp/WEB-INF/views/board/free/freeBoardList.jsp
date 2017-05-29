<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania</title>

<style></style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		if(${deleteBoard != null }){
			alert('${deleteBoard}');
		}
		
		$("#search").on("click",function(){
			var type = $("[name='type']").val();
			var value = $("[name='value']").val().trim();
			location.href="freeBoardList?type="+type+"&value="+value+"&curPage=${FreeBoardPage.curPage}";//
		});// end $("#search").on("click");
	});// end $.ready();

</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" />
	
	<br /><br /><br /><br /><br /><br />
	<center>
		<font size="100"><b>자유게시판</b></font><br /><br />
		<form class="form-inline">
			<div class="form-group">
				<select class="form-control" name="type">
					<option value="title" <c:if test="${FreeBoardPage.type eq 'title'}">selected</c:if>>제목</option>
					<option value="content" <c:if test="${FreeBoardPage.type eq 'content'}">selected</c:if>>내용</option>
				</select>
			</div>
			<input type="text" name="value" class="form-control" size="50" value="${FreeBoardPage.value}"
				placeholder="검색어를 입력하세요.">
			<button id="search" type="button" class="btn btn-success"><span class="glyphicon">&#xe003;</span>  Search</button>
		</form>
	</center>
		
	<div class="container">
	
		<jsp:include page="../../include/board/list.jsp" flush="true">
			<jsp:param name="FreeBoardPage" value="${FreeBoardPage}"/>
		</jsp:include>

		<p style="text-align: right;">
			<button type="button" class="btn btn-success" onclick="location.href='freeWrite';">
				 <i class="fa">&#xf040;</i> 작성하기  
			</button>
		</p>
	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>