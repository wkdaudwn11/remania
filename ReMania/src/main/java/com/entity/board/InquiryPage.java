package com.entity.board;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("InquiryPage")
public class InquiryPage {
	
	private final int PERPAGE = 10;
	private final int INDICATEPAGE = 10; //블럭갯수
	private int curPage;
	private List<QuestionDTO> inquiryList;
	private int totalRecord;
	
	public InquiryPage() {}

	public InquiryPage(int curPage, List<QuestionDTO> inquiryList, int totalRecord) {
		this.curPage = curPage;
		this.inquiryList = inquiryList;
		this.totalRecord = totalRecord;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public List<QuestionDTO> getInquiryList() {
		return inquiryList;
	}

	public void setInquiryList(List<QuestionDTO> inquiryList) {
		this.inquiryList = inquiryList;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getPERPAGE() {
		return PERPAGE;
	}

	public int getINDICATEPAGE() {
		return INDICATEPAGE;
	}

	@Override
	public String toString() {
		return "InquiryPage [PERPAGE=" + PERPAGE + ", INDICATEPAGE=" + INDICATEPAGE + ", curPage=" + curPage
				+ ", inquiryList=" + inquiryList + ", totalRecord=" + totalRecord + "]";
	}
	
}// end Class
