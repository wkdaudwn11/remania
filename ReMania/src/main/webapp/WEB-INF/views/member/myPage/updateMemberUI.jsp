<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania</title>

<style>
</style>

<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

function check(form) {

	var name = form.name.value;
	//var email = form.email.value;
	var pwd = form.pwd.value;
	var tel = form.tel.value;
	var addr1 = form.addr1.value;
	var addr2 = form.addr2.value;
	var post1 = form.post1.value;
	var post2 = form.post2.value;

	if(tel.length <=1){
		if(pwd.length >=1 && pwd.length < 6 || pwd.length > 16){
			alert("비밀번호는 6~16자리로 입력해주세요.");
			pwd.value="";
			pwd.focus();
			result = false;
		}else if (addr1.length <= 1) {
			alert("주소를 입력해주세요.");
		}else{	
			var tel22= ${member.tel};
			$("#tel").val(tel22);	
			
			if(pwd.length <1){		
				var pwd22= ${member.pwd};
					$("#pwd").val(pwd22);	
				}
			 form.submit();
		}	
	}else{
	if(pwd.length >=1 && pwd.length < 6 || pwd.length > 16){
		alert("비밀번호는 6~16자리로 입력해주세요.");
		pwd.value="";
		pwd.focus();
		result = false;
	}else if(tel.length < 9 || tel.length > 11){
		alert("연락처는 9~11자리로 입력하셔야 합니다.");
		tel.focus();
		
	}else if(!tel.match(/[0-9].*[0-9]/)){
		alert("연락처는 숫자만 입력가능합니다.");
		tel.focus(); 
	}else if (addr1 == null || addr1.trim() == "") {
		alert("주소를 입력해주세요.");
	}else{
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
			$("#update").css("display","");
			if(pwd.length <1){		
			var pwd22= ${member.pwd};
				$("#pwd").val(pwd22);	
			}		
		});		
		}//ajax end	
	}//else end
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

</script>

</head>
<body>

	<jsp:include page="../../include/nav.jsp" flush="true" />

	<div class="container">

		<br /> <br />
		<center>
			<font size="100"><b>회원정보수정</b></font><br /> <br />
		</center>

		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<img src="images/zzz.jpg"> <font color="#7777ca" size="5">[장명주]님!
					</font> <font size="4">붉은색은 변경 할 수 없습니다.</font>
				</div>
				<div class="panel-body">
					<div class="carousel-caption1zz"
						style="text-align: center; color: #FFFFFF;">

						<form id="updateForm" name="updateForm" method="post" action="updateCheck">

							<input type="hidden" name="randomNumber">
							<input type="hidden" name="membernum" value="${member.membernum}">

							<div
								style="background-color: #db6450; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
								<span
									style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">이름</span>
								<input type="text" name="name" id="name" value="${member.name}"
									readonly;
								style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"
									onfocus="javascript:blur();" />
							</div>
							<br />
							<c:if
								test="${member.sns != 'facebook' && member.sns != 'kakaotalk'}">
								<div
									style="background-color: #db6450; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
									<span
										style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">이메일</span>
									<input type="text" value="${member.email}"
										readonly;
									style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"
										onfocus="javascript:blur();" />
								</div>
								<br />
							</c:if>
							<c:if
								test="${member.sns == 'facebook' || member.sns == 'kakaotalk'}">
								<div
									style="background-color: #db6450; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
									<span
										style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">이메일</span>
									<input type="text" name="sns" id="sns" value="${member.sns}"
										readonly;
									style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;"
										onfocus="javascript:blur();" />
								</div>
								<br />
							</c:if>

							<c:if
								test="${member.sns != 'facebook' && member.sns != 'kakaotalk'}">
								<div
									style="background-color: #478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
									<span
										style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">비밀번호</span>
									<input type="password" name="pwd" id="pwd"
										placeholder="변경을 원하실 경우에만 입력해주세요."
										style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;" />
								</div>
								<br />
							</c:if>
							<c:if
								test="${member.sns == 'facebook' || member.sns == 'kakaotalk'}">
								<input type="hidden" name="pwd" id="pwd2" value="pwdpwd">
							</c:if>

							<div style="width: 30em; margin: 0 auto;">
								<div
									style="background-color: #478637; width: 45%; height: 3em; margin: 0 auto; border-radius: 3em; float: left;">
									<span
										style="width: 66%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">우편번호</span>
									<input type="text" name="post1" id="post1"
										value="${member.post1}"
										style="width: 34%; height: 3em; color: black;" />
								</div>
								<font color="black">-</font> <input type="text" name="post2"
									id="post2" value="${member.post2}"
									style="width: 15%; height: 3em; color: black;" /> <input
									type="button" class="btn btn-primary" value="우편번호찾기"
									onclick="openDaumPostcode()">
							</div>
							<br /> <span id="callbacknestsgroomtistorycom739114"
								style="width: 1px; height: 1px; float: right;"><embed
									width="1" height="1" id="bootstrappersgroomtistorycom739114"
									src="http://sgroom.tistory.com/plugin/CallBack_bootstrapperSrc?nil_profile=tistory&nil_type=copied_post"
									type="application/x-shockwave-flash" swliveconnect="true"
									flashvars="&callbackId=sgroomtistorycom739114&host=http://sgroom.tistory.com&embedCodeSrc=http%3A%2F%2Fsgroom.tistory.com%2Fplugin%2FCallBack_bootstrapper%3F%26src%3D%2F%2Fs1.daumcdn.net%2Fcfs.tistory%2Fresource%2F3771%2Fblog%2Fplugins%2FCallBack%2Fcallback%26id%3D73%26callbackId%3Dsgroomtistorycom739114%26destDocId%3Dcallbacknestsgroomtistorycom739114%26host%3Dhttp%3A%2F%2Fsgroom.tistory.com%26float%3Dleft"
									enablecontextmenu="false" wmode="transparent"
									allowscriptaccess="always"></span> <span
								style="line-height: 10%;"><br></span>

							<div
								style="background-color: #478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
								<span
									style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">도로명주소</span>
								<input type="text" name="addr1" id="addr1"
									value="${member.addr1}"
									style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;" />
							</div>
							<br />

							<!-- pwd란에 입력값이 없으면 session에 저장되어있는 pwd를 받아오기  -->
							<!-- pwd란에 입력값이 없으면 session에 저장되어있는 pwd를 받아오기  -->
							<div
								style="background-color: #478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
								<span
									style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">지번주소</span>
								<input type="text" name="addr2" id="addr2"
									value="${member.addr2}"
									style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;" />
							</div>

							<br />
							<div
								style="background-color: #478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
								<span
									style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">연락처</span>
								<input type="tel" name="tel" id="tel"
									placeholder="변경을 하실 경우, 다시 인증을 하셔야합니다."
									style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;" />
							</div>
							<br />

							<div id="confirm"
								style="background-color: #478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em; display: none;">
								<span
									style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">인증번호확인</span>
								<input type="text" name="confirm2" id="confirm2"
									style="width: 70%; height: 3em; color: black; border-bottom-right-radius: 3em; border-top-right-radius: 3em;">
								<br />
							</div>
							<br />
						</form>
						<!-- 폼 끝 -->
						<button type="button" id="checkNumber" class="btn btn-primary"
							onclick="check(updateForm)"
							style="width: 30em; border-radius: 3em;">인증번호받기</button>

						<button type="button" id="update" class="btn btn-primary"
							onclick="check2(updateForm)"
							style="width: 30em; border-radius: 3em; display: none;">
							회원정보수정</button>

					</div>
					<!-- .carousel-caption1zz -->
				</div>
				<!-- .panel-body -->
			</div>
			<!-- .panel panel-default -->
			<br />

		</div>
		<!-- .panel-group -->

	</div>
	<!-- .container -->

	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>