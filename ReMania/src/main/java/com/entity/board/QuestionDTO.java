package com.entity.board;

import org.apache.ibatis.type.Alias;

@Alias("QuestionDTO")
public class QuestionDTO {

	private int registernum;	//문의 글번호
	private Integer ref;
	private int comment_level;
	private String category;		// 문의 유형,분류
	private String email;		//작성자 이메일
	private String author;		//작성자 이름
	private String title;		//제목
	private String content;		//내용
	private String writeday;	//작성일
	private String state;
	
	public QuestionDTO() {}

	public QuestionDTO(int ref, int registernum, int comment_level, String category, String email, String author,
			String title, String content, String writeday, String state) {
		this.ref = ref;
		this.registernum = registernum;
		this.comment_level = comment_level;
		this.category = category;
		this.email = email;
		this.author = author;
		this.title = title;
		this.content = content;
		this.writeday = writeday;
		this.state = state;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRegisternum() {
		return registernum;
	}

	public void setRegisternum(int registernum) {
		this.registernum = registernum;
	}

	public int getComment_level() {
		return comment_level;
	}

	public void setComment_level(int comment_level) {
		this.comment_level = comment_level;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "QuestionDTO [registernum=" + registernum + ", ref=" + ref + ", comment_level=" + comment_level
				+ ", category=" + category + ", email=" + email + ", author=" + author + ", title=" + title
				+ ", content=" + content + ", writeday=" + writeday + ", state=" + state + "]";
	}
	
}// end class
