<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania Buy</title>

<style>

	.alert{font-size: 1.5em;}
	.displayNone{display: none;}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#image_preview").addClass("displayNone");
		var form = document.getElementById("buyWriteForm");		
		
		//거래방법이 바꼈을 때
		/* $("#tradeway").on("change",function(){
			let tradeway = form.tradeway;
			if(tradeway.value == '택배'){
				$("#locationSpan").removeClass("displayNone");
			}else{
				$("#locationSpan").addClass("displayNone");
			}
		});//tradeway on change */
		
		//가격 결정하는 Select가 바꼈을 때
		$("#pricechoice").on("change",function(){
			let pricechoice = form.pricechoice;
			if(pricechoice.value == '합의 후 결정'){
				$("#priceSpan").addClass("displayNone");
			}else{
				$("#priceSpan").removeClass("displayNone");
			}
		});//tradeway on change
		
		$("#upfile").on("change", function(e) {
			readURL(this, e);
		});//upfile
		
		//대표사진 미리보기
		function readURL(input, e) {
			var file = e.target.files;
			
			$("#image_preview").addClass("displayNone");
			
			if(file.length == 1){
				if(file[0].type.match(/image/g) == null){
		        	alert('이미지 파일만 올릴 수 있습니다.');
		        }else{
					var reader = new FileReader();
	
					reader.onload = function(e) {
						$('#blah').attr('src', e.target.result);
					}
	
					reader.readAsDataURL(input.files[0]);
					
					$("#image_preview").removeClass("displayNone");
		        }
			}else if(file.length > 1){
				alert('image 파일을 한개만 올릴 수 있습니다.');
			}
		}//readURL(input, e)
		
		upfileContentClickCount = 0; // #upfileContent 클릭 횟수를 나타내는 변수
		
		$("#fileDiv").on("change", ".upfileContent", function(e){
			readURLContent(this, e);
		});

		//content에 업로드한 사진 미리보기
		function readURLContent(input, e) {
			var files = e.target.files;
			var fileCheck = true;
			
			$("#image_preview_content").addClass("displayNone");
			
			if(files.length > 0){
				
				//업로드한 파일들의 타입을 검사해서 image가 아니면 fileCheck를 false로 바꿈
				for(var i=0; i<files.length; i++){
					if(files[i].type.match(/image/g) == null){
						fileCheck = false;
						break;
					}
				}
				
				if(fileCheck == true){
					
					upfileContentClickCount++; // 사진을 올렸으면 +1 증가시켜준다.
					
					if(upfileContentClickCount > 1){
						$(".image_preview_content").remove();
					}
					
					$.each(files, function(i, value){
						var reader = new FileReader();
						reader.onload = function(e) {
							$("<span class='image_preview_content'><center><img src="+e.target.result+" width='800'></center><input type='hidden' class='imageName' value='"+value.name+"'></span>").prependTo("#contentDiv");
						}
						reader.readAsDataURL(input.files[i]);
						$("#image_preview_content").removeClass("display");
					});//$.each(files, function(i, value)
							
				}else{
					alert('이미지 파일만 올릴 수 있습니다.');
				}//if(fileCheck == true)
					
			}else{
				$(".image_preview_content").remove();
			}//if(files.length > 0)
				
		}//readURLContent(input, e)
		
	});
	
	//글작성 유효성검사
	function buyWrite(form){
		let result = true;
		
		//if(form.tradeway.value == "택배"){
			if(form.location.value == "지역선택"){
				alert("지역을 선택해주세요.");
				result = false;
			}
		//}
		
		if((form.pricechoice.value == "범위 설정") && (result == true)){
			if(form.price1.value == null || form.price1.value == "" || form.price2.value == null || form.price2.value == ""){
				alert("원하시는 가격 범위를 정해주세요.");
				result = false;
			}
			if((form.price1.value > form.price2.value || form.price1.value == form.price2.value) && (result == true)){
				alert("최대금액은 최소금액보다 큰 금액이어야 합니다.");
				result = false;
			}
		}
		
		if(result == true){
			if(form.title.value == null || form.title.value == ""){
				alert("제목을 입력해주세요.");
				result = false;
			}else if(form.content.value == null || form.content.value == ""){
				alert("내용을 입력해주세요.");
				result = false;
			}
		}
		
		if(result == true){
			if(form.pricechoice.value =='합의 후 결정'){
				form.price1.value = 0;
				form.price2.value = 0;
			}
			form.submit();
		}
		
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
		
			<form id="buyWriteForm" name="buyWriteForm" method="post" action="buyWrite" enctype="multipart/form-data">
				<input type="hidden" name="email" value="${login.email}">
				<input type="hidden" name="author" value="${login.name}">
			
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
					<select id="tradeway" name="tradeway" style="width: 10em; height: 1.5em;">
						<option value="택배" selected="selected">택배</option>
						<option value="직거래">직거래</option>
						<option value="합의 후 결정">합의 후 결정</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</font>
				
				<!-- 위의 거래방법에서 '택배'를 제외한 나머지 경우를 선택하면 나타나야함. -->
				<span id="locationSpan">
					<small>
						<strong>지　　역</strong>&nbsp;&nbsp;&nbsp;
						<font color="black">
							<select name="location" style="width: 10em; height: 1.5em;">
								<option value="지역선택" selected="selected">지역선택</option>
								<option value="서울">서울</option>
								<option value="세종">세종</option>
								<option value="수원">수원</option>
								<option value="인천">인천</option>
								<option value="안양">안양</option>
								<option value="부천">부천</option>
								<option value="대구">대구</option>
								<option value="대전">대전</option>
								<option value="울산">울산</option>
								<option value="부산">부산</option>
								<option value="광주">광주</option>
								<option value="공주">공주</option>
								<option value="제주도">제주도</option>
							</select>
						</font>
					</small>
				</span>
				<br /><br />
				
				<strong>가　　격</strong>&nbsp;&nbsp;
				<font color="black">
					<select id="pricechoice" name="pricechoice" style="width: 10em; height: 1.5em;">
					<option value="범위 설정" selected="selected">범위 설정</option>
						<option value="합의 후 결정">합의 후 결정</option>
					</select>
				</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<!-- 위의 가격에서 '범위 설정'을 선택하면 나타나야함. -->
				<span id="priceSpan">
					<small>
						<strong>범　　위</strong>&nbsp;&nbsp;&nbsp;
						<font color="black">
							<input type="text" name="price1" style="width: 6em;"> ~ 
							<input type="text" name="price2" style="width: 6em;">원
						</font>
					</small>
				</span>
				<br /><br />
				
				<strong>제　　목</strong>&nbsp;&nbsp;
				<font color="black">
					<input type="text" name="title" style="width: 37.5em;">
				</font>
				<br /><br />
				
				<div>
					<p style="float: left;">
						<strong>대표사진</strong>&nbsp;&nbsp;
					</p>
					<p>
						<input type="file" id="upfile" name="upfile" accept="image/*">
					</p>
				</div>
				
				<p id="image_preview">
					<strong>미리보기</strong>
					<img id="blah" src="#" alt="your image" width="100" height="100" />
				</p>
				
				<div>
					<div id="fileDiv">
						<strong>내　　용</strong>&nbsp;&nbsp;
						<input type="file" class="upfileContent" name="upfileContent" accept="image/*" multiple>
					</div> <!-- #fileDiv -->
					
					<div id="contentDiv" style="width: 100%; border: 1px solid black; background-color: white; color: black;">
						<textarea class="content" name="content" rows="20" cols="84" style="border-style: none;"></textarea>
					</div> <!-- #contentDiv -->
				</div>
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