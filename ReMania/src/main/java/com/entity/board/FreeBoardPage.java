package com.entity.board;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("FreeBoardPage")
public class FreeBoardPage {
	
	private final int PERPAGE = 10;
	private final int INDICATEPAGE = 10; //블럭갯수
	private int curPage;
	private List<FreeBoardDTO> boardList;
	private int totalRecord;
	private String type;
	private String value;
	
	public FreeBoardPage(){}
	public FreeBoardPage(int curPage, List<FreeBoardDTO> boardList, int totalRecord, String type, String value) {
		this.curPage = curPage;
		this.boardList = boardList;
		this.totalRecord = totalRecord;
		this.type = type;
		this.value = value;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public List<FreeBoardDTO> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<FreeBoardDTO> boardList) {
		this.boardList = boardList;
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
		return "FreeBoardPage [PERPAGE=" + PERPAGE + ", INDICATEPAGE=" + INDICATEPAGE + ", curPage=" + curPage
				+ ", boardList=" + boardList + ", totalRecord=" + totalRecord + ", type=" + type + ", value=" + value
				+ "]";
	}
	
}// end Class
