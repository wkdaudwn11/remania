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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" />

	<br /><br /><br /><br /><br /><br />
	<center><font size="100"><b>글작성</b></font></center>

	<div class="container">
		<form action="freeBoardWrite" method="post">
			<div class="alert alert-success">
				<strong>작&nbsp;&nbsp;성&nbsp;&nbsp;자</strong>&nbsp;&nbsp;
				<input type="text" name="author" value="장명주" readonly style="color:black; border: none; background-color: transparent;"><br /><br />
				
				<strong>제　　목</strong>&nbsp;&nbsp;
				<font color="black">
					<input type="text" name="title" style="width: 37.5em; outline: none;">
				</font>
				<br /><br />
				
				<!-- <input type="file" class="btn btn-success" >
				<br />
				<small><font color="black">* 첫번 째 사진을 대표사진으로 합니다.</font></small>
				<br /><br /> -->
				
				<strong>내　　용</strong><br />
				<font color="black">
					<textarea rows="20" cols="84" name="content" style="outline: none; resize: none;"></textarea>
				<font color="black">
				
			</div>
			
			<p style="text-align: right;">
				<button type="button" class="btn btn-success">
					등록하기
				</button>
			</p>
		</form>
		
		<!-- <p style="text-align: left; float: left;">
			<button type="button" class="btn btn-success" id="writeBtn">
				수정하기
			</button>
			<button type="button" class="btn btn-success" id="writeBtn">
				삭제하기
			</button>
		</p> -->
	</div>

	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>