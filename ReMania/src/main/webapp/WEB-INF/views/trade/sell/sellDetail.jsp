<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	#bedRoomDetailWrap{width: 80%; height: auto; margin: 0 auto;}
	
	#bedRoomDetailVisual{width: 100%; height: 20em;}
	
	#bedRoomDetailVisualleft{width: 50%; height: 100%; float: left;}
	
	#bedRoomDetailVisualRight{height: 100%;}
	.visualRightTable{margin: 0 auto; text-align: left;}
	.visualRightTable .productName{color: gray; font-size: 15px; font: bold;}
	.visualRightTable .productPrice{color: #5b6bdf; font-size: 15px; font: bold;}
	.visualRightTable .productPrice2{color: red; font-size: 15px; font: bold;}
	.visualRightTable .productPrice3{color: #3f4993; font-size: 15px; font: bold;}
	
	#bedRoomDetailContent{width: 70%; height: auto; margin: 0 auto;}
	
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" />

	<div class="container">
		<div class="panel-group">
			<div class="panel panel-primary">
				<div class="panel-heading"><h2>제목</h2></div>
				<br />
				<div id="bedRoomDetailVisual">
					<div id="bedRoomDetailVisualleft">
						<center>
		   					<img src="images/test/sample1.jpg" width="80%" height="300px">
						</center>
					</div>
					<div id="bedRoomDetailVisualRight">
					
						<table class="visualRightTable" width="40%">
							<tr>
								<td class="productName" style="width: 30%">판매자</td>
								<td class="productName"><b>장명주</b></td>
							</tr>
						</table>
						<hr />
						<table class="visualRightTable" width="40%">
							<tr>
								<td class="productPrice">상품</td>
								<td class="productName">자전거</font>
								</td>
							</tr>
							<tr>
								<td class="productPrice">가격</td>
								<td	class="productPrice2">
									<%-- <del><fmt:formatNumber value="${bedRoomDTO.price}" type="currency" /></del> --%>
									100,000원
								</td>
							</tr>
						</table>
						<hr>
						<table class="visualRightTable" width="40%">
							<tr>
								<td class="productName" style="width: 30%">거래방법</td>
								<td class="productName">직거래</td>
							</tr>
							<tr>
								<td class="productName">지역</td>
								<td	class="productName">서울</td>
							</tr>
							<tr>
								<td class="productName">흥정</td>
								<td class="productName">가능</td>
							</tr>
						</table>
						<hr>
						<center>
							<button type="button" class="btn btn-primary" id="writeBtn">
								구매신청
							</button>
						</center>
				</div> <!-- bedRoomDetailVisualRight -->
			</div> <!-- bedRoomDetailVisual -->
			<br /><hr />
			
			<pre style="width: 95%; height: 40em; margin: 0 auto; background-color: white; 
					color: black; border: 0px solid white;">내용</pre>
		</div>
		<br />
		
		<p style="text-align: left;">
			<button type="button" class="btn btn-primary">
				수정하기
			</button>
			<button type="button" class="btn btn-primary">
				삭제하기
			</button>
		</p>
		
		<br /><hr /><br />
		
		<!-- 댓글 입력 폼 -->
		<div class="panel panel-primary">
			<div class="panel-heading"><strong>댓글</strong></div>
			<div class="panel-body">
				<form>
					<font color="black">
						<textarea rows="5" cols="130%" style="border: 0px solid white;">여러분들의 소중한 의견을 작성해주세요.</textarea>
					</font>
				</form>
			</div>
		</div>
		<p style="text-align: right;">
			<button type="button" class="btn btn-primary" id="writeBtn">
				댓글작성
			</button>
		</p>
			
		<br />
			
		<!-- 댓글 리스트 -->
		<div class="panel panel-default">
			<div class="panel-heading"><small>장명주　(2017-05-10 15:40)</small></div>
			<div class="panel-body">
				<pre style="width: 100%; height: 5em; background-color: white; color: black;
					border: 0px solid white;">댓글1</pre>
			</div>
		</div>
		<span style="text-align: left; float: left;">
			<button type="button" class="btn btn-primary">
				수정하기
			</button>
			<button type="button" class="btn btn-primary">
				삭제하기
			</button>
		</span>
		<br /><br /><br />
			
		<div class="panel panel-default">
			<div class="panel-heading"><small>장명주　(2017-05-10 15:40)</small></div>
			<div class="panel-body">
				<pre style="width: 100%; height: 5em; background-color: white; color: black;
					border: 0px solid white;">댓글2</pre>
			</div>
		</div>
		<span style="text-align: left; float: left;">
			<button type="button" class="btn btn-primary">
				답변하기
			</button>
		</span>
		<br /><br /><br />
		
		<!-- 답변 리스트 (답변이라면 이놈으로 시작해야함)-->
		<div style="float: left; width: 7.5%;">
			<br /><br /><br /><br />
			　<img src="images/answerArrow.png" width="25"/>
		</div>
		<div class="panel panel-default" style="width: 92.5%; margin-left: 7.5%;">
			<div class="panel-heading"><small>장명주　(2017-05-10 15:40)</small></div>
			<div class="panel-body">
				<pre style="width: 100%; height: 5em; background-color: white; color: black;
					border: 0px solid white;">댓글2</pre>
			</div>
		</div>
		<span style="text-align: left; margin-left: 7.5%;">
			<button type="button" class="btn btn-primary">
				답변하기
			</button>
		</span>
		<br /><br /><br />
		
		<div style="float: left; width: 7.5%;">
			<br /><br /><br /><br />
			　<img src="images/answerArrow.png" width="25"/>
		</div>
		<div class="panel panel-default" style="width: 92.5%; margin-left: 7.5%;">
			<div class="panel-heading"><small>장명주　(2017-05-10 15:40)</small></div>
			<div class="panel-body">
				<pre style="width: 100%; height: 5em; background-color: white; color: black;
					border: 0px solid white;">댓글2</pre>
			</div>
		</div>
		<span style="text-align: left; margin-left: 7.5%;">
			<button type="button" class="btn btn-primary">
				수정하기
			</button>
			<button type="button" class="btn btn-primary">
				삭제하기
			</button>
		</span>
		<br /><br /><br />
		
		<div class="panel panel-default">
			<div class="panel-heading"><small>장명주　(2017-05-10 15:40)</small></div>
			<div class="panel-body">
				<pre style="width: 100%; height: 5em; background-color: white; color: black;
					border: 0px solid white;">댓글2</pre>
			</div>
		</div>
		<span style="text-align: left; float: left;">
			<button type="button" class="btn btn-primary">
				답변하기
			</button>
		</span>
		
		<br /><br /><br /><br /><br /><br /><hr /><br /><br /><br /><br /><br /><br />
		
		<form class="form-inline">
			<div class="form-group">
				<select class="form-control">
					<option selected="selected">전체</option>
					<option>자전거</option>
					<option>카메라</option>
				</select>
			</div>
			<div class="form-group">
				<select class="form-control">
					<option selected="selected">기본옵션</option>
					<option>옵션2</option>
					<option>옵션3</option>
				</select>
			</div>
		</form>
		<br />
		
		<div class="row">
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel-heading">품목</div>
					<div class="panel-body">
						<img src="images/test/sample1.jpg" class="img-responsive"
							style="width: 100%; height: 15em;" alt="Image">
					</div>
					<div class="panel-footer">제목</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel-heading">품목</div>
					<div class="panel-body">
						<img src="images/test/sample1.jpg" class="img-responsive"
							style="width: 100%; height: 15em;" alt="Image">
					</div>
					<div class="panel-footer">제목</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel-heading">품목</div>
					<div class="panel-body">
						<img src="images/test/sample1.jpg" class="img-responsive"
							style="width: 100%; height: 15em;" alt="Image">
					</div>
					<div class="panel-footer">제목</div>
				</div>
			</div>
		</div> <!-- row -->
		<div class="row">
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel-heading">품목</div>
					<div class="panel-body">
						<img src="images/test/sample1.jpg" class="img-responsive"
							style="width: 100%; height: 15em;" alt="Image">
					</div>
					<div class="panel-primary">제목</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel-heading">품목</div>
					<div class="panel-body">
						<img src="images/test/sample1.jpg" class="img-responsive"
							style="width: 100%; height: 15em;" alt="Image">
					</div>
					<div class="panel-footer">제목</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel-heading">품목</div>
					<div class="panel-body">
						<img src="images/test/sample1.jpg" class="img-responsive"
							style="width: 100%; height: 15em;" alt="Image">
					</div>
					<div class="panel-footer">제목</div>
				</div>
			</div>
		</div><!-- row -->
		<div class="row">
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel-heading">품목</div>
					<div class="panel-body">
						<img src="images/test/sample1.jpg" class="img-responsive"
							style="width: 100%; height: 15em;" alt="Image">
					</div>
					<div class="panel-footer">제목</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel-heading">품목</div>
					<div class="panel-body">
						<img src="images/test/sample1.jpg" class="img-responsive"
							style="width: 100%; height: 15em;" alt="Image">
					</div>
					<div class="panel-footer">제목</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel-heading">품목</div>
					<div class="panel-body">
						<img src="images/test/sample1.jpg" class="img-responsive"
							style="width: 100%; height: 15em;" alt="Image">
					</div>
					<div class="panel-footer">제목</div>
				</div>
			</div>
		</div><!-- row -->
		<br />
		
		<div id="paging" style="width: 44em; margin: 0 auto;">
			<ul class="pager" style="float: left;">
				<li><a href="#">처음</a></li>
				<li><a href="#"><</a></li>
			</ul>
			<ul class="pagination" style="float: left;">
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#">10</a></li>
			</ul>
			<ul class="pager" style="float: left;">
				<li><a href="#">></a></li>
				<li><a href="#">맨끝</a></li>
			</ul>
			<br />
			<br />
			<br />
			<br />
		</div>
		<p style="text-align: right;">
			<button type="button" class="btn btn-primary" id="writeBtn">
				삽니다 등록
			</button>
		</p>
		
	</div></div>

	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>