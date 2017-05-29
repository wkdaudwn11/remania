<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania</title>

<style>
	
	.boardList {font-size:1em;}
	.boardList th, .boardList td {border-top:1px solid #ddd; border-bottom:1px solid #ddd; padding:14px 0 10px 0;}
	.boardList th {background:#f8f8f8; text-align:center;}
	
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(".A-toggle").on("mouseenter",function(){
			$(this).find(".question").wrap("<strong>");
		});
		$(".A-toggle").on("mouseleave",function(){
			$(this).find(".question").unwrap();
		});
		
		$(".A-toggle").on("click",function(){
			var $answer = $(this).next();
			if($answer.attr("style") == "display: none;"){
				$(this).find(".question").wrap("<strong>");
				$answer.show("slow");
			}else{
				$(this).find(".question").unwrap();
				$answer.hide();
			}
		});
		
	}); // $(document).ready();
</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" />
	
	<br /><br /><br /><br /><br /><br />
	<center>
		<font size="100"><i class="fa">&#xf0e6;</i>  <b>문의게시판</b></font><br /><br />
	</center>
	
	<div class="container">
	
		<div class="alert alert-warning" style="background-color: #fbd14e;"><font size="5"><strong>Q&A</strong></font></div>
		<div id="panel-group" class="panel-group">
			<div class="panel panel-warning" style="border-color: #fbd14e;">
				<div class="panel-heading A-toggle" style="background-color: #fbd14e;"><font color="#a87840" size="3"><strong>Q. </strong></font><span class="question" style="cursor: pointer;">aaaaaaaa</span></div>
				<div class="panel-body" style="display: none;"><font size="3"><strong>A. </strong></font></div>
			</div>
			
			<div class="panel panel-warning" style="border-color: #fbd14e;">
				<div class="panel-heading A-toggle" style="background-color: #fbd14e;"><font color="#a87840" size="3"><strong>Q. </strong></font><span class="question" style="cursor: pointer;">aaaaaaaa</span></div>
				<div class="panel-body" style="display: none;"><font size="3"><strong>A. </strong></font></div>
			</div>
			
			<div class="panel panel-warning" style="border-color: #fbd14e;">
				<div class="panel-heading A-toggle" style="background-color: #fbd14e;"><font color="#a87840" size="3"><strong>Q. </strong></font><span class="question" style="cursor: pointer;">aaaaaaaa</span></div>
				<div class="panel-body" style="display: none;"><font size="3"><strong>A. </strong></font></div>
			</div>
			
			<div class="panel panel-warning" style="border-color: #fbd14e;">
				<div class="panel-heading A-toggle" style="background-color: #fbd14e;"><font color="#a87840" size="3"><strong>Q. </strong></font><span class="question" style="cursor: pointer;">aaaaaaaa</span></div>
				<div class="panel-body" style="display: none;"><font size="3"><strong>A. </strong></font></div>
			</div>
			
			<div class="panel panel-warning" style="border-color: #fbd14e;">
				<div class="panel-heading A-toggle" style="background-color: #fbd14e;"><font color="#a87840" size="3"><strong>Q. </strong></font><span class="question" style="cursor: pointer;">aaaaaaaa</span></div>
				<div class="panel-body" style="display: none;"><font size="3"><strong>A. </strong></font></div>
			</div>
			
			<div class="panel panel-warning" style="border-color: #fbd14e;">
				<div class="panel-heading A-toggle" style="background-color: #fbd14e;"><font color="#a87840" size="3"><strong>Q. </strong></font><span class="question" style="cursor: pointer;">aaaaaaaa</span></div>
				<div class="panel-body" style="display: none;"><font size="3"><strong>A. </strong></font></div>
			</div>
			
			<div class="panel panel-warning" style="border-color: #fbd14e;">
				<div class="panel-heading A-toggle" style="background-color: #fbd14e;"><font color="#a87840" size="3"><strong>Q. </strong></font><span class="question" style="cursor: pointer;">aaaaaaaa</span></div>
				<div class="panel-body" style="display: none;"><font size="3"><strong>A. </strong></font></div>
			</div>
		</div> <!--  panel-group  -->
		
		<p style="text-align: right;">
			<button type="button" class="btn btn-warning" onclick="location.replace('inquiryWrite');">
				<i class="fa">&#xf27a;</i>  문의하기
			</button>
		</p>
	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>