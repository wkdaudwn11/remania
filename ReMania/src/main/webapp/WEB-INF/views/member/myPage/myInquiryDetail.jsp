<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania</title>

<style>

	.alert{font-size: 1.5em;}
	
	.boardList {font-size:1em;}
	.boardList th, .boardList td {border-top:1px solid #ddd; border-bottom:1px solid #ddd; padding:14px 0 10px 0;}
	.boardList th {background:#f8f8f8; text-align:center;}
	
	#reple{background-color: #FFFFFF;}
	#repleWriteFormleft{float: left;}
	
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script type="text/javascript">
	"use strict"
	
</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" />

	<br /><br /><br /><br /><br /><br />
	<center>
		<font size="100"><i class="fa">&#xf0e6;</i>  <b>문의 내역</b></font><br /><br />
	</center>
	
	<div class="container">
		<div class="alert alert-warning" style="background-color: #fbd14e;">
			<input type="hidden" name="ref" value="${Question.registernum}" />
			<input type="hidden" name="email" value="${Question.email}"/>
			
			<small>
			<strong>분　&nbsp;&nbsp;&nbsp;　류</strong>&nbsp;&nbsp;
			<input type="text" name="category" value="${Question.category}" style="border: none; background-color: #fbd14e; outline: none;" readonly/>
			
			<span style="float: right;">
				<strong>작&nbsp;성&nbsp;자</strong>&nbsp;&nbsp;
				<input type="text" value="${Question.author}" readonly style="width: 5em; color:black; border: none; background-color: transparent;">
			</span>
			</small>
			
			<br /><br /> 
			<strong>제　　목</strong>&nbsp;&nbsp;
			<font color="black">
				<input type="text" name="title" value="${Question.title}" style="border: none; background-color: #fbd14e; font-size: 0.8em; outline: none;" readonly>
			</font>
			<br /><br />
			
			<strong>내　　용</strong><br />
			<font color="black">
				<textarea cols="79" style="outline: none; resize: none;" readonly>${Question.content}</textarea>
				<div style="height: 1em;"></div>
			<font color="black">
			
		</div>
	</div>
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>