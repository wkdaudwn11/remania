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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
	
		<div class="alert alert-warning" style="background-color: #fbd14e;"><font size="5"><strong>Q&A 자주하는 질문</strong></font></div>
		<div id="panel-group" class="panel-group">
			<div class="panel panel-warning" style="border-color: #fbd14e;">
				<div class="panel-heading A-toggle" style="background-color: #fbd14e;"><font color="#a87840" size="3"><strong>Q. </strong></font><span class="question" style="cursor: pointer;">사기를 당한 것 같아요.</span></div>
				<div class="panel-body" style="display: none;"><font size="3"><strong>A. 거래 페이지로 이동 -> 신고하기 -> 신고접수<br/><br/>&nbsp;&emsp;관리자가 신고 접수 후 처리 해드립니다.<br/><br/>&nbsp;&emsp;<i class="material-icons">&#xe61d;</i>&nbsp;tel ) 112 접수가 빠를 수 있습니다.</strong></font></div>
			</div>
			
			
			<div class="panel panel-warning" style="border-color: #fbd14e;">
				<div class="panel-heading A-toggle" style="background-color: #fbd14e;"><font color="#a87840" size="3"><strong>Q. </strong></font><span class="question" style="cursor: pointer;">아이디, 비밀번호가 기억나지 않아요.</span></div>
				<div class="panel-body" style="display: none;"><font size="3"><strong>A. 상단의 Find 로 이동 -> 간단한 인증 후 아이디, 비밀번호를 찾을 수 있습니다.</strong></font></div>
			</div>
			
			<div class="panel panel-warning" style="border-color: #fbd14e;">
				<div class="panel-heading A-toggle" style="background-color: #fbd14e;"><font color="#a87840" size="3"><strong>Q. </strong></font><span class="question" style="cursor: pointer;">탈퇴 후 복구 가능 한가요?</span></div>
				<div class="panel-body" style="display: none;"><font size="3"><strong>A. 사이트 에서 정보 수집을 하지 않기 때문에 탈퇴 시 복구 불가능 합니다.</strong></font></div>
			</div>
			
			<div class="panel panel-warning" style="border-color: #fbd14e;">
				<div class="panel-heading A-toggle" style="background-color: #fbd14e;"><font color="#a87840" size="3"><strong>Q. </strong></font><span class="question" style="cursor: pointer;">적합한 카테고리가 부족합니다.</span></div>
				<div class="panel-body" style="display: none;"><font size="3"><strong>A. 1:1 문의를 통해 필요한 카테고리를 알려주세요.<br/><br/>&nbsp;&emsp;관리자 판단 하에 다수의 유저가 원하는 카테고리를 추가 하겠습니다.</strong></font></div>
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