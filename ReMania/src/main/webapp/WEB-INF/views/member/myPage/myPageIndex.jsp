<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	$(document).ready(function(){
		
		$("#writeBtn").on("click", function(){
			location.replace('freeBoardWrite');
		})
		
	});

</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" />
	
	
	
	<div class="container">
	
		<br /><br />
		<center>
			<font size="100"><b>마이페이지</b></font><br /><br />
		</center>
		
	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>