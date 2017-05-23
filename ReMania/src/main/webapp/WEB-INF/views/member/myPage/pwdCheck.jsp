<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 재확인</title>

<style>
	#pwdCheckContent {width:100%; margin: 0 auto; border:2px solid gray;}
	#pwdCheckContent img{width:100%;}
	
	#inputPwdTable {width:80%; margin: 0 auto; background-color: #fcfcfc; padding-top: 2em; padding-bottom: 2em;}
	#inputPwdTable table{width: 50%; margin:0 auto; font-size: 1.5em;}
	
	#inputPwdBtn{width:30%; margin: 0 auto;}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script>

	$(document).ready(function(){
		if(${message != null }){
			alert('${message}');
		}
	});// end $(document).ready()

	function pwdCheking(value){
		
		var pwdCheckForm = document.getElementById('pwdCheckForm');	
		if(pwdCheckForm.pwd.value =='${login.pwd}'){
		if(value == 'submit'){
			location.href="updateMemberUI";
			/* pwdCheckForm.action="updateMemberUI";
			pwdCheckForm.submit; */
		
		}
		}else{
			var result = confirm('정말로 취소하시겠습니까?');
			if(result == true){
				pwdCheckForm.action="myPageIndex";
				pwdCheckForm.submit;
			}
		}
				
	}
	
</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" /><br>
	
	<div class="container">
		<div id="pwdCheckContent">
			<br /><br />
			<center><img src="images/pwdCheck.jpg"></center>
			
			<form name="pwdCheckForm" id="pwdCheckForm">		
				<div id="inputPwdTable">
					<table>
						<tr>
							<td>아이디</td>
							<td>wkdaudwn11@naver.com</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>
								<input type="password" name="pwd" id="pwd" value="" style="height:1em;">
							</td>
						</tr>
					</table>
				</div>
				<br><br>
				
				<div id="inputPwdBtn">
					<button type="button" class="btn btn-primary" onclick="pwdCheking('submit')"
						style="width: 8em; border-radius: 3em; float: left;">
						확인
					</button>
					<button type="button" class="btn btn-danger" onclick="pwdCheking('cancel')"
						style="width: 8em; border-radius: 3em;">
						취소
					</button>
				</div>
			</form>
			<br /><br />
		</div><!-- pwdCheckContent -->
	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>