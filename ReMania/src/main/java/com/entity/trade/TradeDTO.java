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
	private String transfer;	//인계확인 (기본값: null)
	private String takeover;	//인수확인 (기본값: null)
	private String sellcancel;	//판매취소	(기본값: null)
	private String buycancel;	//판매취소	(기본값: null)
	
	public TradeDTO() {
		super();
	}

	public TradeDTO(int tradenum, String category, int categorynum, String buyer, String seller, String state,
			String transfer, String takeover, String sellcancel, String buycancel) {
		super();
		this.tradenum = tradenum;
		this.category = category;
		this.categorynum = categorynum;
		this.buyer = buyer;
		this.seller = seller;
		this.state = state;
		this.transfer = transfer;
		this.takeover = takeover;
		this.sellcancel = sellcancel;
		this.buycancel = buycancel;
	}

	@Override
	public String toString() {
		return "TradeDTO [tradenum=" + tradenum + ", category=" + category + ", categorynum=" + categorynum + ", buyer="
				+ buyer + ", seller=" + seller + ", state=" + state + ", transfer=" + transfer + ", takeover="
				+ takeover + ", sellcancel=" + sellcancel + ", buycancel=" + buycancel + "]";
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

	public String getTransfer() {
		return transfer;
	}

	public void setTransfer(String transfer) {
		this.transfer = transfer;
	}

	public String getTakeover() {
		return takeover;
	}

	public void setTakeover(String takeover) {
		this.takeover = takeover;
	}

	public String getSellcancel() {
		return sellcancel;
	}

	public void setSellcancel(String sellcancel) {
		this.sellcancel = sellcancel;
	}

	public String getBuycancel() {
		return buycancel;
	}

	public void setBuycancel(String buycancel) {
		this.buycancel = buycancel;
	}
	
}
