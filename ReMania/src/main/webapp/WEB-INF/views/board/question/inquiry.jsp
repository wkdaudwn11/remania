<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania</title>

<style>

	.alert{font-size: 1.5em;}

</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#inquiryRegister").on("click",function(){
			if($(":text[name='title']").val() == ""){
				alert("제목이 비어 있습니다.");
				$(":text[name='title']").trigger("focus");
			}else if($("textarea").val() == ""){
				alert("내용을 입력 해주세요.");
				$("textarea").trigger("focus");
			}else{
				$("form").submit();
			}
		}); // end $("#register").on("click")
		
	});
	
</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" />

	<br /><br /><br /><br /><br /><br />
	<center><font size="100"><b>1:1 문의</b></font></center>

	<div class="container">
	
		<form action="inquiryRegister" method="post">
			<div class="alert alert-warning">
				<small>
				<strong>분　&nbsp;&nbsp;&nbsp;　류</strong>&nbsp;&nbsp;
				<select name="category" style="height: 2em; font-size: 0.8em;">
					<option value="사기">사기</option> <!-- fraud -->
					<option>??</option>
					<option>???</option>
					<option>????</option>
				</select>
				
				<input type="hidden" name="email" value="${login.email}" />
				<span style="float: right;">
					<strong>작&nbsp;성&nbsp;자</strong>&nbsp;&nbsp;
					<input type="text" name="author" value="${login.name}" readonly style="width: 5em; color:black; border: none; background-color: transparent;">
				</span>
				</small>
				
				<br /><br /> 
				<strong>제　　목</strong>&nbsp;&nbsp;
				<font color="black">
					<input type="text" name="title" style="font-size: 0.8em; width: 47em; outline: none;">
				</font>
				<br /><br />
				
				<strong>내　　용</strong><br />
				<font color="black">
					<textarea rows="20" cols="79" name="content" style="outline: none; resize: none;"></textarea>
				<font color="black">
				
		
			</div>
			
			<p style="text-align: right;">
				<button id="inquiryRegister" type="button" class="btn btn-warning" >
					 <i class="fa">&#xf1d8;</i> 문의등록
				</button>
			</p>
		</form>
		
	</div>

	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>