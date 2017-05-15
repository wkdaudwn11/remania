package com.entity.trade;

import org.apache.ibatis.type.Alias;

@Alias("BuyDTO")
public class BuyDTO {

	private int buynum;			//삽니다번호
	private String category;	//분류
	private String email; 		//작성자의 이메일
	private String author;		//작성자 이름
	private String title;		//제목
	private String content;		//내용
	private String writeday;	//작성날짜
	private int readcnt;		//조회수
	private int replecnt;		//댓글수
	private String images;		//등록한 사진들
	
	public BuyDTO() {
		super();
	}

	public BuyDTO(int buynum, String category, String email, String author, String title, String content,
			String writeday, int readcnt, int replecnt, String images) {
		super();
		this.buynum = buynum;
		this.category = category;
		this.email = email;
		this.author = author;
		this.title = title;
		this.content = content;
		this.writeday = writeday;
		this.readcnt = readcnt;
		this.replecnt = replecnt;
		this.images = images;
	}

	@Override
	public String toString() {
		return "BuyDTO [buynum=" + buynum + ", category=" + category + ", email=" + email + ", author=" + author
				+ ", title=" + title + ", content=" + content + ", writeday=" + writeday + ", readcnt=" + readcnt
				+ ", replecnt=" + replecnt + ", images=" + images + "]";
	}

	public int getBuynum() {
		return buynum;
	}

	public void setBuynum(int buynum) {
		this.buynum = buynum;
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

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}
	
}
