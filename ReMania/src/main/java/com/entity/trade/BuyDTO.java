package com.entity.trade;

import java.util.Arrays;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Alias("BuyDTO")
public class BuyDTO {

	private int buynum;			//삽니다번호
	private String category;	//분류
	private String tradeway;	//거래방법
	private String location;	//거래지역
	private String pricechoice;	//가격선택 (합의 후 결정, 범위 설정)
	private int price1;			//최소가격
	private int price2;			//최대가격
	private String email; 		//작성자의 이메일
	private String author;		//작성자 이름
	private String title;		//제목
	private String content;		//내용
	private String writeday;	//작성날짜
	private int readcnt;		//조회수
	private int replecnt;		//댓글수
	private CommonsMultipartFile upfile;
	private CommonsMultipartFile[] upfileContent;
	private String image1;	//대표사진
	private String image2;	//등록된 사진
	private String state;
	
	public BuyDTO() {
		super();
	}

	public BuyDTO(int buynum, String category, String tradeway, String location, String pricechoice, int price1,
			int price2, String email, String author, String title, String content, String writeday, int readcnt,
			int replecnt, CommonsMultipartFile upfile, CommonsMultipartFile[] upfileContent, String image1,
			String image2, String state) {
		super();
		this.buynum = buynum;
		this.category = category;
		this.tradeway = tradeway;
		this.location = location;
		this.pricechoice = pricechoice;
		this.price1 = price1;
		this.price2 = price2;
		this.email = email;
		this.author = author;
		this.title = title;
		this.content = content;
		this.writeday = writeday;
		this.readcnt = readcnt;
		this.replecnt = replecnt;
		this.upfile = upfile;
		this.upfileContent = upfileContent;
		this.image1 = image1;
		this.image2 = image2;
		this.state = state;
	}

	@Override
	public String toString() {
		return "BuyDTO [buynum=" + buynum + ", category=" + category + ", tradeway=" + tradeway + ", location="
				+ location + ", pricechoice=" + pricechoice + ", price1=" + price1 + ", price2=" + price2 + ", email="
				+ email + ", author=" + author + ", title=" + title + ", content=" + content + ", writeday=" + writeday
				+ ", readcnt=" + readcnt + ", replecnt=" + replecnt + ", upfile=" + upfile + ", upfileContent="
				+ Arrays.toString(upfileContent) + ", image1=" + image1 + ", image2=" + image2 + ", state=" + state
				+ "]";
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

	public String getTradeway() {
		return tradeway;
	}

	public void setTradeway(String tradeway) {
		this.tradeway = tradeway;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPricechoice() {
		return pricechoice;
	}

	public void setPricechoice(String pricechoice) {
		this.pricechoice = pricechoice;
	}

	public int getPrice1() {
		return price1;
	}

	public void setPrice1(int price1) {
		this.price1 = price1;
	}

	public int getPrice2() {
		return price2;
	}

	public void setPrice2(int price2) {
		this.price2 = price2;
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

	public CommonsMultipartFile getUpfile() {
		return upfile;
	}

	public void setUpfile(CommonsMultipartFile upfile) {
		this.upfile = upfile;
	}

	public CommonsMultipartFile[] getUpfileContent() {
		return upfileContent;
	}

	public void setUpfileContent(CommonsMultipartFile[] upfileContent) {
		this.upfileContent = upfileContent;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
