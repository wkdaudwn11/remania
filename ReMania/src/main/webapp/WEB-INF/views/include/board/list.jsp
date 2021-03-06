<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
	.boardList {font-size:1em;}
	.boardList th, .boardList td {border-top:1px solid #ddd; border-bottom:1px solid #ddd; padding:14px 0 10px 0;}
	.boardList th {background:#dff0d8; text-align:center;}
</style>
		<c:set var="totalRecord" value="${FreeBoardPage.totalRecord}" scope="page"/>
		<c:set var="INDICATEPAGE" value="${FreeBoardPage.INDICATEPAGE}" scope="page"/>
		<c:set var="PERPAGE" value="${FreeBoardPage.PERPAGE}" scope="page"/>
		<c:set var="curPage" value="${FreeBoardPage.curPage}" scope="page" />
		<fmt:formatNumber var="totalPage" minIntegerDigits="1" value="${Math.ceil(totalRecord/PERPAGE)}"/>
		<fmt:formatNumber var="pageBlock" minIntegerDigits="1" value="${Math.ceil(curPage/INDICATEPAGE)}"/>
		<fmt:formatNumber var="endPageBlock" minIntegerDigits="1" value="${Math.ceil(totalPage/INDICATEPAGE)}"/>
		<c:if test="${pageBlock*INDICATEPAGE > totalPage}">
			<c:set var="endPage" value="${totalPage}"/>
		</c:if>
		<c:if test="${pageBlock*INDICATEPAGE <= totalPage}">
			<c:set var="endPage" value="${pageBlock*INDICATEPAGE}"/>
		</c:if>
		
		<c:set var="search" value="type=${FreeBoardPage.type}&value=${FreeBoardPage.value}"/>
		
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
			<c:forEach var="freeboard" items="${FreeBoardPage.boardList}" varStatus="status">
				<tr height="30">
					<td  width="50" align="center" >${totalRecord-(status.index+(curPage-1)*INDICATEPAGE)}</td> <!-- ${totalRecord-status.index} -->
				    <td  width="250" align="center">
				    	<c:if test="${board.freeboardnum != freeboard.freeboardnum}">
				    		<a href="freeBoardDetail?freeboardnum=${freeboard.freeboardnum}&curPage=${curPage}&${search}">${freeboard.title}</a>
				    	</c:if>
				    	<c:if test="${board.freeboardnum == freeboard.freeboardnum}">
				    		${freeboard.title}
				    	</c:if>
				    </td>
					<td width="100" align="center">${freeboard.author}</td>			    
				    <td width="150" align="center">${freeboard.writeday}</td>
				    <td width="50" align="center">${freeboard.readcnt}</td>
				</tr>
			</c:forEach>
		</table> <!-- boardList -->
		
		
		<div id="paging" style="width: 44em; margin: 0 auto;">
			<ul class="pager" style="float: left;"> <!-- style="float: left;" -->
				<c:if test="${pageBlock == 1}"><a style="visibility: hidden;"/></c:if>
				<%-- <c:if test="${curPage != 1}"> --%>
					<li><a href="freeBoardList?${search}" style="<c:if test='${curPage == 1}'>visibility: hidden;</c:if>">처음</a></li> <!-- type=${FreeBoardPage.type}&value=${FreeBoardPage.value} -->
				<%-- </c:if> --%>
				<c:if test="${pageBlock != 1}">
					<li><a href="freeBoardList?curPage=${((pageBlock-1)*INDICATEPAGE)-(INDICATEPAGE-1)}&${search}"><</a></li> <!-- type=${FreeBoardPage.type}&value=${FreeBoardPage.value} -->
				</c:if>
			</ul>
			<ul class="pagination" style="float: left;"> <!-- style="float: left;" -->
			<c:forEach var="pageIndex" begin="${(pageBlock*INDICATEPAGE)-(INDICATEPAGE-1)}" end="${endPage}">
				<c:if test="${curPage == pageIndex}">
					<li class="active"><a>${pageIndex}</a></li>
				</c:if>
				<c:if test="${curPage != pageIndex}">
					<li><a href="freeBoardList?curPage=${pageIndex}&${search}">${pageIndex}</a></li> <!-- type=${FreeBoardPage.type}&value=${FreeBoardPage.value} -->
				</c:if>
			</c:forEach>
			</ul>
			<ul class="pager" style="float: left;"> <!-- style="float: left;" -->
				<c:if test="${pageBlock < endPageBlock}"> <!-- != -->
					<li><a href="freeBoardList?curPage=${endPage+1}&${search}">></a></li> <!-- type=${FreeBoardPage.type}&value=${FreeBoardPage.value} -->
				</c:if>
				<c:if test="${curPage < totalPage}"> <!-- != -->
					<li><a href="freeBoardList?curPage=${totalPage}&${search}">맨끝</a></li> <!-- type=${FreeBoardPage.type}&value=${FreeBoardPage.value} -->
				</c:if>
			</ul>
			<br />
			<br />
			<br />
			<br />
		</div>
