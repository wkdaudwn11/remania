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
	<jsp:include page="../../include/nav.jsp" flush="true" />
	<form id="hiddenForm2" method="post" action="trade">
		<input type="hidden" name="category" value="buy">
		<input type="hidden" name="categorynum">
		<input type="hidden" name="buyer">
		<input type="hidden" name="seller" value="${login.email}">
	</form>
	<jsp:include page="../../include/trade/buyListInclude.jsp" flush="true" />
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>