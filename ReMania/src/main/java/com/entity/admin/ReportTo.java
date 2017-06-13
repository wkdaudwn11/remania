package com.entity.admin;

import org.apache.ibatis.type.Alias;

@Alias("ReportTo")
public class ReportTo {

	private int tradenum;
	private String transfer;
	private String takeover;
	private String victim;
	private String assailant;
	private String reportToContent2;
	
	public ReportTo() {
		super();
	}

	public ReportTo(int tradenum, String transfer, String takeover, String victim, String assailant,
			String reportToContent2) {
		super();
		this.tradenum = tradenum;
		this.transfer = transfer;
		this.takeover = takeover;
		this.victim = victim;
		this.assailant = assailant;
		this.reportToContent2 = reportToContent2;
	}

	@Override
	public String toString() {
		return "ReportTo [tradenum=" + tradenum + ", transfer=" + transfer + ", takeover=" + takeover + ", victim="
				+ victim + ", assailant=" + assailant + ", reportToContent2=" + reportToContent2 + "]";
	}

	public int getTradenum() {
		return tradenum;
	}

	public void setTradenum(int tradenum) {
		this.tradenum = tradenum;
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

	public String getVictim() {
		return victim;
	}

	public void setVictim(String victim) {
		this.victim = victim;
	}

	public String getAssailant() {
		return assailant;
	}

	public void setAssailant(String assailant) {
		this.assailant = assailant;
	}

	public String getReportToContent2() {
		return reportToContent2;
	}

	public void setReportToContent2(String reportToContent2) {
		this.reportToContent2 = reportToContent2;
	}
	
}
