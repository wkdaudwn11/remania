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
.alert {
	font-size: 1.5em;
}

.boardList {
	font-size: 1em;
}

.boardList th, .boardList td {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	padding: 14px 0 10px 0;
}

.boardList th {
	background: #f8f8f8;
	text-align: center;
}

#reple {
	background-color: #FFFFFF;
}

#repleWriteFormleft {
	float: left;
}

#bedRoomDetailWrap {
	width: 80%;
	height: auto;
	margin: 0 auto;
}

#bedRoomDetailVisual {
	width: 100%;
	height: 20em;
}

#bedRoomDetailVisualleft {
	width: 50%;
	height: 100%;
	float: left;
}

#bedRoomDetailVisualRight {
	height: 100%;
}

.visualRightTable {
	margin: 0 auto;
	text-align: left;
}

.visualRightTable .productName {
	color: gray;
	font-size: 15px;
	font: bold;
}

.visualRightTable .productPrice {
	color: #5b6bdf;
	font-size: 15px;
	font: bold;
}

.visualRightTable .productPrice2 {
	color: red;
	font-size: 15px;
	font: bold;
}

.visualRightTable .productPrice3 {
	color: #3f4993;
	font-size: 15px;
	font: bold;
}

#bedRoomDetailContent {
	width: 70%;
	height: auto;
	margin: 0 auto;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
	});
	
	//게시글 삭제 함수
	function buyDelete(loginEmail, memberEmail, buynum, curPage, category, sort, searchType, searchValue){
		
		alert("memberEmail: "+memberEmail);
		alert("loginEmail: "+loginEmail);
		
		if(loginEmail == ''){ // 로그인 안했으면 일단 buyDelete로 넘김. (buyDelete에서 interceptor로 인해서 로그인 화면으로 넘어감.)
			location.replace("buyDelete?buynum="+buynum+"&curPage="+curPage+"&category="+category+"&sort="+sort+"&searchType="+searchType+"&searchValue="+searchValue);
		}else if(loginEmail != memberEmail){ // 로그인 한 계정과 작성자가 틀리면 경고창을 띄어줌.
			alert('작성자만 삭제 할 수 있습니다.');
		}else{ // 나머지의 경우에는 삭제 할 것인지 다시 한 번 물어봄.
			if(confirm("게시글을 정말로 삭제하시겠습니까?")){
				location.replace("buyDelete?buynum="+buynum+"&curPage="+curPage+"&category="+category+"&sort="+sort+"&searchType="+searchType+"&searchValue="+searchValue);
			}
		}
		
	}
</script>

</head>
<body>

	<c:set var="login" value="${login}" scope="session" />
	<c:set var="buyDTO" value="${buyDTO}" scope="request" />

	<c:set var="buyPageDTO" value="${buyPageDTO}" scope="request" />
	<!-- 페이징 처리에 필요한 data가진 class -->
	<c:set var="category" value="${category}" scope="request" />
	<c:set var="sort" value="${sort}" scope="request" />
	<c:set var="searchType" value="${searchType}" scope="request" />
	<!-- 검색분류 -->
	<c:set var="searchValue" value="${searchValue}" scope="request" />
	<!-- 검색내용 -->

	<jsp:include page="../../include/nav.jsp" flush="true" />

	<div class="container">
		<div class="panel-group">
			<div class="panel panel-danger">
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
										src="buy/${buyDTO.buynum}_${buyDTO.title}/${buyDTO.image1}.jpg"
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
								<td class="productName" style="width: 30%">구매자</td>
								<td class="productName"><b><font color="#7777ca">${buyDTO.author}</font></b></td>
							</tr>
						</table>
						<hr />
						<table class="visualRightTable" width="40%">
							<tr>
								<td>상품</td>
								<td>${buyDTO.category}</font>
								</td>
							</tr>
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
						</table>
						<hr>
						<table class="visualRightTable" width="40%">
							<tr>
								<td class="productName" style="width: 30%">거래방법</td>
								<td class="productName">${buyDTO.tradeway}</td>
							</tr>
							<tr>
								<td class="productName">지역</td>
								<td class="productName">서울</td>
							</tr>
						</table>
						<hr>
						<center>
							<button type="button" class="btn btn-danger" id="writeBtn">
								판매신청</button>
						</center>
					</div>
					<!-- bedRoomDetailVisualRight -->
				</div>
				<!-- bedRoomDetailVisual -->
				<br />
				<hr />

				<c:if test="${image2List != null}">
					<center>
						<c:forEach var="image2Name" items="${image2List}">
							<img src="buy/${buyDTO.buynum}_${buyDTO.title}/${image2Name}.jpg"
								width="80%" height="400px">
							<br />
						</c:forEach>
					</center>
				</c:if>

				<pre style="width: 95%; height: 30em; margin: 0 auto; background-color: white; color: black; border: 0px solid white;">${buyDTO.content}</pre>
			</div>
			<br />

			<p style="text-align: left;">
				<button type="button" class="btn btn-danger">수정하기</button>
				<button type="button" class="btn btn-danger" onclick="buyDelete('${login.email}', '${buyDTO.email}', '${buyDTO.buynum}','${buyPageDTO.curPage}','${category}', '${sort}', '${searchType}', '${searchValue}')">삭제하기</button>
			</p>

			<br />
			<hr />
			<br />

			<!-- 댓글 입력 폼 -->
			<c:if test="${!empty login}">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<strong>댓글</strong>
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
		</div>
	</div>

	<hr />

	<jsp:include page="buyListInclude.jsp" flush="true" />

	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>