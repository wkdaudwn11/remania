<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴 재확인</title>

<style>
	#pwdCheckContent {width:100%; margin: 0 auto; border:2px solid gray;}
	#pwdCheckContent img{width:100%;}
	
	#inputPwdTable {width:80%; margin: 0 auto; background-color: #fcfcfc; padding-top: 2em; padding-bottom: 2em;}
	#inputPwdTable table{width: 50%; margin:0 auto; font-size: 1.5em;}
	
	#inputPwdBtn{width:30%; margin: 0 auto;}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	function check(form){
		var pwdcheck = form.pwdcheck;
		if(pwdcheck.value =='${login.pwd}'){
			if(confirm("정말로 회원탈퇴를 하시겠습니까?")){
				form.submit(); 
				alert('서비스를 이용해주셔서 감사합니다.');
			}
		}else{
			alert('비밀번호가 일치하지 않습니다.');
			pwdcheck.value="";
			pwdcheck.focus();
		}
	}//check(form)
	function cancel(){
		location.href="myPageIndex"; 
	}
</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" /><br>
	
	<div class="container">
		<div id="pwdCheckContent">
			<br /><br />
			<center><img src="images/pwdCheck.jpg"></center>
			
			<form name="pwdCheckForm" id="pwdCheckForm" method="post" action="deleteCheck">
				<input type="hidden" name="membernum" value="${login.membernum}">		
				<div id="inputPwdTable">
					<table>
						<tr>
							<td>아이디</td>
							<td>${login.email}</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>
								<input type="password" name="pwdcheck" id="pwdcheck" style="height:1em;">
							</td>
						</tr>
					</table>
				</div>
				<br><br>
			</form>
				<div id="inputPwdBtn" >
					<button type="button" class="btn btn-primary" style="width: 8em; border-radius: 3em; float: left;"
						onclick="check(pwdCheckForm)">
						확인
					</button>
					<button type="button"  class="btn btn-danger" style="width: 8em; border-radius: 3em;"
							onclick="cancel()" value="return">
						취소
					</button>
				</div>
			<br /><br />
		</div><!-- pwdCheckContent -->
	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>