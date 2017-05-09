<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remania Sell</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#writeBtn").on("click", function(){
			location.replace('sellWrite');
		})
		
	});
</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" />
	
	<br /><br /><br /><br /><br /><br />
	<center>
		<font size="100"><b>팝니다</b></font><br /><br />
		<form class="form-inline">
			<div class="form-group">
				<select class="form-control">
					<option selected="selected">제목</option>
					<option>내용</option>
				</select>
			</div>
			<input type="text" class="form-control" size="50"
				placeholder="검색어를 입력하세요.">
			<button type="button" class="btn btn-primary">Search</button>
		</form>
	</center>

	<div class="container">
	
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
				팝니다 등록
			</button>
		</p>
		
	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>