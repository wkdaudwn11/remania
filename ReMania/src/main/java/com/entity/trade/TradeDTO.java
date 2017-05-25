package com.entity.trade;

import org.apache.ibatis.type.Alias;

@Alias("TradeDTO")
public class TradeDTO {
	
	private int tradenum;		//거래번호
	private String category;	//게시글 종류(buy, sell)
	private int categorynum;	//게시글 번호
	private String buyer;		//구매자 이메일
	private String seller;		//판매자 이메일
	private String state;		//거래상황
	
	public TradeDTO() {
		super();
	}

	public TradeDTO(int tradenum, String category, int categorynum, String buyer, String seller, String state) {
		super();
		this.tradenum = tradenum;
		this.category = category;
		this.categorynum = categorynum;
		this.buyer = buyer;
		this.seller = seller;
		this.state = state;
	}

	@Override
	public String toString() {
		return "TradeDTO [tradenum=" + tradenum + ", category=" + category + ", categorynum=" + categorynum + ", buyer="
				+ buyer + ", seller=" + seller + ", state=" + state + "]";
	}

	public int getTradenum() {
		return tradenum;
	}

	public void setTradenum(int tradenum) {
		this.tradenum = tradenum;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getCategorynum() {
		return categorynum;
	}

	public void setCategorynum(int categorynum) {
		this.categorynum = categorynum;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
}
