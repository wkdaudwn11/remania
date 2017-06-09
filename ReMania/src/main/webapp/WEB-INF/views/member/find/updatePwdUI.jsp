<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania Find Password</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	function find(){
		location.replace('findPwdForEmail');
	}

	function check(form) {
		
		var pwd = form.pwd;
		var pwd2 = form.pwd2;
		
		if (pwd.value == null || pwd.value.trim() == "") {
			alert("비밀번호를 입력해주세요.");
			pwd.focus();
		}else if(pwd2.value == null || pwd2.value.trim() == "") {
			alert("비밀번호2를 입력해주세요.");
			pwd2.focus();
		}else if(pwd.value.length < 6 || pwd.value.length > 16){
			alert("비밀번호는 6~16자리로 입력하셔야 합니다.");
			pwd.focus();
		}else if(pwd.value != pwd2.value){
			alert("Password와 Password2가 같지 않습니다.");	
			pwd2.focus();
		}else{
			alert("변경이 완료되었습니다!");
			form.submit();
		}	
	}//check End

</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" />
	
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<div class="carousel-caption1zz" style="height: 44.3em; text-align: center; color: #FFFFFF; background-image: url('images/test/sample5.jpg');">
				<br /><br /><br /><br />
				
				<span style="color:#C5C5C5; font-size: 5em;">비밀번호 변경</span>
				<p style="color:#C5C5C5; font-size: 1em;">
					기존의 <font color="white">비밀번호</font>는 보안상 알려드릴 수 없습니다. <br />
					새로운 <font color="white">비밀번호</font>를 설정해주세요! <br />
				</p>
				<br />
				<form id="updateForm" method="post" action="updatePwd">
				
					<input type="hidden" name="email" value="${email}">
				
					<div style="background-color:#478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
						<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">Password</span>
						<input type="password" name="pwd" 
							style="width: 70%; height: 3em; color: black;
								border-bottom-right-radius: 3em; border-top-right-radius: 3em;">
					</div>
					<br />
					
					<div style="background-color:#db6450; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
						<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">Password2</span>
						<input type="password" name="pwd2" 
							style="width: 70%; height: 3em; color: black;
								border-bottom-right-radius: 3em; border-top-right-radius: 3em;">
					</div>
					<br />
					
				</form>
				
				<button type="button" class="btn btn-default"  id="sign"
						onclick="check(updateForm)"
						style="background-color: gray; color:white; width: 30em; border-radius: 3em; opacity: 0.8;">
					비밀번호 변경
				</button> 
				<br />
				
			</div>
		</div>
	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>