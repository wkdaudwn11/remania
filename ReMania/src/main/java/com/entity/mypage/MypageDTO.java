package com.entity.mypage;

import org.apache.ibatis.type.Alias;

@Alias("MypageDTO")
public class MypageDTO {

	private int buywrite;	// 삽니다에 작성한 게시글 수
	private int buytrading;	// 구매중인물품
	private int buyend;		// 구매가 완료된 물품
	private int sellwrite;	// 팝니다에 작성한 게시글 수
	private int selltrading;// 판매중인물품
	private int sellend;	// 판매가 완료된 물품
	
	public MypageDTO() {
		super();
	}

	public MypageDTO(int buywrite, int buytrading, int buyend, int sellwrite, int selltrading, int sellend) {
		super();
		this.buywrite = buywrite;
		this.buytrading = buytrading;
		this.buyend = buyend;
		this.sellwrite = sellwrite;
		this.selltrading = selltrading;
		this.sellend = sellend;
	}

	@Override
	public String toString() {
		return "MypageDTO [buywrite=" + buywrite + ", buytrading=" + buytrading + ", buyend=" + buyend + ", sellwrite="
				+ sellwrite + ", selltrading=" + selltrading + ", sellend=" + sellend + "]";
	}

	public int getBuywrite() {
		return buywrite;
	}

	public void setBuywrite(int buywrite) {
		this.buywrite = buywrite;
	}

	public int getBuytrading() {
		return buytrading;
	}

	public void setBuytrading(int buytrading) {
		this.buytrading = buytrading;
	}

	public int getBuyend() {
		return buyend;
	}

	public void setBuyend(int buyend) {
		this.buyend = buyend;
	}

	public int getSellwrite() {
		return sellwrite;
	}

	public void setSellwrite(int sellwrite) {
		this.sellwrite = sellwrite;
	}

	public int getSelltrading() {
		return selltrading;
	}

	public void setSelltrading(int selltrading) {
		this.selltrading = selltrading;
	}

	public int getSellend() {
		return sellend;
	}

	public void setSellend(int sellend) {
		this.sellend = sellend;
	}
	
}
