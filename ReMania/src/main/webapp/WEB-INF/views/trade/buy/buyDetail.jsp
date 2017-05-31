<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania</title>

<style>
	.alert {font-size: 1.5em;}
	
	.boardList {font-size: 1em;}
	.boardList th, .boardList td {border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; padding: 14px 0 10px 0;}
	.boardList th {background: #f8f8f8; text-align: center;}
	
	#reple {background-color: #FFFFFF;}
	#repleWriteFormleft {float: left;}
	
	#bedRoomDetailWrap {width: 80%;height: auto; margin: 0 auto;}
	#bedRoomDetailVisual {width: 100%; height: 20em;}
	#bedRoomDetailVisualleft {width: 50%; height: 100%; float: left;}
	#bedRoomDetailVisualRight {height: 100%;}
	#bedRoomDetailContent {width: 70%; height: auto; margin: 0 auto;}
	
	.visualRightTable {margin: 0 auto; text-align: left;}
	.visualRightTable .productName {color: gray; font-size: 15px; font: bold;}
	.visualRightTable .productPrice {color: #5b6bdf; font-size: 15px; font: bold;}
	.visualRightTable .productPrice2 {color: red; font-size: 15px; font: bold;}
	.visualRightTable .productPrice3 { color: #3f4993; font-size: 15px; font: bold;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
"use strict"
var skip = 0;

$(document).ready(function() {
	
	if(${commentWrite != null}){
		alert('${commentWrite}');
	}
	/* if(${update != null}){
		alert('${update}');
	}
	if(${deleteComment != null}){
		alert('${deleteComment}');
	}
	
	$("#updateBoard").on("click",function(event){
		$("font:contains('${board.title}')").replaceWith("<input type='text' name='title' style='outline: none; width: 88.5%; color:black;' value='${buyDTO.title}'>"); 
		$("textarea[name='content']").attr("style","font-size: 0.8em; border-color: black; border-radius: 5px; width: 100%; height: 40em; outline: none; resize: none; color: black;").removeAttr("readonly");
		$("#deleteBoard").text("취소하기").removeAttr("id").attr("onclick","location.reload();");
		$("#updateBoard").text("수정완료").removeAttr("id").attr("onclick","completion();").trigger("blur");
	});// end #updateBoard.on("click")
	*/
	
	$("#commentBtn").on("click",function(){
		writeConfirm($("#usercomment"),$("#comment"));
	});// end $("#commentBtn").click(function())  댓글 작성 버튼 
	
	$("body").on("click",".deleteComment",function(){
		if(confirm("댓글을 삭제 하시겠습니까?")){
			var num = $(this).parent().children(":hidden[name='num']").val();
			var category = $(this).parent().children(":hidden[name='category']").val();
			var boardnum = $(this).parent().children(":hidden[name='boardnum']").val();
			location.replace("deleteComment?num="+num+"&category="+category+"&boardnum="+boardnum+"&curPage=${buyPageDTO.curPage}");
		}
	}); // end $("body").on("click",".deleteComment")
	
	$("body").on("click",".commentUpdate",function(){
		var $textarea = $(this).parent().children("textarea");
		$textarea.removeAttr("disabled").trigger("focus").text($textarea.text());
		$(this).prev().text("취소하기").removeClass("deleteComment").addClass("cancel");
		$(this).text("수정완료").removeClass("commentUpdate").addClass("commentCompletion").trigger("blur");
	}); // end $("body").on("click",".commentUpdate")
	
	$("body").on("click",".cancel",function(){
		var $textarea = $(this).parent().children("textarea");
		$textarea.val($textarea.text()).attr("disabled","disabled");
		$(this).text("삭제하기").removeClass("cancel").addClass("deleteComment").trigger("blur");
		$(this).next().text("수정하기").removeClass("commentCompletion").addClass("commentUpdate");
	}); // end $("body").on("click",".cancel")

	$("body").on("click",".commentCompletion",function(){
		var textarea = $(this).parent().children("textarea");
		writeConfirm(textarea,$(this).parent());
	});
});// end $(document).ready(function());

/* function deleteBoard(){
	if(confirm("삭제 하시겠습니까?")){
		location.replace("deleteBoard?freeboardnum=${board.freeboardnum}&curPage=${FreeBoardPage.curPage}&type=${FreeBoardPage.type}&value=${FreeBoardPage.value}");
	}
} */
 
/* function completion(){
	writeConfirm($("textarea[name='content']"),$("#boardUpdate"));
}// end completion
 */
function reComment(index){
	var $target = $("form[name='recomment']").eq(index);
	var recomment = $target.find("textarea");
	writeConfirm(recomment,$target);
}// end reComment

function writeConfirm($identify,form){
	var trimValue = $identify.val().trim();
	if(trimValue == ""){
		alert("내용이 입력 되지 않았습니다.");
		$identify.trigger("focus");
	}else{
		$identify.val(trimValue);
		form.submit();
	}
}// end confirm

function getCommentList(){
	skip++;
	$.ajax({
		type:"get",
		url:"commentList",
		dataType:"json",
		data:{
			"skip":skip*${commentList.size()},
			"num":${buyDTO.buynum},
			"category":"buy"
		},
		success:function(responseData,status,xhr){
			$.each(responseData,function(idx,obj){
				var html;
				if(obj.comment_level != 0){
					html = "<div style='float: left; width: 7.5%; margin-left: "+((obj.comment_level-1)*7.5)+"%;'><br /><br /><br />"
				　		  +"<img src='images/answerArrow.png' width='30'/></div>"
						  +"<div class='panel panel-default' style='width: "+(100-obj.comment_level*7.5)+"%; margin-left: "+(obj.comment_level*7.5)+"%;'>";
				}else{
					html = "<div class='panel panel-default'>";
				}
				html += "<div class='panel-heading'><small>"+obj.author+"　("+obj.writeday+")</small></div>"
						+"<div class='panel-body'><form action='updateComment' method='post' >"
						+"<input type='hidden' name='num' value='"+obj.num+"'>"
						+"<input type='hidden' name='category' value='"+obj.category+"'>"
						+"<input type='hidden' name='boardnum' value='"+obj.boardnum+"'/>"
						+"<input type='hidden' name='curPage' value='"+${buyPageDTO.curPage}+"'/>"
						+"<input type='hidden' name='type' value='${searchType}' />"
						+"<input type='hidden' name='value' value='${searchValue}' />"	
							+"<textarea name='usercomment' style='width: 80%; height: 5em; color: black; border-style: none; outline: none; float: left; resize: none; background-color: white;' disabled>"+obj.usercomment+"</textarea>";
				if(obj.email == '${login.email}'){
					html += "<button type='button' class='btn btn-danger deleteComment' style='float: right; margin-bottom: 1px;'>삭제하기</button>"
							+"<button type='button' class='btn btn-danger commentUpdate' style='float: right; margin-top: 1px;'>수정하기</button>";
				}
				html += "</form></div></div><form name='recomment' action='comment' method='post'>"
						+"<input type='hidden' name='call' value='recomment' />"
						+"<input type='hidden' name='category' value='"+obj.category+"' />"
						+"<input type='hidden' name='parentComment' value='"+obj.parentComment+"'/>"
						+"<input type='hidden' name='boardnum' value='"+obj.boardnum+"'/>"
						+"<input type='hidden' name='ref' value='"+obj.ref+"'/>"
						+"<input type='hidden' name='step' value='"+(obj.step+1)+"'/>"
						+"<input type='hidden' name='comment_level' value='"+(obj.comment_level+1)+"'/>"
						+"<input type='hidden' name='type' value='${searchType}' />"
						+"<input type='hidden' name='value' value='${searchValue}' />";
				if(obj.comment_level < 2){
					html += "<span style='text-align: right; float: none;'>"
							+"<textarea type='text' name='usercomment' class='recomment' style='float: left; margin-top: 0.5em; border-style: none; width: "+(100-(obj.comment_level+25))+"%; height: 2.5em; outline: none; resize: none; overflow: hidden; margin-left: "+obj.comment_level*7.5+"%;' placeholder='re: '></textarea>"
							+"<button type='button' class='btn btn-danger' style='float: right;' onclick='reComment("+((skip*responseData.length)+idx)+");'>답변하기</button></span>";
				} 
				html += "</form><br /><br /><br />"; 
				$("#panel-group").append(html);
			}); // end $.each
		}// end success
	});// end ajax
	
}// end getCommentList
</script>
</head>
<body>
	<form id="hiddenForm" method="post">
		<input type="hidden" name="category" value="buy">
		<input type="hidden" name="categorynum" value="${buyDTO.buynum}">
		<input type="hidden" name="buyer" value="${buyDTO.email}">
		<input type="hidden" name="seller" value="${login.email}">
	</form>

	<jsp:include page="../../include/nav.jsp" flush="true" />

	<jsp:include page="../../include/trade/buyDetailInclude.jsp" flush="true" />

	<jsp:include page="../../include/trade/buyListInclude.jsp" flush="true" />

	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>