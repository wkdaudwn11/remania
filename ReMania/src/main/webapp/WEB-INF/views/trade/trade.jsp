<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>remaina</title>
<style>
	.alert {font-size: 1.5em;}
	
	.boardList {font-size: 1em;}
	.boardList th, .boardList td {border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; padding: 14px 0 10px 0;}
	.boardList th {background: #f8f8f8; text-align: center;}
	
	#reple {background-color: #FFFFFF;}
	#repleWriteFormleft {float: left;}
	
	#bedRoomDetailWrap {width: 80%;height: auto; margin: 0 auto;}
	#bedRoomDetailVisual {width: 100%; height: 20em;}
	#bedRoomDetailVisualleft {width: 50%; height: 100%; float: left;}
	#bedRoomDetailVisualRight {height: 100%;}
	#bedRoomDetailContent {width: 70%; height: auto; margin: 0 auto;}
	
	.visualRightTable {margin: 0 auto; text-align: left;}
	.visualRightTable .productName {color: gray; font-size: 15px; font: bold;}
	.visualRightTable .productPrice {color: #5b6bdf; font-size: 15px; font: bold;}
	.visualRightTable .productPrice2 {color: red; font-size: 15px; font: bold;}
	.visualRightTable .productPrice3 { color: #3f4993; font-size: 15px; font: bold;}
</style>
</head>
<body>

	<c:set var="login" value="${login}" scope="session" />
	<c:set var="buyer" value="${buyer}" scope="request" />
	<c:set var="seller" value="${seller}" scope="request" />
	
	<jsp:include page="../include/nav.jsp" flush="true" />
	<jsp:include page="../include/trade/buyDetailInclude.jsp" flush="true" />
	
	<hr />
	
	<div class="container">
		<!-- 구매자 -->
		<div class="panel panel-danger" style="width: 50%; float: left;">
			<div class="panel-heading" style="background-color: #d9534f;">
				<h5 style="color: white;">
					구매자
					<c:if test="${login.name == buyer.name}">(나)</c:if>
					<c:if test="${login.name != buyer.name}">(상대방)</c:if>
				</h5>
			</div>
			<div class="panel-body">
				<div style="background-color:#d9534f; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px; text-align: center; color: white;">이름</span>
					<input type="text" readonly value="${buyer.name}"
						style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"/>
				</div>	
			</div>
			<div class="panel-body">
				<div style="background-color:#d9534f; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px; text-align: center; color: white;">연락처</span>
					<input type="text" readonly value="${buyer.tel}"
						style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"/>
				</div>	
			</div>
			<div class="panel-body">
				<div style="background-color:#d9534f; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px; text-align: center; color: white;">주소</span>
					<input type="text" readonly value="${buyer.addr1}"
						style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"/>
				</div>	
			</div>
		</div><!-- .panel panel-danger --> <!-- a -->
		
		<!-- 판매자 -->
		<div class="panel panel-primary" style="width: 50%; float: left;">
			<div class="panel-heading">
				<h5>
					판매자
					<c:if test="${login.email == seller.email}">(나)</c:if>
					<c:if test="${login.email != seller.email}">(상대방)</c:if>
				</h5>
			</div>
			<div class="panel-body">
				<div style="background-color:#337ab7; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px; text-align: center; color: white;">이름</span>
					<input type="text" readonly value="${seller.name}"
						style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"/>
				</div>	
			</div>
			<div class="panel-body">
				<div style="background-color:#337ab7; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px; text-align: center; color: white;">연락처</span>
					<input type="text" readonly value="${seller.tel}"
						style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"/>
				</div>	
			</div>
			<div class="panel-body">
				<div style="background-color:#337ab7; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px; text-align: center; color: white;">주소</span>
					<input type="text" readonly value="${seller.addr1}"
						style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"/>
				</div>	
			</div>
		</div><!-- .panel panel-danger -->
		
		<div style="text-align: center;">
			<c:choose>
				<c:when test="${login.email == seller.email}">
					<button type="button" class="btn btn-primary" 
						style="width: 30em; border-radius: 3em;">
						인계 완료
					</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-danger"
						style="width: 30em; border-radius: 3em; background-color: #d9534f;">
						인수 완료
					</button>
				</c:otherwise>
			</c:choose>
		</div>
		
	</div>
	
	<jsp:include page="../include/footer.jsp" flush="true" />
	
</body>
</html>