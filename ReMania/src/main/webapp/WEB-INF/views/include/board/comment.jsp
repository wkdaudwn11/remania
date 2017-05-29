<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="panel-group" class="panel-group">
			<!-- 댓글 입력 폼 -->
			<div class="panel panel-success">
				<div class="panel-heading"><strong>댓글</strong></div>
				<div class="panel-body">
					<form id="comment" action="comment" method="post">
						<input type="hidden" name="call" value="comment" />
						<input type="hidden" name="curPage" value="${FreeBoardPage.curPage}"/>
						<input type="hidden" name="boardnum" value="${board.freeboardnum}"/>
						<font color="black">
							<textarea id="usercomment" name="usercomment" rows="5" cols="100" style="border-style: none; outline: none; resize: none;" placeholder="여러분들의 소중한 의견을 작성해주세요."></textarea>
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
								<form action="updateComment" method="post" >
									<input type="hidden" name="num" value="${comment.num}" />
									<input type="hidden" name="category" value="${comment.category}" />
									<input type="hidden" name="boardnum" value="${comment.boardnum}"/>
									<input type="hidden" name="curPage" value="${FreeBoardPage.curPage}"/>
									<textarea name="usercomment" style="width: 80%; height: 5em; color: black;
										border-style: none; outline: none; float: left; resize: none; background-color: white;" disabled>${comment.usercomment}</textarea>
									<c:if test="${comment.email eq login.email}">
										<button type="button" class="btn btn-success deleteComment" style="float: right; margin-bottom: 1px;">
											삭제하기
										</button>
										<button type="button" class="btn btn-success commentUpdate" style="float: right; margin-top: 1px;">
											수정하기
										</button>
									</c:if>
								</form>
							</div>
						</div>
						<form name="recomment" action="comment" method="post">
							<input type="hidden" name="call" value="recomment" />
							<input type="hidden" name="curPage" value="${FreeBoardPage.curPage}"/>
							<input type="hidden" name="category" value="${comment.category}" />
							<input type="hidden" name="parentComment" value="${comment.parentComment}"/>
							<input type="hidden" name="boardnum" value="${comment.boardnum}"/>
							<input type="hidden" name="ref" value="${comment.ref}"/>
							<input type="hidden" name="step" value="${comment.step +1}"/>
							<input type="hidden" name="comment_level" value="${comment.comment_level +1}"/>
							<c:if test="${comment.comment_level <2}">
								<span style="text-align: right; float: none;">
									<textarea type="text" name="usercomment" class="recomment" style="float: left; margin-top: 0.5em; border-style: none; width:${100-(comment.comment_level+25)}%; height: 2.5em; outline: none; resize: none; overflow: hidden; margin-left: ${comment.comment_level*7.5}%;" placeholder="re: "></textarea>
									<button type="button" class="btn btn-success" style="float: right;" onclick="reComment(${status.index});"> 
										답변하기
									</button>
								</span>
							</c:if>
						</form>
				<br /><br /><br />
			</c:forEach>