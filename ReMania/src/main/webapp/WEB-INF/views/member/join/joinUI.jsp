<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania Sign up</title>

<style>
.display {
	display: none;
}
</style>

</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
	<script type="text/javascript">
		function check(form) {

			var name = form.name.value;
			var email = form.email.value;
			var pwd = form.pwd.value;
			var tel = form.tel.value;

			if (name == null || name.trim() == "") {
				alert("이름을 입력해주세요.");
			} else if(name.length < 2 || name.length > 6){
				alert("이름은 2~6자리만 입력해주세요.");
				name.value="";
				name.focus();
				result = false;
			} else if (email == null || email.trim() == "") {
				alert("이메일을 입력해주세요.");
			} else if (!email.match(/^[A-Za-z0-9\.\-]+@[A-Za-z0-9\-]+/)) {
				alert("이메일을  형식에 맞게 입력해주세요.");
			} else if (pwd == null || pwd.trim() == "") {
				alert("비밀번호를 입력해주세요.");
			} else if(pwd.length < 6 || pwd.length > 16){
				alert("비밀번호는 6~16자리로 입력해주세요.");
				pwd.value="";
				pwd.focus();
				result = false;
			} else if (tel == null || tel.trim() == "") {
				alert("휴대폰번호를 입력해주세요.");
			} else if(tel.length < 9 || tel.length > 11){
	    		alert('연락처는 9자리 이상 입력하셔야 합니다.');
	    		tel.focus();
	    	}else if(!tel.match(/[0-9].*[0-9]/)){
				alert("연락처는 숫자만 입력가능합니다.");
				tel.focus(); 
	    	}else{
				//이메일 중복검사
				$.ajax({
					type:"post",
					url:"emailCheck",
					dataType:"json",
					data:{
						email : email
					},
					success:function(responseData,status,xhr){
						alert('이미 존재하는 이메일입니다.\n다른 이메일을 입력해주세요.');
					},//success
					error:function(error){
						//휴대폰 인증
					
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
						
					}//이메일 인증error
				});//이메일 인증ajax
			}		
		}//check End
		 
		function check2(form){
		
			var result = false;
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
		
		 
		 /* $(document).ready(function check2(form){
			$("#joinForm").submit(function(event){
				var confirmNumber ='${sessionScope.confirmNumber}';
				var confirm = form.confirm.value;
				if($(":confirm").val==confirmNumber){ 
					alert("성공");
				}else{
					alert("실패");
					confirm="";
					confirm.form.focus();
				}
				
			}); 
		 }); */
		 
	</script>

	<jsp:include page="../../include/nav.jsp" flush="true" />

	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<div class="carousel-caption1zz"
				style="height: 44.3em; text-align: center; color: #FFFFFF; background-image: url('images/test/sample5.jpg');">
				<br /> <br /> <br /> <br /> <span
					style="color: #C5C5C5; font-size: 5em;">W e l c o m e !</span>
				<p style="color: #C5C5C5; font-size: 1em;">
					<font color="white">회원가입</font>을 하기 위해선 <br /> 빈칸 없이 모두 다 입력하셔야
					합니다!
				</p>
				<br /> <br />

				<form id="joinForm" method="post" action="joinCheck">
					
					<input type="hidden" name="randomNumber">
					
					<div
						style="background-color: #478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
						<span
							style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">Name</span>
						<input type="text" name="name"
							style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;">
					</div>
					<br />

					<div
						style="background-color: #db6450; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
						<span
							style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">Email</span>
						<input type="text" name="email"
							style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;">
					</div>
					<br />

					<div
						style="background-color: #478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
						<span
							style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">Password</span>
						<input type="password" name="pwd"
							style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;">
					</div>
					<br />

					<div
						style="background-color: #db6450; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
						<span
							style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">Tel</span>
						<input type="text" name="tel"
							style="width: 70%; height: 3em; color: black; float: left; border-bottom-right-radius: 3em; border-top-right-radius: 3em;">
					</div>
					<br />

					<!-- confirm -->
					<div id="confirm"
						style="background-color: #478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em; display: none;">
						<span
							style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">Confirm</span>
						<input type="text" name="confirm2" id="confirm2"
							style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;">
						<br />
					</div>
					<br />
				</form>

				<button type="button" id="checkNumber" class="btn btn-default"
					onclick="check(joinForm)"
					style="background-color: gray; width: 30em; border-radius: 3em; opacity: 0.7;">
					인증번호 받기</button>

				<button type="button" id="sign" class="btn btn-default" 
					onclick="check2(joinForm)"
					style="background-color: gray; width: 30em; border-radius: 3em; opacity: 0.7; display: none;">
					Sign up</button>
			</div>
		</div>
	</div>

	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>