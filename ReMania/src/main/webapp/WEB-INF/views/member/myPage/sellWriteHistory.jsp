<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania</title>

<style>
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

		<br /><br /><br /><br />

		<div class="panel-group">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<font size="5">[장명주]</font>
					<font size="4">님이 팝니다에 등록한 게시글 입니다.</font>　
				</div>
				<!-- .panel-heading -->
				<div class="panel-body">

					<p>글목록(전체 글: 999)</p>

					<!-- 게시판 리스트 -->
					<table width="100%" cellpadding="0" cellspacing="0" border="0"
						class="boardList">
						<tr height="30">
							<th width="50">번 호</th>
							<th width="100">사 진</th>
							<th width="200">제 목</th>
							<th width="50">작성자</th>
							<th width="150">작성일</th>
							<th width="50">조 회</th>
						</tr>
						<tr height="30">
							<td width="50" align="center">10</td>
							<td width="50" align="center">
								<img src="images/test/sample1.jpg" width="50" height="50">
							</td>
							<td width="200" align="center">
								<a href="freeBoardDetail">제목</a>
							</td>
							<td width="50" align="center">작성자</td>
							<td width="150" align="center">2017-05-09</td>
							<td width="50" align="center">10</td>
						</tr>
					</table>
					<!-- boardList -->

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
					</div>

				</div>
				<!-- .panel-body -->
			</div>
			<!-- .panel panel-primary -->
		</div>
		<!-- .panel-group -->
		
		<p style="text-align: left; float: left;">
			<button type="button" class="btn btn-primary" id="writeBtn">
				판매중인상품
			</button>
			<button type="button" class="btn btn-primary" id="writeBtn">
				판매종료내역
			</button>
		</p>

		<p style="text-align: right;">
			<button type="button" class="btn btn-primary" id="writeBtn">
				마이페이지로 돌아가기
			</button>
		</p>

	</div>
	<!-- .container -->
	<br /><br />
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>