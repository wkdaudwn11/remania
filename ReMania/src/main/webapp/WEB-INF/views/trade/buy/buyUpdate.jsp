<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		
		var form = document.getElementById("buyUpdateForm");		
		
		//거래방법이 바꼈을 때
		$("#tradeway").on("change",function(){
			let tradeway = form.tradeway;
			if(tradeway.value != '택배'){
				$("#locationSpan").removeClass("displayNone");
			}else{
				$("#locationSpan").addClass("displayNone");
			}
		});//tradeway on change
		
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
							if(upfileContentClickCount == 1) $("#image_preview_content2").addClass("displayNone");
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
	function buyUpdate(form){
		let result = true;
		
		if(form.tradeway.value == "택배"){
			if(form.location.value == "지역선택"){
				alert("지역을 선택해주세요.");
				result = false;
			}
		}
		
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
		
		if(result == true) form.submit();
		
	}
	
</script>

</head>
<body>

	<c:set var="login" value="${sessionScope.login}" scope="request"/>
	<c:set var="buyDTO" value="${buyDTO}" scope="request"/>
	
	<jsp:include page="../../include/nav.jsp" flush="true" />

	<br /><br /><br /><br /><br /><br />
	<center><font size="100"><b>삽니다 수정</b></font></center>

	<div class="container">
		<div class="alert alert-danger">
		
			<form id="buyUpdateForm" name="buyUpdateForm" method="post" action="buyUpdate" enctype="multipart/form-data">
				<input type="hidden" name="email" value="${buyDTO.email}">
				<input type="hidden" name="author" value="${buyDTO.author}">
				<input type="hidden" name="buynum" value="${buyDTO.buynum}">
				<input type="hidden" name="curPage" value="${curPage}">
				<input type="hidden" name="category2" value="${category}">
				<input type="hidden" name="sort" value="${sort}">
				<input type="hidden" name="searchType" value="${searchType}">
				<input type="hidden" name="searchValue" value="${searchValue}">
				<input type="hidden" name="author" value="${searchValue}">
			
				<strong>구&nbsp;&nbsp;매&nbsp;&nbsp;자</strong>&nbsp;&nbsp;
				<font color="black">${buyDTO.author}</font><br /><br />
				
				<strong>상　　품</strong>&nbsp;&nbsp;
				<font color="black">
					<select name="category" style="width: 10em; height: 1.5em;">
						<c:choose>
							<c:when test="${buyDTO.category == '카메라'}">
								<option value="자전거">자전거</option>
								<option value="카메라" selected="selected">카메라</option>
							</c:when>
							<c:otherwise>
								<option value="자전거" selected="selected">자전거</option>
								<option value="카메라">카메라</option>
							</c:otherwise>
						</c:choose>
					</select>
				</font>
				<br /><br />
				
				<strong>거래방법</strong>&nbsp;&nbsp;
				<font color="black">
					<select id="tradeway" name="tradeway" style="width: 10em; height: 1.5em;">
						<c:choose>
							<c:when test="${buyDTO.tradeway == '직거래'}">
								<option value="택배">택배</option>
								<option value="직거래" selected="selected">직거래</option>
								<option value="합의 후 결정">합의 후 결정</option>
							</c:when>
							<c:when test="${buyDTO.tradeway == '합의 후 결정'}">
								<option value="택배">택배</option>
								<option value="직거래">직거래</option>
								<option value="합의 후 결정" selected="selected">합의 후 결정</option>
							</c:when>
							<c:otherwise>
								<option value="택배" selected="selected">택배</option>
								<option value="직거래">직거래</option>
								<option value="합의 후 결정">합의 후 결정</option>
							</c:otherwise>
						</c:choose>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</font>
				
				<!-- 위의 거래방법에서 '택배'를 제외한 나머지 경우를 선택하면 나타나야함. -->
				<c:choose>
					<c:when test="${buyDTO.tradeway == '택배'}">
						<span id="locationSpan" class="displayNone">
					</c:when>
					<c:otherwise>
						<span id="locationSpan">
					</c:otherwise>
				</c:choose>
					<small>
						<strong>지　　역</strong>&nbsp;&nbsp;&nbsp;
						<font color="black">
							<select name="location" style="width: 10em; height: 1.5em;">
								<c:choose>
									<c:when test="${buyDTO.location == '서울'}">
										<option value="지역선택">지역선택</option>
										<option value="서울" selected="selected">서울</option>
										<option value="인천">인천</option>
									</c:when>
									<c:when test="${buyDTO.location == '인천'}">
										<option value="지역선택">지역선택</option>
										<option value="서울">서울</option>
										<option value="인천" selected="selected">인천</option>
									</c:when>
									<c:otherwise>
										<option value="지역선택" selected="selected">지역선택</option>
										<option value="서울">서울</option>
										<option value="인천">인천</option>
									</c:otherwise>
								</c:choose>
							</select>
						</font>
					</small>
				</span>
				<br /><br />
				
				<strong>가　　격</strong>&nbsp;&nbsp;
				<font color="black">
					<select id="pricechoice" name="pricechoice" style="width: 10em; height: 1.5em;">
						<c:choose>
							<c:when test="${buyDTO.pricechoice == '합의 후 결정'}">
								<option value="범위 설정">범위 설정</option>
								<option value="합의 후 결정" selected="selected">합의 후 결정</option>
							</c:when>
							<c:otherwise>
								<option value="범위 설정" selected="selected">범위 설정</option>
								<option value="합의 후 결정">합의 후 결정</option>
							</c:otherwise>
						</c:choose>
					</select>
				</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<c:choose>
					<c:when test="${buyDTO.pricechoice == '합의 후 결정'}">
						<span id="priceSpan" class="displayNone">
					</c:when>
					<c:otherwise>
						<span id="priceSpan">
					</c:otherwise>
				</c:choose>
					<small>
						<strong>범　　위</strong>&nbsp;&nbsp;&nbsp;
						<font color="black">
							<c:choose>
								<c:when test="${buyDTO.pricechoice == '범위 설정'}">
									<input type="text" name="price1" value="${buyDTO.price1}" style="width: 6em;"> ~ 
									<input type="text" name="price2" value="${buyDTO.price2}" style="width: 6em;">원
								</c:when>
								<c:otherwise>
									<input type="text" name="price1" value="0" style="width: 6em;"> ~ 
									<input type="text" name="price2" value="0" style="width: 6em;">원
								</c:otherwise>
							</c:choose>
						</font>
					</small>
				</span>
				<br /><br />
				
				<strong>제　　목</strong>&nbsp;&nbsp;
				<font color="black">
					<input type="text" name="title" value="${buyDTO.title}" style="width: 37.5em;">
				</font>
				<br /><br />
				
				<div>
					<p style="float: left;">
						<strong>대표사진</strong>&nbsp;&nbsp;
					</p>
					<p>
						<input type="file" id="upfile" name="upfile" accept="image/*">
					</p>
					<font size="2" color="black">* 사진 수정을 원하시면 파일을 선택해주세요. <br />
					* 사진을 선택 안하시면, 기존의 사진으로 유지됩니다.</font> <br />
				</div>
				
				<c:choose>
					<c:when test="${!empty buyDTO.image1}">
						<p id="image_preview">
					</c:when>
					<c:otherwise>
						<p id="image_preview" class="displayNone">
					</c:otherwise>
				</c:choose>
					<strong>미리보기</strong>
					<img id="blah" src="buy/${buyDTO.buynum}_${buyDTO.email}/${buyDTO.image1}.jpg" width="100" height="100" />
				</p>
				
				<div>
					<div id="fileDiv">
						<strong>내　　용</strong>&nbsp;&nbsp;
						<input type="file" class="upfileContent" name="upfileContent" accept="image/*" multiple>
					</div> <!-- #fileDiv -->
					
					<div id="contentDiv" style="width: 100%; border: 1px solid black; background-color: white; color: black;">
						<span id='image_preview_content2'>
							<c:if test="${image2List != null}">
								<center>
									<c:forEach var="image2Name" items="${image2List}">
										<img src="buy/${buyDTO.buynum}_${buyDTO.email}/${image2Name}.jpg"
											width="80%" height="400px">
										<br />
									</c:forEach>
								</center>
							</c:if>
						</span>
						<textarea class="content" name="content" rows="20" cols="84" style="border-style: none;">${buyDTO.content}</textarea>
					</div> <!-- #contentDiv -->
				</div>
			</form>
		</div>
		
		<p style="text-align: right;">
			<button type="button" class="btn btn-danger" onclick="buyUpdate(buyUpdateForm)">
				수정하기
			</button>
		</p>
	</div>

	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>