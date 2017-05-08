<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania Sign up</title>
</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" />
	
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<div class="carousel-caption1zz" style="height: 44.3em; text-align: center; color: #FFFFFF; background-image: url('images/test/sample5.jpg');">
				<br /><br /><br /><br />
				<span style="color:#C5C5C5; font-size: 5em;">W e l c o m e !</span>
				<p style="color:#C5C5C5; font-size: 1em;">
					<font color="white">회원가입</font>을 하기 위해선 <br />
					빈칸 없이 모두 다 입력하셔야 합니다!
				</p>
				<br /><br />
				
				<div style="background-color:#478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">Name</span>
					<input type="text" name="username" 
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
				
				<div style="background-color:#478637; width: 30em; height: 3em; margin: 0 auto; border-radius: 3em;">
					<span style="width: 30%; height: 2em; float: left; font-size: 1.5em; padding-top: 7px;">Password</span>
					<input type="text" name="pwd" 
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
				
				<button type="button" class="btn btn-default" 
					style="background-color: gray; width: 30em; border-radius: 3em; opacity: 0.7;">
					Sign up
				</button> 
				
			</div>
		</div>
	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>