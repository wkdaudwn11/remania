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
</head>
<body>
	<c:set var="buyPageDTO" value="${buyPageDTO}" scope="request"/> <!-- 페이징 처리에 필요한 data가진 class -->
	<c:set var="category" value="${category}" scope="request"/> 
	<c:set var="sort" value="${sort}" scope="request"/> 
	<c:set var="searchType" value="${searchType}" scope="request"/> <!-- 검색분류 -->
	<c:set var="searchValue" value="${searchValue}" scope="request"/> <!-- 검색내용 -->

	<jsp:include page="../../include/nav.jsp" flush="true" />
	<jsp:include page="buyListInclude.jsp" flush="true" />
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>