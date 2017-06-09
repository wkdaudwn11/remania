<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>중고매니아</title>

</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

	<jsp:include page="include/nav.jsp" flush="true" />
	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="height:32.4em;">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		</ol> 

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="images/mobile/bike_bg6.jpg" alt="BIKE">
				<div class="carousel-caption">
					<h3>BIKE</h3>
				</div>
			</div>

			<div class="item">
				<img src="images/mobile/camera_bg6.jpg" alt="CAMERA">
				<div class="carousel-caption">
					<h3>CAMERA</h3>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	
	<jsp:include page="include/footer.jsp" flush="true" />

</body>
</html>
