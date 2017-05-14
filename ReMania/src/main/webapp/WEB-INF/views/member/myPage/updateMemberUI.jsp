<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
	});
</script>

</head>
<body>

	<jsp:include page="../../include/nav.jsp" flush="true" />

	<div class="container">

		<br />
		<br />
		<center>
			<font size="100"><b>회원정보수정</b></font><br />
			<br />
		</center>

		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<img src="images/zzz.jpg">
					<font color="#7777ca" size="5">[장명주]님! </font>
					<font size="4">붉은색은 변경 할 수 없습니다.</font>　　
				</div>
				<div class="panel-body">
					<div class="carousel-caption1zz" style="text-align: center; color: #FFFFFF;">
					
						<div style="background-color:#db6450; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
							<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;" >이름</span>
							<input type="text" name="name" id="name" value="장명주" readonly;
								style="width: 70%; height: 3em; color: black;
									border-bottom-right-radius: 3em; border-top-right-radius: 3em;" />
						</div>
						<br />
						
						<div style="background-color:#db6450; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
							<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;" >이메일</span>
							<input type="text" name="email" id="email" value="admin@naver.com" readonly;
								style="width: 70%; height: 3em; color: black;
									border-bottom-right-radius: 3em; border-top-right-radius: 3em;" />
						</div>
						<br />
						
						<div style="background-color:#478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
							<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">비밀번호</span>
							<input type="password" name="pwd" id="pwd" placeholder="변경을 원하실 경우에만 입력해주세요."
								style="width: 70%; height: 3em; color: black;
									border-bottom-right-radius: 3em; border-top-right-radius: 3em;" />
						</div>
						<br />
						
						<div style="background-color:#478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
							<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">연락처</span>
							<input type="password" name="tel" id="tel" placeholder="변경을 하실 경우, 다시 인증을 하셔야합니다."
								style="width: 70%; height: 3em; color: black;
									border-bottom-right-radius: 3em; border-top-right-radius: 3em;" />
						</div>
						<br />
						
						<div style="width: 30em; margin: 0 auto;">
							<div style="background-color:#478637; width: 45%; height: 3em; margin: 0 auto; border-radius: 3em; float: left;">
								<span style="width: 66%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">우편번호</span>
								<input type="text" name="post1" id="post1"
									style="width: 34%; height: 3em; color: black;" />
							</div>
								<font color="black">-</font>　<input type="text" name="post2" id="post2"
										style="width: 15%; height: 3em; color: black;" />
								<input type="button" class="btn btn-primary" value="우편번호찾기" onclick="openDaumPostcode()">
						</div>
						<br />
						
						<span id="callbacknestsgroomtistorycom739114"
							style="width: 1px; height: 1px; float: right;"><embed width="1"
								height="1" id="bootstrappersgroomtistorycom739114"
								src="http://sgroom.tistory.com/plugin/CallBack_bootstrapperSrc?nil_profile=tistory&nil_type=copied_post"
								type="application/x-shockwave-flash" swliveconnect="true"
								flashvars="&callbackId=sgroomtistorycom739114&host=http://sgroom.tistory.com&embedCodeSrc=http%3A%2F%2Fsgroom.tistory.com%2Fplugin%2FCallBack_bootstrapper%3F%26src%3D%2F%2Fs1.daumcdn.net%2Fcfs.tistory%2Fresource%2F3771%2Fblog%2Fplugins%2FCallBack%2Fcallback%26id%3D73%26callbackId%3Dsgroomtistorycom739114%26destDocId%3Dcallbacknestsgroomtistorycom739114%26host%3Dhttp%3A%2F%2Fsgroom.tistory.com%26float%3Dleft"
								enablecontextmenu="false" wmode="transparent"
								allowscriptaccess="always"></span>
						<span style="line-height: 10%;"><br></span>
						
						<div style="background-color:#478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
							<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">도로명주소</span>
							<input type="text" name="addr1" id="addr1"
								style="width: 70%; height: 3em; color: black;
									border-bottom-right-radius: 3em; border-top-right-radius: 3em;" />
						</div>
						<br />
						
						<div style="background-color:#478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
							<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">지번주소</span>
							<input type="text" name="addr2" id="addr2"
								style="width: 70%; height: 3em; color: black;
									border-bottom-right-radius: 3em; border-top-right-radius: 3em;" />
						</div>
						<br />
						
						<button type="button" class="btn btn-primary" onclick="login(loginForm)"
							style="width: 30em; border-radius: 3em;">
							회원정보수정
						</button>
						
					</div><!-- .carousel-caption1zz -->
				</div> <!-- .panel-body -->
			</div> <!-- .panel panel-default -->
			<br />
		
		</div> <!-- .panel-group -->
		
	</div> <!-- .container -->

	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>