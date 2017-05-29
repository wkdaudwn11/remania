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
		
		$("#sellBtn").on("click", function(){
			var hiddenForm = document.getElementById("hiddenForm");
			var buyerEmail = '${buyDTO.email}'; // 게시글 작성자 이메일(구매자 이메일로도 쓰임)
			var loginEmail = '${login.email}'; // 로그인 이메일 (판매자 이메일로도 쓰임)
			var addr = '${login.addr1}';
			var tel = '${login.tel}';
			
			if(loginEmail == "" || loginEmail == null){
				alert('로그인을 하셔야 판매신청을 할 수 있습니다.');
			}else if(loginEmail == buyerEmail){
				alert('자신의 글은 판매신청을 할 수 없습니다.');
			}else{
				if((tel == 'tel' || addr == null) && loginEmail != "admin"){
					if(confirm("연락처와 주소를 등록하셔야 거래할 수 있습니다. 등록하시겠습니까?")){
						location.replace("updateMemberUI");
					}
				}else if(addr == '1' && loginEmail != "admin"){
					if(confirm("주소를 등록하셔야 거래할 수 있습니다. 등록하시겠습니까?")){
						location.replace("pwdCheck");
					}
				}else{
					
					if(confirm("판매신청이 되었습니다. 거래화면으로 이동하시겠습니까?")){
						hiddenForm.action = "trade";
						hiddenForm.submit();
					}
				}
			}
		});//sellBtn on click
		
		$("#contentOpenBtn").addClass("displayNone");
		var toggleCount = 0;
		$("#contentOpenBtn, #contentCloseBtn").on("click", function(){
			toggleCount++;
			$("#content").toggle("slow");
			if(toggleCount%2 == 1){
				$("#contentCloseBtn").addClass("displayNone");
				$("#contentOpenBtn").removeClass("displayNone");
			}else{
				$("#contentCloseBtn").removeClass("displayNone");
				$("#contentOpenBtn").addClass("displayNone");
			}
		});// 내용보기, 내용감추기 on click
		
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
				<div class="panel-heading"  style="background-color: #d9534f;">
					<h2 style="color: white;">${buyDTO.title}</h2>
				</div>
		</c:if>
		<c:if test="${tradeDTO != null}">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2>${buyDTO.title}</h2>
				</div>
		</c:if>
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
			</div> <!-- #bedRoomDetailVisualleft -->
				
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
					<c:if test="${buyDTO.tradeway != '합의 후 결정'}">
						<tr>
							<td class="productName">지역</td>
							<td class="productName">${buyDTO.location}</td>
						</tr>
					</c:if>
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
							<button type="button" class="btn btn-default" id="contentOpenBtn">
								내용보기
							</button>
							<button type="button" class="btn btn-default" id="contentCloseBtn">
								내용감추기
							</button>
						</c:otherwise>
					</c:choose>
				</center>
			</div> <!-- bedRoomDetailVisualRight -->
		</div><!-- bedRoomDetailVisual -->
			
		<br />
		<hr />
		<div id="content">
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
		</div> <!-- content -->
	</div> <!-- .panel-group -->
		
	<c:if test="${tradeDTO == null}">
		<br />

		<p style="text-align: left;">
			<button type="button" class="btn btn-danger" onclick="buyUpdate('${login.email}', '${buyDTO.email}', '${buyDTO.buynum}','${buyPageDTO.curPage}','${category}', '${sort}', '${searchType}', '${searchValue}')">수정하기</button>
			<button type="button" class="btn btn-danger" onclick="buyDelete('${login.email}', '${buyDTO.email}', '${buyDTO.buynum}','${buyPageDTO.curPage}','${category}', '${sort}', '${searchType}', '${searchValue}')">삭제하기</button>
		</p>
	
		<br />
		<hr />
		<br />

		<!-- 댓글 입력 폼 -->
		<c:if test="${!empty login}">
			<div class="panel panel-danger">
				<div class="panel-heading" style="background-color: #d9534f;">
					<strong><font color="white">댓글</font></strong>
				</div>
				<div class="panel-body">
					<form>
						<font color="black"> <textarea rows="5" cols="130%"
								style="border: 0px solid white;">여러분들의 소중한 의견을 작성해주세요.</textarea>
						</font>
					</form>
				</div>
			</div>
			<p style="text-align: right;">
				<button type="button" class="btn btn-danger" id="writeBtn">
					댓글작성</button>
			</p>

			<br />
		</c:if>

		<!-- 댓글 리스트 -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<small>장명주 (2017-05-10 15:40)</small>
			</div>
			<div class="panel-body">
				<pre
					style="width: 100%; height: 5em; background-color: white; color: black; border: 0px solid white;">댓글1</pre>
			</div>
		</div>
		<span style="text-align: left; float: left;">
			<button type="button" class="btn btn-danger">수정하기</button>
			<button type="button" class="btn btn-danger">삭제하기</button>
		</span> <br />
		<br />
		<br />

		<div class="panel panel-default">
			<div class="panel-heading">
				<small>장명주 (2017-05-10 15:40)</small>
			</div>
			<div class="panel-body">
				<pre
					style="width: 100%; height: 5em; background-color: white; color: black; border: 0px solid white;">댓글2</pre>
			</div>
		</div>
		<span style="text-align: left; float: left;">
			<button type="button" class="btn btn-danger">답변하기</button>
		</span> <br />
		<br />
		<br />

		<!-- 답변 리스트 (답변이라면 이놈으로 시작해야함)-->
		<div style="float: left; width: 7.5%;">
			<br />
			<br />
			<br />
			<br /> <img src="images/answerArrow.png" width="25" />
		</div>
		<div class="panel panel-default"
			style="width: 92.5%; margin-left: 7.5%;">
			<div class="panel-heading">
				<small>장명주 (2017-05-10 15:40)</small>
			</div>
			<div class="panel-body">
				<pre
					style="width: 100%; height: 5em; background-color: white; color: black; border: 0px solid white;">댓글2</pre>
			</div>
		</div>
		<span style="text-align: left; margin-left: 7.5%;">
			<button type="button" class="btn btn-danger">답변하기</button>
		</span> <br />
		<br />
		<br />

		<div style="float: left; width: 7.5%;">
			<br />
			<br />
			<br />
			<br /> <img src="images/answerArrow.png" width="25" />
		</div>
		<div class="panel panel-default"
			style="width: 92.5%; margin-left: 7.5%;">
			<div class="panel-heading">
				<small>장명주 (2017-05-10 15:40)</small>
			</div>
			<div class="panel-body">
				<pre
					style="width: 100%; height: 5em; background-color: white; color: black; border: 0px solid white;">댓글2</pre>
			</div>
		</div>
		<span style="text-align: left; margin-left: 7.5%;">
			<button type="button" class="btn btn-danger">수정하기</button>
			<button type="button" class="btn btn-danger">삭제하기</button>
		</span> <br />
		<br />
		<br />

		<div class="panel panel-default">
			<div class="panel-heading">
				<small>장명주 (2017-05-10 15:40)</small>
			</div>
			<div class="panel-body">
				<pre
					style="width: 100%; height: 5em; background-color: white; color: black; border: 0px solid white;">댓글2</pre>
			</div>
		</div>
		<span style="text-align: left; float: left;">
			<button type="button" class="btn btn-danger">답변하기</button>
		</span>
	</c:if>
	<c:if test="${tradeDTO == null}"> <br /><br /><br /><br /><br /><hr /> </c:if>
	</div>
</div> <!-- .container -->