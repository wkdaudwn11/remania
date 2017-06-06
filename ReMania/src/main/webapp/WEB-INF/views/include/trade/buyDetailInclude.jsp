<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
	.displayNone{display: none;}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		if("${tradeDTO}" != ""){
			$("#trade_content").hide("fast");
		}
		
		$("#contentDisplayOff").addClass("displayNone");
		
		/* $("#sellBtn").on("click", function(){
			
			var hiddenForm = document.getElementById("hiddenForm");
			var buyerEmail = '${buyDTO.email}'; // 게시글 작성자 이메일(구매자 이메일로도 쓰임)
			var loginEmail = '${login.email}'; // 로그인 이메일 (판매자 이메일로도 쓰임)
			
			if(loginEmail == "" || loginEmail == null){
				alert('로그인을 하셔야 판매신청을 할 수 있습니다.');
			}else if(loginEmail == buyerEmail){
				alert('자신의 글은 판매신청을 할 수 없습니다.');
			}else{
				if(confirm("판매신청이 되었습니다. 거래화면으로 이동하시겠습니까?")){
					hiddenForm.action = "trade";
					hiddenForm.submit();
				}
			}
		}); // */
		
		$("#contentDisplayOn").on("click", function(){
			$("#contentDisplayOff").removeClass("displayNone");
			$("#contentDisplayOn").addClass("displayNone");
			$("#trade_content").show("slow");
		});
		
		$("#contentDisplayOff").on("click", function(){
			$("#contentDisplayOn").removeClass("displayNone");
			$("#contentDisplayOff").addClass("displayNone");
			$("#trade_content").hide("slow");
		});
	});
	
	//게시글 삭제 함수
	function buyDelete(loginEmail, memberEmail, buynum, curPage, category, sort, searchType, searchValue){
		if(loginEmail != memberEmail){ // 로그인 한 계정과 작성자가 틀리면 경고창을 띄어줌.
			alert('작성자만 삭제 할 수 있습니다.');
		}else{ // 나머지의 경우에는 삭제 할 것인지 다시 한 번 물어봄.
			if(confirm("게시글을 정말로 삭제하시겠습니까?")){
				location.replace("buyDelete?buynum="+buynum+"&curPage="+curPage+"&category="+category+"&sort="+sort+"&searchType="+searchType+"&searchValue="+searchValue);
			}
		}
	}//buyDelete(loginEmail, memberEmail, buynum, curPage, category, sort, searchType, searchValue)
	
	//글 수정
	function buyUpdate(loginEmail, memberEmail, buynum, curPage, category, sort, searchType, searchValue){
		if(loginEmail != memberEmail){ // 로그인 한 계정과 작성자가 틀리면 경고창을 띄어줌.
			alert('작성자만 수정 할 수 있습니다.');
		}else{ // 나머지의 경우에는 삭제 할 것인지 다시 한 번 물어봄.
			location.replace("buyUpdate?buynum="+buynum+"&curPage="+curPage+"&category="+category+"&sort="+sort+"&searchType="+searchType+"&searchValue="+searchValue);
		}
	}//buyUpdate(loginEmail, memberEmail, buynum)
	
</script>

<div class="container">
	<div class="panel-group">
		<c:if test="${tradeDTO == null}">
			<div class="panel panel-danger">
		</c:if>
		<c:if test="${tradeDTO != null}">
			<div class="panel panel-default">
		</c:if>
			<div class="panel-heading">
				<h2>${buyDTO.title}</h2>
			</div>
			<br />
			<div id="bedRoomDetailVisual">
				<div id="bedRoomDetailVisualleft">
					<center>
						<c:choose>
							<c:when test="${!(empty buyDTO.image1)}">
								<img
									src="buy/${buyDTO.buynum}_${buyDTO.email}/${buyDTO.image1}.jpg"
									width="80%" height="300px">
							</c:when>
							<c:otherwise>
								<!-- 사진 등록을 안했을 경우는 기본 사진을 뿌려줌 -->
								<img src="images/ImgNotFound.png" width="80%" height="300px">
							</c:otherwise>
						</c:choose>
					</center>
				</div>
				<div id="bedRoomDetailVisualRight">

					<table class="visualRightTable" width="40%">
						<tr>
							<c:if test="${tradeDTO.category == 'buy'}">
								<td class="productName" style="width: 30%">구매자</td>
								<td class="productName"><b><font color="#7777ca">${buyDTO.author}</font></b></td>
							</c:if>
							<c:if test="${tradeDTO.category == 'sell'}">
								<td class="productName" style="width: 30%">판매자</td>
								<td class="productName"><b><font color="#7777ca">${seller.name}</font></b></td>
							</c:if>
						</tr>
					</table>
					<hr />
					<table class="visualRightTable" width="40%">
						<tr>
							<td style="width: 30%">상품</td>
							<td>${buyDTO.category}</font>
							</td>
						</tr>
						<c:choose>
							<c:when test="${buyDTO.pricechoice == '범위 설정'}">
								<tr>
									<td>최소</td>
									<td><fmt:formatNumber value="${buyDTO.price1}"
											type="currency" /></td>
								</tr>
								<tr>
									<td>최대</td>
									<td><fmt:formatNumber value="${buyDTO.price2}"
											type="currency" /></td>
								</tr>
							</c:when>
							<c:when test="${buyDTO.pricechoice == '합의 후 결정'}">
								<tr>
									<td class="productName">가격</td>
									<td>합의 후 결정</td>
								</tr>
							</c:when>
						</c:choose>
					</table>
					<hr>
					<table class="visualRightTable" width="40%">
						<tr>
							<td class="productName" style="width: 30%">거래방법</td>
							<td class="productName">${buyDTO.tradeway}</td>
						</tr>
						<tr>
							<td class="productName">지역</td>
							<td class="productName">${buyDTO.location}</td>
						</tr>
					</table>
					<hr>
					<center>
						<c:choose>
							<c:when test="${tradeDTO == null}">
								<button type="button" class="btn btn-danger" id="sellBtn">
									판매신청
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-default" id="contentDisplayOn">
									내용보기
								</button>
								<button type="button" class="btn btn-default" id="contentDisplayOff">
									내용감추기
								</button>
							</c:otherwise>
						</c:choose>
					</center>
				</div>
				<!-- bedRoomDetailVisualRight -->
			</div>
			<!-- bedRoomDetailVisual -->
			<br />
			<hr />
			<div id="trade_content">
				<c:if test="${image2List != null}">
					<center>
						<c:forEach var="image2Name" items="${image2List}">
							<img src="buy/${buyDTO.buynum}_${buyDTO.email}/${image2Name}.jpg"
								width="80%" height="400px">
							<br />
						</c:forEach>
					</center>
				</c:if>
	
				<pre style="width: 95%; height: 30em; margin: 0 auto; background-color: white; color: black; border: 0px solid white;">${buyDTO.content}</pre>
			</div>
		</div>
		<c:if test="${tradeDTO == null}">
			<br />
	
			<p style="text-align: left;">
				<button type="button" class="btn btn-danger" onclick="buyUpdate('${login.email}', '${buyDTO.email}', '${buyDTO.buynum}','${buyPageDTO.curPage}','${category}', '${sort}', '${searchType}', '${searchValue}')">수정하기</button>
				<button type="button" class="btn btn-danger" onclick="buyDelete('${login.email}', '${buyDTO.email}', '${buyDTO.buynum}','${buyPageDTO.curPage}','${category}', '${sort}', '${searchType}', '${searchValue}')">삭제하기</button>
			</p>
		
			<br/><br />
			<hr />
			<br />
	
	
	<div id="panel-group" class="panel-group">
		<!-- 댓글 입력 폼 -->
		<c:if test="${!empty login}">
			<div class="panel panel-danger">
				<div class="panel-heading"><strong>댓글</strong></div>
				<div class="panel-body">
					<form id="comment" action="comment" method="post">
						<input type="hidden" name="call" value="comment" />
						<input type="hidden" name="category" value="buy"/>
						<input type="hidden" name="curPage" value="${buyPageDTO.curPage}"/> 
						<input type="hidden" name="boardnum" value="${buyDTO.buynum}"/>
						<input type="hidden" name="type" value="${searchType}" />
						<input type="hidden" name="value" value="${searchValue}" />
						<font color="black">
							<textarea id="usercomment" name="usercomment" rows="5" cols="100" style="border-style: none; outline: none; resize: none;" placeholder="여러분들의 소중한 의견을 작성해주세요."></textarea>
						</font>
					</form>
				</div>
			</div>
			<p style="text-align: right;">
				<button id="commentBtn" type="button" class="btn btn-danger">
					댓글작성
				</button>
			</p>
		</c:if>
				
			<br />
			<c:if test="${buyDTO.replecnt > 0}">
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
								<form action="updateComment" method="post" >
									<input type="hidden" name="num" value="${comment.num}" />
									<input type="hidden" name="category" value="${comment.category}" />
									<input type="hidden" name="boardnum" value="${comment.boardnum}"/>
									<input type="hidden" name="curPage" value="${buyPageDTO.curPage}"/>
									<input type="hidden" name="type" value="${searchType}" />
									<input type="hidden" name="value" value="${searchValue}" />
									<textarea name="usercomment" style="width: 80%; height: 5em; color: black;
										border-style: none; outline: none; float: left; resize: none; background-color: white;" disabled>${comment.usercomment}</textarea>
									<c:if test="${comment.email eq login.email}">
										<button type="button" class="btn btn-danger deleteComment" style="float: right; margin-bottom: 1px;">
											삭제하기
										</button>
										<button type="button" class="btn btn-danger commentUpdate" style="float: right; margin-top: 1px;">
											수정하기
										</button>
									</c:if>
								</form>
							</div>
						</div>
						<form name="recomment" action="comment" method="post">
							<input type="hidden" name="call" value="recomment" />
							<input type="hidden" name="curPage" value="${buyPageDTO.curPage}"/>
							<input type="hidden" name="category" value="${comment.category}" />
							<input type="hidden" name="parentComment" value="${comment.parentComment}"/>
							<input type="hidden" name="boardnum" value="${comment.boardnum}"/>
							<input type="hidden" name="ref" value="${comment.ref}"/>
							<input type="hidden" name="step" value="${comment.step +1}"/>
							<input type="hidden" name="comment_level" value="${comment.comment_level +1}"/>
							<input type="hidden" name="type" value="${searchType}" />
							<input type="hidden" name="value" value="${searchValue}" />
							<c:if test="${comment.comment_level <2}">
								<span style="text-align: right; float: none;">
									<textarea type="text" name="usercomment" class="recomment" style="float: left; margin-top: 0.5em; border-style: none; width:${100-(comment.comment_level+25)}%; height: 2.5em; outline: none; resize: none; overflow: hidden; margin-left: ${comment.comment_level*7.5}%;" placeholder="re: "></textarea>
									<button type="button" class="btn btn-danger" style="float: right;" onclick="reComment(${status.index});"> 
										답변하기
									</button>
								</span>
							</c:if>
						</form>
				<br /><br /><br />
			</c:forEach>
			
		</div>
			
		</c:if> 
	</div>
	<c:if test="${tradeDTO == null}"> <br /><br /><br /><br /><br /><hr /> </c:if>
</div>
