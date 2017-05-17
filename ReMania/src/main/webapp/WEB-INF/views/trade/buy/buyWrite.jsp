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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
	});
	
	function buyWrite(buyWriteForm){
		alert('zzz123');
	}
	
	
</script>

</head>
<body>

	<c:set var="login" value="${sessionScope.login}" scope="request"/>
	
	<jsp:include page="../../include/nav.jsp" flush="true" />

	<br /><br /><br /><br /><br /><br />
	<center><font size="100"><b>삽니다 등록</b></font></center>

	<div class="container">
		<div class="alert alert-danger">
			<form name="buyWriteForm" method="post" action="" enctype="multipart/form-data">
			
				<input type="hidden" name="name" value="${login.name}">
			
				<strong>구&nbsp;&nbsp;매&nbsp;&nbsp;자</strong>&nbsp;&nbsp;
				<font color="black">${login.name}</font><br /><br />
				
				<strong>상　　품</strong>&nbsp;&nbsp;
				<font color="black">
					<select name="category" style="width: 10em; height: 1.5em;">
						<option value="자전거" selected="selected">자전거</option>
						<option value="카메라">카메라</option>
					</select>
				</font>
				<br /><br />
				
				<strong>거래방법</strong>&nbsp;&nbsp;
				<font color="black">
					<select name="tradeWay" style="width: 10em; height: 1.5em;">
						<option value="택배" selected="selected">택배</option>
						<option value="직거래">직거래</option>
						<option value="합의 후 결정">합의 후 결정</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</font>
				
				<!-- 위의 거래방법에서 '택배'를 제외한 나머지 경우를 선택하면 나타나야함. -->
				<span>
					<small>
						<strong>지　　역</strong>&nbsp;&nbsp;&nbsp;
						<font color="black">
							<select name="location" style="width: 10em; height: 1.5em;">
								<option value="지역선택" selected="selected">지역서택</option>
								<option>인천</option>
							</select>
						</font>
					</small>
				</span>
				<br /><br />
				
				<strong>가　　격</strong>&nbsp;&nbsp;
				<font color="black">
					<select name="priceChoice" style="width: 10em; height: 1.5em;">
						<option value="합의 후 결정" selected="selected">합의 후 결정</option>
						<option value="범위 설정">범위 설정</option>
					</select>
				</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<!-- 위의 가격에서 '범위 설정'을 선택하면 나타나야함. -->
				<small>
					<strong>범　　위</strong>&nbsp;&nbsp;&nbsp;
					<font color="black">
						<input type="text" name="price1" style="width: 6em;"> ~ 
						<input type="text" name="price2" style="width: 6em;">원
					</font>
				</small>
				<br /><br />
				
				<strong>제　　목</strong>&nbsp;&nbsp;
				<font color="black">
					<input type="text" name="title" style="width: 37.5em;">
				</font>
				<br /><br />
				
				<input type="file" id="upfile" name="upfile" accept="image/*" multiple>
				<small><font color="black">
					* 첫번 째 사진을 대표사진으로 합니다. <br />
					* 사진은 올리셔도 되고, 안올리셔도 됩니다.
				</font></small>
				<br /><br />
				
				<strong>내　　용</strong><br />
				<font color="black">
					<textarea name="content" rows="20" cols="84"></textarea>
				<font color="black">
			
			</form>
		</div>
		
		<p style="text-align: right;">
			<button type="button" class="btn btn-danger" onclick="buyWrite(buyWriteForm)">
				등록하기
			</button>
		</p>
	</div>

	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>