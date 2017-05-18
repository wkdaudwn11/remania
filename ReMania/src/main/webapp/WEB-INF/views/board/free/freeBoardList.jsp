<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania</title>

<style>
	
	.boardList {font-size:1em;}
	.boardList th, .boardList td {border-top:1px solid #ddd; border-bottom:1px solid #ddd; padding:14px 0 10px 0;}
	.boardList th {background:#f8f8f8; text-align:center;}
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

</script>

</head>
<body>
	<c:set var="totalRecord" value="${FreeBoardPage.totalRecord}" scope="page"/>
	<c:set var="INDICATEPAGE" value="${FreeBoardPage.INDICATEPAGE}" scope="page"/>
	<c:set var="PERPAGE" value="${FreeBoardPage.PERPAGE}" scope="page"/>
	<c:set var="curPage" value="${FreeBoardPage.curPage}" scope="page" />
	<fmt:formatNumber var="totalPage" minIntegerDigits="1" value="${Math.ceil(totalRecord/PERPAGE)}"/>
	<fmt:formatNumber var="pageBlock" minIntegerDigits="1" value="${Math.ceil(curPage/INDICATEPAGE)}"/>
	<c:if test="${pageBlock*INDICATEPAGE > totalPage}">
		<c:set var="endPage" value="${totalPage}"/>
	</c:if>
	<c:if test="${pageBlock*INDICATEPAGE <= totalPage}">
		<c:set var="endPage" value="${pageBlock*INDICATEPAGE}"/>
	</c:if>
	
	<jsp:include page="../../include/nav.jsp" flush="true" />
	
	<br /><br /><br /><br /><br /><br />
	<center>
		<font size="100"><b>자유게시판</b></font><br /><br />
		<form class="form-inline">
			<div class="form-group">
				<select class="form-control">
					<option selected="selected">제목</option>
					<option>내용</option>
				</select>
			</div>
			<input type="text" class="form-control" size="50"
				placeholder="검색어를 입력하세요.">
			<button type="button" class="btn btn-success">Search</button>
		</form>
	</center>
		
	<div class="container">
	
		<p>글목록(전체 글: ${FreeBoardPage.totalRecord})</p>
		<!-- 게시판 리스트 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="boardList">
			<tr height="30"> 
				<th width="50">번 호</th> 
				<th width="250">제   목</th> 
			    <th width="100">작성자</th>
			    <th width="150">작성일</th> 
			    <th width="50">조 회</th>
			</tr>
			<c:forEach var="board" items="${FreeBoardPage.boardList}" varStatus="status">
				<tr height="30">
					<td  width="50" align="center" >${totalRecord-status.index}</td>
				    <td  width="250" align="center">
				    	<a href="freeBoardDetail">${board.title}</a>
				    </td>
					<td width="100" align="center">${board.author}</td>			    
				    <td width="150" align="center">${board.writeday}</td>
				    <td width="50" align="center">${board.readcnt}</td>
				</tr>
			</c:forEach>
		</table> <!-- boardList -->
	
		<div id="paging" style="width: 44em; margin: 0 auto;">
			<ul class="pager" style="float: left;">
				<li><a href="freeBoardList">처음</a></li>
				<li><a href="freeBoardList?curPage=${(pageBlock-1)*INDICATEPAGE}"><</a></li>
			</ul>
			<ul class="pagination" style="float: left;">
			<c:forEach var="pageIndex" begin="${(pageBlock*INDICATEPAGE)-(INDICATEPAGE-1)}" end="${endPage}">
				<li <c:if test="${curPage == pageIndex}">class="active"</c:if>><a href="/freeBoardList?curPage=${pageIndex}">${pageIndex}</a></li>
			</c:forEach>
			</ul>
			<ul class="pager" style="float: left;">
				<li><a href="freeBoardList?curPage=${(pageBlock+1)*INDICATEPAGE}">></a></li>
				<li><a href="freeBoardList?curPage=${totalPage}">맨끝</a></li>
			</ul>
			<br />
			<br />
			<br />
			<br />
		</div>
		<p style="text-align: right;">
			<button type="button" class="btn btn-success" onclick="location.href='freeWrite'">
				글작성
			</button>
		</p>
	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>