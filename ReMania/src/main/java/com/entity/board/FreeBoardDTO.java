package com.entity.board;

public class FreeBoardDTO {
	
	private int freeboardnum;	//게시판번호
	private String email;		//작성자 이메일
	private String author;		//작성자 이름
	private String title;		//제목
	private String content;		//내용
	private String writeday;	//작성일
	private int readcnt;		//조회
	private int replecnt;		//댓글수
	
	public FreeBoardDTO() {
		super();
	}

	public FreeBoardDTO(int freeboardnum, String email, String author, String title, String content, String writeday,
			int readcnt, int replecnt) {
		super();
		this.freeboardnum = freeboardnum;
		this.email = email;
		this.author = author;
		this.title = title;
		this.content = content;
		this.writeday = writeday;
		this.readcnt = readcnt;
		this.replecnt = replecnt;
	}

	@Override
	public String toString() {
		return "FreeBoardDTO [freeboardnum=" + freeboardnum + ", email=" + email + ", author=" + author + ", title="
				+ title + ", content=" + content + ", writeday=" + writeday + ", readcnt=" + readcnt + ", replecnt="
				+ replecnt + "]";
	}

	public int getFreeboardnum() {
		return freeboardnum;
	}

	public void setFreeboardnum(int freeboardnum) {
		this.freeboardnum = freeboardnum;
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

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public int getReplecnt() {
		return replecnt;
	}

	public void setReplecnt(int replecnt) {
		this.replecnt = replecnt;
	}

}
