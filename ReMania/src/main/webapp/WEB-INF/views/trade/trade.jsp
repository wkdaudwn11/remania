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
	<c:set var="buyDTO" value="${buyDTO}" scope="request" />
	
	<jsp:include page="../include/nav.jsp" flush="true" />
	<jsp:include page="../include/trade/buyDetailInclude.jsp" flush="true" />
	<jsp:include page="../include/footer.jsp" flush="true" />
</body>
</html>