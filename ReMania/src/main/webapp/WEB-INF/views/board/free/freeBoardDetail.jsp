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

	<br /><br /><br /><br /><br /><br />
	<center><font size="100"><b>자유게시판</b></font></center>

	<div class="container">
		<div class="alert alert-success">
			<strong>작&nbsp;&nbsp;성&nbsp;&nbsp;자</strong>&nbsp;&nbsp;
			<font color="black">장명주</font>　　　　　　　　　　　　　　　　<!-- 공백 건들지 말 것. -->
			
			<small>
				<strong>날　　짜</strong>&nbsp;&nbsp;
				<font color="black">2017-05-10</font>
			</small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<small>
				<strong>조&nbsp;&nbsp;회&nbsp;&nbsp;수</strong>&nbsp;&nbsp;&nbsp;
				<font color="black">26</font>
			</small>
			
			<br /><br />
			
			<strong>제　　목</strong>&nbsp;&nbsp;
			<font color="black">제목</font>
			<br /><br />
		
			<strong>내　　용</strong><br />
			<pre style="width: 100%; height: 40em; background-color: white; color: black;"></pre>
			<br /><br />
			
			<!-- 댓글 입력 폼 -->
			<strong>댓글</strong><br />
			<form>
				<font color="black">
					<textarea rows="3" cols="87%">여러분들의 소중한 의견을 작성해주세요.</textarea>
				</font>
			</form>
			<p style="text-align: right;">
				<button type="button" class="btn btn-success" id="writeBtn">
					댓글작성
				</button>
			</p>
			
			<hr />
			
			<!-- 댓글 리스트 -->
			<small>장명주　(2017-05-10 15:40)</small><br />
			<pre style="width: 68.7em; height: 5em; background-color: white; color: black;">댓글1</pre>
			<span style="text-align: left; float: left;">
				<button type="button" class="btn btn-success">
					수정하기
				</button>
				<button type="button" class="btn btn-success">
					삭제하기
				</button>
			</span>
			<br /><br /><hr />
			
			<small>장명주　(2017-05-10 15:40)</small><br />
			<pre style="width: 68.7em; height: 5em; background-color: white; color: black;">댓글2</pre>
			<span style="text-align: left; float: left;">
				<button type="button" class="btn btn-success">
					답변하기
				</button>
			</span>
			<br /><br />
			
			<!-- 답변 리스트 (답변이라면 이놈으로 시작해야함)-->
			<div>
				<!-- 반복문시작 -->
				<div style="float: left; width: 7.5%;">
						<br />
					　<img src="images/answerArrow.png" width="25"/>
				</div>
				
				<!-- 작성자와 로그인 아이디가 같으면 시작 (if문) -->
				<div style="width: 100%;">
					<small>장명주　(2017-05-10 17:10)</small><br />
					<pre style="width: 63.5em; height: 5em; background-color: white; color: black;">답변</pre>
					
					<!-- 버튼 옆에 공백 건들지말것 -->
					　　　&nbsp;<button type="button" class="btn btn-success">
						삭제하기
					</button>
				</div>
				<br />
				<!-- 작성자와 로그인 아이디가 같으면 끝 -->
				
				<!-- 이건 위에 겹치는 div. 걍 지우셈 시작-->
				<div style="float: left; width: 7.5%;">
						<br />
					　<img src="images/answerArrow.png" width="25"/>
				</div>
				<!-- 지우셈 끝 -->
				
				<!-- 작성자와 로그인 아이디가 같지 않으면 시작 -->
				<div style="width: 100%;">
					<small>장명주　(2017-05-10 17:10)</small><br />
					<pre style="width: 63.5em; height: 5em; background-color: white; color: black;">답변</pre>
				</div>
				<!-- 작성자와 로그인 아이디가 같지 않으면 끝 -->
				<!-- 반복문 끝 -->
				
				<!-- 지우셈 시작-->
				<div style="float: left; width: 7.5%;">
						<br />
					　<img src="images/answerArrow.png" width="25"/>
				</div>
				<div style="width: 100%;">
					<small>장명주　(2017-05-10 17:10)</small><br />
					<pre style="width: 63.5em; height: 5em; background-color: white; color: black;">답변</pre>
				</div>
				<!-- 지우셈 끝-->
				
			</div>
			
			<hr />
			
			<small>장명주　(2017-05-10 15:40)</small><br />
			<pre style="width: 68.7em; height: 5em; background-color: white; color: black;">댓글3</pre>
			<span style="text-align: left; float: left;">
				<button type="button" class="btn btn-success">
					답변하기
				</button>
			</span>
			<br /><br /><hr />
		</div>
		
		<p style="text-align: left; float: left;">
			<button type="button" class="btn btn-success">
				수정하기
			</button>
			<button type="button" class="btn btn-success">
				삭제하기
			</button>
		</p>
		
		<br /><br /><br /><br /><hr /><br /><br />
		
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
			    <td  width="250" align="center">
			    	<a href="freeBoardDetail">제목</a>
			    </td>
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
			<button type="button" class="btn btn-success" id="writeBtn">
				글작성
			</button>
		</p>
		
	</div>

	<jsp:include page="../../include/footer.jsp" flush="true" />
</body>
</html>