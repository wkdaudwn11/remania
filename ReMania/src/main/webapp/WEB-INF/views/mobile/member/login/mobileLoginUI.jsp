<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania Sign in</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		if(${loginFail != null}){ 
			alert('${loginFail}');
			
			if(${email != null}){ 
				document.getElementById('email').value = '${email}';
				document.getElementById('pwd').focus();
			}else{
				document.getElementById('email').focus();
			}
		}
		
	});
	
	/* 로그인 체크 함수 */
	function login(form){
		
		var email = form.email.value;
		var pwd = form.pwd.value;
		
		if(email == null || email.trim() == ""){
			alert("이메일을 입력해주세요.");
		}else if(pwd == null || pwd.trim() == ""){
			alert("비밀번호를 입력해주세요.");
		}else{
			form.submit();
		}
		
	}
			
</script>

</head>
<body>

	<jsp:include page="../../include/nav.jsp" flush="true" />
	
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<div class="carousel-caption1zz" style="height:40em; text-align: center; color: #FFFFFF; background-image: url('images/mobile/sample10.jpg');">
				<br /><br /><br /><br />
				
				<c:choose>
					<c:when test="${!empty find}">
						<span style="color:#C5C5C5; font-size: 1.5em;">${find.email}</span>
						<p style="color:#C5C5C5; font-size: 0.8em;">
							<font color="white">${find.name}</font>님의 이메일은<br />
							<font color="white">위의 이메일</font>입니다!
						</p>
					</c:when>
					<c:when test="${!empty notFound}">
						<span style="color:#C5C5C5; font-size: 1.5em;">${notFound}</span>
						<p style="color:#C5C5C5; font-size: 0.8em;">
							정확한 <font color="white">정보</font>를 다시 입력해주세요!
						</p>
					</c:when>
					<c:otherwise>
						<span style="color:#C5C5C5; font-size: 3em;">W e l c o m e !</span>
						<p style="color:#C5C5C5; font-size: 0.8em;">
							중고매니아에 가입한 ID가 있으시면<br />
							<font color="white">로그인</font>을 해주세요!<br />
							만약 ID가 없다면 <font color="white">회원가입</font>을 해주세요!
						</p>
					</c:otherwise>
				</c:choose>
				
				<br /><br />
				
				<form id="loginForm" method="post" action="loginCheck">
				
					<!-- name과 sns는 facebook으로 로그인 했을 때만 값이 존재한다. -->
					<input type="hidden" name="name">
					<input type="hidden" name="sns">
				
					<div style="background-color:#478637; width: 20em; height: 3em; margin: 0 auto; border-radius: 3em;">
						<span style="width: 30%; height: 2em; float: left; font-size: 1.1em; padding-top: 7px;">Email</span>
						<input type="text" name="email" id="email"
							style="width: 70%; height: 3em; color: black;
								border-bottom-right-radius: 3em; border-top-right-radius: 3em;" />
					</div>	
					<br />
					
					<div style="background-color:#db6450; width: 20em; height: 3em; margin: 0 auto; border-radius: 3em;">
						<span style="width: 30%; height: 2em; float: left; font-size: 1.1em; padding-top: 7px;">Password</span>
						<input type="password" name="pwd" id="pwd"
							style="width: 70%; height: 3em; color: black;
								border-bottom-right-radius: 3em; border-top-right-radius: 3em;" />
					</div>
					<br />
					
				</form>
				
				<button type="button" class="btn btn-default" onclick="login(loginForm)"
					style="background-color: gray; width: 20em; border-radius: 3em; opacity: 0.8;">
					Sign in
				</button><br /><br />
				
				<a id="kakao-login-btn"></a>
				<jsp:include page="../../include/sns/kakaotalk.jsp" flush="true"></jsp:include>
				
				<a href="javascript:loginFB()">
					<img src="images/facebookLoginBtn.jpg" style="width: 16em; height: 3.7em; border-radius: 1em;">
				</a>
			</div>
		</div>
	</div>
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>