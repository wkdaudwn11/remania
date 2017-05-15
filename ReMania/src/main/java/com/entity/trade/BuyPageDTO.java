package com.entity.trade;

import java.util.List;

public class BuyPageDTO {
	
	private List<BuyDTO> buyList;
	private int curPage;		// 현재 페이지
	private int perPage = 9; 	// 페이지당 보여줄 레코드 수
	private int page = 10; 		// 표시할 페이지 수
	private int totalRecord;	// 총 레코드 갯수?
	
	public BuyPageDTO() {
		super();
	}

	public BuyPageDTO(List<BuyDTO> buyList, int curPage, int perPage, int page, int totalRecord) {
		super();
		this.buyList = buyList;
		this.curPage = curPage;
		this.perPage = perPage;
		this.page = page;
		this.totalRecord = totalRecord;
	}

	@Override
	public String toString() {
		return "BedRoomPageDTO [buyList=" + buyList + ", curPage=" + curPage + ", perPage=" + perPage + ", page=" + page
				+ ", totalRecord=" + totalRecord + "]";
	}

	public List<BuyDTO> getBuyList() {
		return buyList;
	}

	public void setBuyList(List<BuyDTO> buyList) {
		this.buyList = buyList;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
}// end BedRoomPage
