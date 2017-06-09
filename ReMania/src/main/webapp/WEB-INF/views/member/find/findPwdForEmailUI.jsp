<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania Find Password</title>

<script type="text/javascript">

	function find(){
		location.replace('findPwdForTelUI');
	}

	function check(form) {
		var name = form.name.value;
		var email = form.email.value;
		
		if (email == null || email.trim() == "") {
			alert("이메일을 입력해주세요.");
		} else if (!email.match(/^[A-Za-z0-9\.\-]+@[A-Za-z0-9\-]+/)) {
			alert("이메일을  형식에 맞게 입력해주세요.");
		} else if(name == null || name.trim() == ""){
			alert("이름을 입력해주세요.");
		} else {
			form.submit();
		}//else end	
	}//check End

</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" />
	
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<div class="carousel-caption1zz" style="height: 44.3em; text-align: center; color: #FFFFFF; background-image: url('images/test/sample5.jpg');">
				<br /><br /><br /><br />
				
				<span style="color:#C5C5C5; font-size: 5em;">비밀번호 찾기</span>
				<p style="color:#C5C5C5; font-size: 1em;">
					<font color="white">비밀번호</font>를 찾기 위해선 <br />
					<font color="white">이메일</font> 인증을 해주셔야 합니다!<br />
				</p>
				<br /><br />
				
				<button type="button" class="btn btn-default" onclick="find()"
					style="color: white; background-color: #0030DB; width: 15em; border-radius: 3em; opacity: 0.9;">
					연락처로 찾기
				</button> 
				<br /><br />
				
				<form id="findForm" name="findForm" method="post" action="findPwdForEmail">
					<div style="background-color:#478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
						<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">Name</span>
						<input type="text" name="name" 
							style="width: 70%; height: 3em; color: black;
								border-bottom-right-radius: 3em; border-top-right-radius: 3em;">
					</div>
					<br />
					
					<div style="background-color:#db6450; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
						<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">Email</span>
						<input type="text" name="email" 
							style="width: 70%; height: 3em; color: black;
								border-bottom-right-radius: 3em; border-top-right-radius: 3em;">
					</div>
					<br />
				</form>
				
				<button type="button" class="btn btn-default" onclick="check(findForm)" 
					style="background-color: gray; width: 30em; border-radius: 3em; opacity: 0.8;">
					이메일 인증하기
				</button> 
				
			</div>
		</div>
	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>