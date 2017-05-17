<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.entity.trade.BuyPageDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#buyWriteBtn").on("click", function(){
			location.replace('buyWrite');
		})
		
	});
</script>

</head>
<body>

	<c:set var="buyPageDTO" value="${buyPageDTO}" scope="request"/> <!-- 페이징 처리에 필요한 data가진 class -->
	<c:set var="buyList" value="${buyPageDTO.buyList}" scope="request"/> <!-- 페이지에 보여줄 리스트 -->
	<c:set var="curPage" value="${buyPageDTO.curPage}" scope="request"/> <!-- 요청된 현재 페이지 -->
	<c:set var="perPage" value="${buyPageDTO.perPage}" scope="request"/> <!-- 페이지 당 보여줄 리스트 수(9) -->
	<c:set var="page" value="${buyPageDTO.page}" scope="request"/> <!-- 표시할 페이지 수 -->
	<c:set var="pageblock" value="${Math.ceil(curPage/page)}" scope="request"/> <!-- 표시할 페이지 블럭수 -->
	<c:set var="totalRecord" value="${buyPageDTO.totalRecord}" scope="request"/> <!-- 전체 게시물 수 -->
	<c:set var="sortName" value="${sortName}" scope="request"/> <!-- 검색분류 -->
	<c:set var="sortValue" value="${sortValue}" scope="request"/> <!-- 검색내용 -->

	<jsp:include page="../../include/nav.jsp" flush="true" />
	
	<br /><br /><br /><br /><br /><br />
	
	<center>
		<font size="100"><b>삽니다</b></font><br /><br />
		<form class="form-inline">
			<div class="form-group">
				<select class="form-control">
					<option selected="selected">제목</option>
					<option>내용</option>
				</select>
			</div>
			<input type="text" class="form-control" size="50"
				placeholder="검색어를 입력하세요.">
			<button type="button" class="btn btn-danger">Search</button>
		</form>
	</center>

	<div class="container">
	
		<form class="form-inline">
			<div class="form-group">
				<select class="form-control">
					<option selected="selected">전체</option>
					<option>자전거</option>
					<option>카메라</option>
				</select>
			</div>
			<div class="form-group">
				<select class="form-control">
					<option selected="selected">기본옵션</option>
					<option>옵션2</option>
					<option>옵션3</option>
				</select>
			</div>
		</form>
		<br />
		
		<div class="row">
			<c:forEach var="buyDTO" items="${buyList}" varStatus="status">
				<a href="buyDetail">
					<div class="col-sm-4">
						<div class="panel panel-danger">
							<div class="panel-heading">${buyDTO.category}</div>
							<div class="panel-body">
								<img src="images/test/sample1.jpg" class="img-responsive"
									style="width: 100%; height: 15em;" alt="Image">
							</div>
							<div class="panel-footer">${buyDTO.title}</div>
						</div>
					</div>
				</a>
				<c:if test="${status.count % 3 == 0}">
					</div>
					<div class="row">
				</c:if>
			</c:forEach>
		</div>
		
		<br />
		
		<!-- 페이징처리 -->
		<c:if test="${pageblock*page <= Math.ceil(totalRecord/perPage)}">
			<c:set var="endPage" value="${pageblock*page}" scope="request"/>
		</c:if>
		<c:if test="${pageblock*page > Math.ceil(totalRecord/perPage)}">
			<c:set var="endPage" value="${Math.ceil(totalRecord/perPage)}" scope="request"/>
		</c:if>
				
		<div id="paging" style="width: 44em; margin: 0 auto;">
			<ul class="pager" style="float: left;">
				<c:if test="${curPage != 1}">
					<li><a href="buyList?curPage=1&category=${category}&sortName=${sortName}&sortValue=${sortValue}">
						처음
					</a></li>
				</c:if>
				<c:if test="${pageblock > 1}">
					<li><a href="buyList?curPage=${Math.round((pageblock*page)-19)}&category=${category}&sortName=${sortName}&sortValue=${sortValue}">
						<
					</a></li>
				</c:if>
			</ul>
			
			<c:if test="${pageblock < 1}">
				<c:set var="pageblock" value="1" scope="request"/> <!-- 표시할 페이지 블럭수 -->
			</c:if>
			
			<ul class="pagination" style="float: left;">
				<c:forEach var="i" begin="${(pageblock*page)-(page-1)}" end="${endPage}" >
					<c:choose>
						<c:when test="${curPage == i}">
							<li class="active"><a>${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="buyList?curPage=${i}&category=${category}&sortName=${sortName}&sortValue=${sortValue}">
								${i}
							</a></li>
							
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
			
			<ul class="pager" style="float: left;">
				<c:if test="${pageblock != Math.ceil((totalRecord/perPage+1)/page)}">
					<li><a href="buyList?curPage=${Math.round((pageblock*page)+1)}&category=${category}&sortName=${sortName}&sortValue=${sortValue}">
						>
					</a></li>
				</c:if>
				
				<c:if test="${curPage != Math.ceil(totalRecord/perPage)}">
					<c:set var="lastPage" value="${Math.ceil(totalRecord/perPage)}" />
					<li><a href="buyList?curPage=${Math.round(Math.ceil(totalRecord/perPage))}&sortName=${sortName}&sortValue=${sortValue}">
						맨끝
					</a></li>
				</c:if>
				
			</ul>
			<br />
			<br />
			<br />
			<br />
		</div>
		<p style="text-align: right;">
			<button type="button" class="btn btn-danger" id="buyWriteBtn">
				삽니다 등록
			</button>
		</p>
		
	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>