<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania Buy</title>

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
	<jsp:include page="../include/nav.jsp" flush="true" />

	<br /><br /><br /><br /><br /><br />
	<center><font size="100"><b>삽니다 등록</b></font></center>

	<div class="container">
		<div class="alert alert-danger">
			<strong>구&nbsp;&nbsp;매&nbsp;&nbsp;자</strong>&nbsp;&nbsp;
			<font color="black">장명주</font><br /><br />
			
			<strong>상　　품</strong>&nbsp;&nbsp;
			<font color="black">
				<select style="width: 10em; height: 1.5em;">
					<option selected="selected">자전거</option>
					<option>카메라</option>
				</select>
			</font>
			<br /><br />
			
			<strong>거래방법</strong>&nbsp;&nbsp;
			<font color="black">
				<select style="width: 10em; height: 1.5em;">
					<option selected="selected">택배</option>
					<option>직거래</option>
					<option>합의 후 결정</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</font>
			
			<!-- 위의 거래방법에서 '택배'를 제외한 나머지 경우를 선택하면 나타나야함. -->
			<small>
				<strong>지　　역</strong>&nbsp;&nbsp;&nbsp;
				<font color="black">
					<select style="width: 10em; height: 1.5em;">
						<option selected="selected">서울</option>
						<option>인천</option>
					</select>
				</font>
			</small>
			<br /><br />
			
			<strong>가　　격</strong>&nbsp;&nbsp;
			<font color="black">
				<select style="width: 10em; height: 1.5em;">
					<option selected="selected">합의 후 결정</option>
					<option>범위 설정</option>
				</select>
			</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<!-- 위의 가격에서 '범위 설정'을 선택하면 나타나야함. -->
			<small>
				<strong>범　　위</strong>&nbsp;&nbsp;&nbsp;
				<font color="black">
					<input type="text" name="title" style="width: 6em;"> ~ 
					<input type="text" name="title" style="width: 6em;">원
				</font>
			</small>
			<br /><br />
			
			<strong>제　　목</strong>&nbsp;&nbsp;
			<font color="black">
				<input type="text" name="title" style="width: 37.5em;">
			</font>
			<br /><br />
			
			<button type="button" class="btn btn-danger">사　　진</button>&nbsp;&nbsp;&nbsp;
			<br />
			<small><font color="black">* 첫번 째 사진을 대표사진으로 합니다.</font></small>
			<br /><br />
			
			<strong>내　　용</strong><br />
			<font color="black">
				<textarea rows="20" cols="84"></textarea>
			<font color="black">
			
		</div>
		
		<p style="text-align: left; float: left;">
			<button type="button" class="btn btn-danger" id="writeBtn">
				수정하기
			</button>
			<button type="button" class="btn btn-danger" id="writeBtn">
				삭제하기
			</button>
		</p>
		
		<p style="text-align: right;">
			<button type="button" class="btn btn-danger" id="writeBtn">
				등록하기
			</button>
		</p>
	</div>

	<jsp:include page="../include/footer.jsp" flush="true" />
</body>
</html>