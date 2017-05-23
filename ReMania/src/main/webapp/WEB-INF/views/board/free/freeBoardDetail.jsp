<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania</title>

<style>

	.alert{font-size: 1.5em;}
	
	.boardList {font-size:1em;}
	.boardList th, .boardList td {border-top:1px solid #ddd; border-bottom:1px solid #ddd; padding:14px 0 10px 0;}
	.boardList th {background:#f8f8f8; text-align:center;}
	
	#reple{background-color: #FFFFFF;}
	#repleWriteFormleft{float: left;}
	
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	"use strict"
	var skip = 0;
	
	$(document).ready(function() {
		
		if(${commentWrite != null}){
			alert('${commentWrite}');
		}
		
		$("#commentBtn").click(function(){
			var comment = $("textarea[name='usercomment']").val().trim();
			if(comment == ""){
				alert("내용이 입력 되지 않았습니다.");
			}else{
				$("#comment").submit();
			}
		});// end $("#commentBtn").click(function())  댓글 작성 버튼
		
	});// end $(document).ready(function()
	
	function reComment(index){
		var $target = $("form[name='recomment']").eq(index);
		var $recomment = $target.find("textarea");
		if($recomment.val().trim() == ""){
			alert("내용이 입력 되지 않았습니다.");
			$recomment.trigger("focus");
		}else{
			$target.submit();
		}
	}// end reComment
	
	function getCommentList(){
		skip++;
		$.ajax({
			type:"get",
			url:"commentList",
			dataType:"json",
			data:{
				"skip":skip,
				"num":${board.freeboardnum}
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
							+"<div class='panel-body'>"
								+"<pre style='width: 80%; height: 5em; background-color: white; color: black; border-style: none; float: left;'>"+obj.usercomment+"</pre>";
					if(obj.email == '${login.email}'){
						html += "<button type='button' class='btn btn-success' style='float: right; margin-bottom: 1px;'>수정하기</button>"
								+"<button type='button' class='btn btn-success' style='float: right; margin-top: 1px;'>삭제하기</button>"
					}
					html += "</div></div><form name='recomment' action='comment' method='post'>"
							+"<input type='hidden' name='call' value='recomment' />"
							+"<input type='hidden' name='category' value='"+obj.category+"' />"
							+"<input type='hidden' name='parentComment' value='"+obj.parentComment+"'/>"
							+"<input type='hidden' name='boardnum' value='"+obj.boardnum+"'/>"
							+"<input type='hidden' name='ref' value='"+obj.ref+"'/>"
							+"<input type='hidden' name='step' value='"+(obj.step+1)+"'/>"
							+"<input type='hidden' name='comment_level' value='"+(obj.comment_level+1)+"'/>";
					if(obj.comment_level < 2){
						html += "<span style='text-align: right; float: none;'>"
								+"<textarea type='text' name='usercomment' class='recomment' style='float: left; margin-top: 0.5em; border-style: none; width: "+(100-(obj.comment_level+25))+"%; height: 2.5em; outline: none; resize: none; overflow: hidden; margin-left: "+obj.comment_level*7.5+"%;' placeholder='re: '></textarea>"
								+"<button type='button' class='btn btn-success' style='float: right;' onclick='reComment("+((skip*responseData.length)+idx)+");'>답변하기</button></span>";
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
	<jsp:include page="../../include/nav.jsp" flush="true" />

	<br /><br /><br /><br /><br /><br />
	<center><font size="100"><b>자유게시판</b></font></center>
	
	<div class="container">
		<div class="alert alert-success">
			<strong>작&nbsp;&nbsp;성&nbsp;&nbsp;자</strong>&nbsp;&nbsp;
			<font color="black">${board.author}</font>　　　　　　　　　　　　　　<!-- 공백 건들지 말 것. -->
			
			<small>
				<strong>날　　짜</strong>&nbsp;&nbsp;
				<font color="black">${board.writeday}</font>
			</small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<small>
				<strong>조&nbsp;&nbsp;회&nbsp;&nbsp;수</strong>&nbsp;&nbsp;&nbsp;
				<font color="black">${board.readcnt}</font>
			</small>
			
			<br /><br />
			
			<strong>제　　목</strong>&nbsp;&nbsp;
			<font color="black">${board.title}</font>
			<br /><br />
		
			<strong>내　　용</strong><br />
			<pre style="width: 100%; height: 40em; background-color: white; color: black;">${board.content}</pre>
			<br /><br />
		</div>
				
		<p style="text-align: left; float: left;">
			<c:if test="${login.name == board.author || login.email == 'admin'}">
				<button type="button" class="btn btn-success">
					수정하기
				</button>
				<button type="button" class="btn btn-success">
					삭제하기
				</button>
			</c:if>
		</p>
		
		<br /><br /><hr /><br />
		
		<div id="panel-group" class="panel-group">
			<!-- 댓글 입력 폼 -->
			<div class="panel panel-success">
				<div class="panel-heading"><strong>댓글</strong></div>
				<div class="panel-body">
					<form id="comment" action="comment" method="post">
						<input type="hidden" name="call" value="comment" />
						<input type="hidden" name="boardnum" value="${board.freeboardnum}"/>
						<font color="black">
							<textarea name="usercomment" rows="5" cols="100" style="border-style: none; outline: none; resize: none;" placeholder="여러분들의 소중한 의견을 작성해주세요."></textarea>
						</font>
					</form>
				</div>
			</div>
			<p style="text-align: right;">
				<button id="commentBtn" type="button" class="btn btn-success">
					댓글작성
				</button>
			</p>
				
			<br />
			<c:if test="${board.replecnt != 0}">
				<a href="javascript:getCommentList();">댓글 더 보기</a>
				<p/>
			</c:if>	
			<!-- 댓글 리스트 -->
			<c:forEach var="comment" items="${commentList}" varStatus="status">
				<c:choose>
					<c:when test="${comment.comment_level != 0}">
						<div style="float: left; width: 7.5%; margin-left: ${(comment.comment_level-1)*7.5}%;">
							<br /><br /><br />
						　	<img src="images/answerArrow.png" width="30"/>
						</div>
						<div class="panel panel-default" style="width: ${100-(comment.comment_level*7.5)}%; margin-left: ${comment.comment_level*7.5}%;">
					</c:when>
					<c:otherwise>
						<div class="panel panel-default">
					</c:otherwise>
				</c:choose>
						<div class="panel-heading"><small>${comment.author}　(${comment.writeday})</small></div>
							<div class="panel-body">
								<pre style="width: 80%; height: 5em; background-color: white; color: black;
									border-style: none; float: left;">${comment.usercomment}</pre>
									<c:if test="${comment.email eq login.email}">
										<button type="button" class="btn btn-success" style="float: right; margin-bottom: 1px;">
											수정하기
										</button>
										<button type="button" class="btn btn-success" style="float: right; margin-top: 1px;">
											삭제하기
										</button>
									</c:if>
							</div>
						</div>
						<form name="recomment" action="comment" method="post">
							<input type="hidden" name="call" value="recomment" />
							<input type="hidden" name="category" value="${comment.category}" />
							<input type="hidden" name="parentComment" value="${comment.parentComment}"/>
							<input type="hidden" name="boardnum" value="${comment.boardnum}"/>
							<input type="hidden" name="ref" value="${comment.ref}"/>
							<input type="hidden" name="step" value="${comment.step +1}"/>
							<input type="hidden" name="comment_level" value="${comment.comment_level +1}"/>
							<c:if test="${comment.comment_level <2}">
								<span style="text-align: right; float: none;">
									<textarea type="text" name="usercomment" class="recomment" style="float: left; margin-top: 0.5em; border: 1px solid black; width:${100-(comment.comment_level+25)}%; height: 2.5em; outline: none; resize: none; overflow: hidden; margin-left: ${comment.comment_level*7.5}%;" placeholder="re: "></textarea>
									<button type="button" class="btn btn-success" style="float: right;" onclick="reComment(${status.index});"> 
										답변하기
									</button>
								</span>
							</c:if>
						</form>
				<br /><br /><br />
			</c:forEach>
		</div>
		<br /><br /><hr /><br /><br />
		
		<jsp:include page="../../include/board/list.jsp" flush="true">
			<jsp:param name="FreeBoardPage" value="${FreeBoardPage}"/>
		</jsp:include>
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>