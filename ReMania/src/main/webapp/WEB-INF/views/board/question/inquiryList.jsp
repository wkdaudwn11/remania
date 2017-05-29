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
	.boardList th {background: #fbd14e; text-align:center;}
	/* #fcf8e3 #fbd14e */
</style>

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
		<font size="100"><i class="fa">&#xf0e6;</i>  <b>문의게시판</b></font><br /><br />
	</center>
		
	<div class="container">
	
		<c:set var="totalRecord" value="${InquiryPage.totalRecord}" scope="page"/>
		<c:set var="INDICATEPAGE" value="${InquiryPage.INDICATEPAGE}" scope="page"/>
		<c:set var="PERPAGE" value="${InquiryPage.PERPAGE}" scope="page"/>
		<c:set var="curPage" value="${InquiryPage.curPage}" scope="page" />
		<fmt:formatNumber var="totalPage" minIntegerDigits="1" value="${Math.ceil(totalRecord/PERPAGE)}"/>
		<fmt:formatNumber var="pageBlock" minIntegerDigits="1" value="${Math.ceil(curPage/INDICATEPAGE)}"/>
		<fmt:formatNumber var="endPageBlock" minIntegerDigits="1" value="${Math.ceil(totalPage/INDICATEPAGE)}"/>
		<c:if test="${pageBlock*INDICATEPAGE > totalPage}">
			<c:set var="endPage" value="${totalPage}"/>
		</c:if>
		<c:if test="${pageBlock*INDICATEPAGE <= totalPage}">
			<c:set var="endPage" value="${pageBlock*INDICATEPAGE}"/>
		</c:if>
		
		<c:set var="search" value="freeBoardList?type=${FreeBoardPage.type}&value=${FreeBoardPage.value}"/>
		
		<p>글목록(처리 대기 중인 글: ${totalRecord})</p>
		<!-- 게시판 리스트 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="boardList">
			<tr height="30"> 
				<th width="50">번 호</th> 
				<th width="50">분  류</th>
				<th width="250">제   목</th> 
			    <th width="100">작성자</th>
			    <th width="150">작성일</th> 
			    <th width="50">상   태</th>
			</tr>
			<c:forEach var="question" items="${InquiryPage.inquiryList}" varStatus="status">
				<tr height="30">
					<td  width="50" align="center" >${totalRecord-status.index}</td>
				    <td  width="50" align="center" >${question.category}</td>
				    <td  width="250" align="center">
				    	<a href="questionDetail?registernum=${question.registernum}&curPage=${curPage}">${question.title}</a>
				    </td>
					<td width="100" align="center">${question.author}</td>			    
				    <td width="150" align="center">${question.writeday}</td>
				    <td width="50" align="center">${question.state}</td>
				</tr>
			</c:forEach>
		</table> <!-- boardList -->
		
		
		<div id="paging" style="width: 44em; margin: 0 auto;">
			<ul class="pager" style="float: left;"> <!-- style="float: left;" -->
				<c:if test="${curPage != 1}">
					<li><a href="questionList">처음</a></li> <!-- type=${FreeBoardPage.type}&value=${FreeBoardPage.value} -->
				</c:if>
				<c:if test="${pageBlock != 1}">
					<li><a href="questionList?curPage=${(pageBlock-1)*INDICATEPAGE}"><</a></li> <!-- type=${FreeBoardPage.type}&value=${FreeBoardPage.value} -->
				</c:if>
			</ul>
			<ul class="pagination" style="float: left;"> <!-- style="float: left;" -->
			<c:forEach var="pageIndex" begin="${(pageBlock*INDICATEPAGE)-(INDICATEPAGE-1)}" end="${endPage}">
				<c:if test="${curPage == pageIndex}">
					<li class="active"><a>${pageIndex}</a></li>
				</c:if>
				<c:if test="${curPage != pageIndex}">
					<li><a href="questionList?curPage=${pageIndex}">${pageIndex}</a></li> 
				</c:if>
			</c:forEach>
			</ul>
			<ul class="pager" style="float: left;"> <!-- style="float: left;" -->
				<c:if test="${pageBlock < endPageBlock}"> <!-- != -->
					<li><a href="questionList?curPage=${(pageBlock+1)*INDICATEPAGE}">></a></li>
				</c:if>
				<c:if test="${curPage < totalPage}"> <!-- != -->
					<li><a href="questionList?curPage=${totalPage}">맨끝</a></li> 
				</c:if>
			</ul>
			<br />
			<br />
			<br />
			<br />
		</div>

	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>