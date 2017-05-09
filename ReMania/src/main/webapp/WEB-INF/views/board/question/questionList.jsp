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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#writeBtn").on("click", function(){
			location.replace('questionWrite');
		})
		
	});


</script>

</head>
<body>
	<jsp:include page="../../include/nav.jsp" flush="true" />
	
	<br /><br /><br /><br /><br /><br />
	<center>
		<font size="100"><b>질문과답변</b></font><br /><br />
		<form class="form-inline">
			<div class="form-group">
				<select class="form-control">
					<option selected="selected">제목</option>
					<option>내용</option>
				</select>
			</div>
			<input type="text" class="form-control" size="50"
				placeholder="검색어를 입력하세요.">
			<button type="button" class="btn btn-default">Search</button>
		</form>
	</center>
		
	<div class="container">
	
		<p>글목록(전체 글: 999)</p>
				
		<!-- 게시판 리스트 -->
		<table width="100%" cellpadding="0" cellspacing="0" border="0" class="boardList">
			<tr height="30"> 
				<th width="50">번 호</td> 
				<th width="250">제   목</td> 
			    <th width="100">작성자</td>
			    <th width="150">작성일</td> 
			    <th width="50">조 회</td>
			</tr>
			<tr height="30">
				<td  width="50" align="center" >10</td>
			    <td  width="250" align="center">제목</td>
				<td width="100" align="center">작성자</td>			    
			    <td width="150" align="center">2017-05-09</td>
			    <td width="50" align="center">10</td>
			</tr>
			<tr height="30">
				<td  width="50" align="center" >9</td>
			    <td  width="250" align="center">제목</td>
				<td width="100" align="center">작성자</td>			    
			    <td width="150" align="center">2017-05-09</td>
			    <td width="50" align="center">10</td>
			</tr>
			<tr height="30">
				<td  width="50" align="center" >8</td>
			    <td  width="250" align="center">제목</td>
				<td width="100" align="center">작성자</td>			    
			    <td width="150" align="center">2017-05-09</td>
			    <td width="50" align="center">10</td>
			</tr>
			<tr height="30">
				<td  width="50" align="center" >7</td>
			    <td  width="250" align="center">제목</td>
				<td width="100" align="center">작성자</td>			    
			    <td width="150" align="center">2017-05-09</td>
			    <td width="50" align="center">10</td>
			</tr>
			<tr height="30">
				<td  width="50" align="center" >6</td>
			    <td  width="250" align="center">제목</td>
				<td width="100" align="center">작성자</td>			    
			    <td width="150" align="center">2017-05-09</td>
			    <td width="50" align="center">10</td>
			</tr>
			<tr height="30">
				<td  width="50" align="center" >5</td>
			    <td  width="250" align="center">제목</td>
				<td width="100" align="center">작성자</td>			    
			    <td width="150" align="center">2017-05-09</td>
			    <td width="50" align="center">10</td>
			</tr>
			<tr height="30">
				<td  width="50" align="center" >4</td>
			    <td  width="250" align="center">제목</td>
				<td width="100" align="center">작성자</td>			    
			    <td width="150" align="center">2017-05-09</td>
			    <td width="50" align="center">10</td>
			</tr>
			<tr height="30">
				<td  width="50" align="center" >2</td>
			    <td  width="250" align="center">제목</td>
				<td width="100" align="center">작성자</td>			    
			    <td width="150" align="center">2017-05-09</td>
			    <td width="50" align="center">10</td>
			</tr>
			<tr height="30">
				<td  width="50" align="center" >3</td>
			    <td  width="250" align="center">제목</td>
				<td width="100" align="center">작성자</td>			    
			    <td width="150" align="center">2017-05-09</td>
			    <td width="50" align="center">10</td>
			</tr>
			<tr height="30">
				<td  width="50" align="center" >2</td>
			    <td  width="250" align="center">제목</td>
				<td width="100" align="center">작성자</td>			    
			    <td width="150" align="center">2017-05-09</td>
			    <td width="50" align="center">10</td>
			</tr>
			<tr height="30">
				<td  width="50" align="center" >1</td>
			    <td  width="250" align="center">제목</td>
				<td width="100" align="center">작성자</td>			    
			    <td width="150" align="center">2017-05-09</td>
			    <td width="50" align="center">10</td>
			</tr>
		</table> <!-- boardList -->
	
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
			<button type="button" class="btn btn-default" id="writeBtn">
				문의하기
			</button>
		</p>
	</div>
	
	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>