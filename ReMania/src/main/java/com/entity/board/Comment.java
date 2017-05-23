package com.entity.board;

import org.apache.ibatis.type.Alias;

@Alias("Comment")
public class Comment {
	private int comment_level;		//댓글 깊이 
	private int ref ;			// root 댓글 = 최상위 댓글 번호
	private int step;			//댓글 출력 순서 구분
	private int parentComment;			// 상위 댓글 = 부모 고유번호
	private	Integer num;		//댓글 고유번호 (pk)
	private	int boardnum;	// 파라미터 넘길 필요 없이 그냥 게시물 삭제시 지우게 게시물번호 (fk) -> 게시글 삭제되면 댓글도 같이 삭제 (cascade)
	private String category; // 그냥 table 하나로 댓 글 관리하려고 넣었어요.
	private String email;
	private String author;
	private String usercomment;
	private String writeday;
	
	public Comment() {}

	public Comment(int comment_level, int ref, int step, int parentComment, Integer num, int boardnum, String category,
			String email, String author, String usercomment, String writeday) {
		this.comment_level = comment_level;
		this.ref = ref;
		this.step = step;
		this.parentComment = parentComment;
		this.num = num;
		this.boardnum = boardnum;
		this.category = category;
		this.email = email;
		this.author = author;
		this.usercomment = usercomment;
		this.writeday = writeday;
	}

	public int getComment_level() {
		return comment_level;
	}

	public void setComment_level(int comment_level) {
		this.comment_level = comment_level;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getParentComment() {
		return parentComment;
	}

	public void setParentComment(int parentComment) {
		this.parentComment = parentComment;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getUsercomment() {
		return usercomment;
	}

	public void setUsercomment(String usercomment) {
		this.usercomment = usercomment;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	@Override
	public String toString() {
		return "Comment [comment_level=" + comment_level + ", ref=" + ref + ", step=" + step + ", parentComment="
				+ parentComment + ", num=" + num + ", boardnum=" + boardnum + ", category=" + category + ", email="
				+ email + ", author=" + author + ", usercomment=" + usercomment + ", writeday=" + writeday + "]";
	}

}// end Comment
