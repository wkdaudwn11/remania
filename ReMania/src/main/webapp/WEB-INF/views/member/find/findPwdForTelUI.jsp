<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania Find Password</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	function find(){
		location.replace('findPwdForEmailUI');
	}

	function check(form) {
		
		var name = form.name.value;
		var tel = form.tel.value;
		
		if(tel.length < 9 || tel.length > 11){
			alert("연락처는 9~11자리로 입력하셔야 합니다.");
			
		}else if(!tel.match(/[0-9].*[0-9]/)){
			alert("연락처는 숫자만 입력가능합니다.");
		}else{
			$.ajax({
				type:"post",
				url:"randomNumberAjax",
				dataType:"text",
				data:{
					usertel : tel
				},
				success:function(responseData,status,xhr){
					alert('인증번호가 발송되었습니다.');	
					$("confirm").focus();
					form.randomNumber.value = responseData;
				},//success
				error:function(error){
					alert('인증번호 불러오기 실패!');
				}//휴대폰 인증 error
			});//휴대폰 인증 ajax
			$(document).ready(function(){
				$("#confirm").css("display","");
				$("#checkNumber").css("display","none");
				$("#sign").css("display","");
			});
		}//else end	
	}//check End
		
	function check2(form){
		var confirm2 = form.confirm2;
		var randomNumber = form.randomNumber.value;
		if(confirm2.value == randomNumber){
			form.submit();
		}else{
			alert("인증번호가 일치하지 않습니다.");
			document.getElementById("confirm2").value="";
			document.getElementById("confirm2").focus();
		}
	}//check2(form)

</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" />
	
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<div class="carousel-caption1zz" style="height:44.3em; text-align: center; color: #FFFFFF; background-image: url('images/test/sample5.jpg');">
				<br /><br /><br /><br />
				
				<span style="color:#C5C5C5; font-size: 5em;">비밀번호 찾기</span>
				<p style="color:#C5C5C5; font-size: 1em;">
					<font color="white">비밀번호</font>를 찾기 위해선 <br />
					<font color="white">핸드폰</font> 인증을 해주셔야 합니다!<br />
				</p>
				<br /><br />
				
				<button type="button" class="btn btn-default" onclick="find()"
					style="color: white; background-color: #0030DB; width: 15em; border-radius: 3em; opacity: 0.9;">
					이메일로 찾기
				</button> 
				<br /><br />
				
				<form id="findForm" method="post" action="findPwdForTel">
				
					<input type="hidden" name="randomNumber">
				
					<div style="background-color:#478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
						<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">Name</span>
						<input type="text" name="name" 
							style="width: 70%; height: 3em; color: black;
								border-bottom-right-radius: 3em; border-top-right-radius: 3em;">
					</div>
					<br />
					
					<div style="background-color:#db6450; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
						<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">Tel</span>
						<input type="text" name="tel" 
							style="width: 70%; height: 3em; color: black;
								border-bottom-right-radius: 3em; border-top-right-radius: 3em;">
					</div>
					<br />
					
					<!-- confirm -->
					<div id="confirm"
						style="background-color: #478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em; display: none;">
						<span
							style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">인증번호</span>
						<input type="text" name="confirm2" id="confirm2"
							style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;">
						<br />
					</div>
					<br />
					
				</form>
				
				<button type="button" class="btn btn-default"  id="checkNumber" onclick="check(findForm)"
						style="background-color: gray; color:white; width: 30em; border-radius: 3em; opacity: 0.8;">
					인증번호 받기
				</button> 
				<br />
				
				<button type="button" class="btn btn-default"  id="sign"
						onclick="check2(findForm)"
						style="background-color: gray; color:white; width: 30em; border-radius: 3em; opacity: 0.8; display: none;">
					비밀번호 찾기
				</button> 
				<br />
				
			</div>
		</div>
	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>