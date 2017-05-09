package com.entity.member;

import org.apache.ibatis.type.Alias;

@Alias("MemberDTO")
public class MemberDTO {

	private int membernum;		//회원번호
	private String email;		//이메일
	private String name;		//회원이름
	private String pwd;			//비밀번호
	private String tel;			//연락처
	private String post1;		//우편번호1
	private String post2;		//우편번호2
	private String addr1;		//주소1
	private String addr2;		//주소1
	private String joindate;	//가입날짜
	private String logindate;	//로그인날짜
	private int buyCount;		//구매횟수
	private int sellCount; 		//판매횟수
	private String sns;			//sns로그인 여부
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(int membernum, String email, String name, String pwd, String tel, String post1, String post2,
			String addr1, String addr2, String joindate, String logindate, int buyCount, int sellCount, String sns) {
		super();
		this.membernum = membernum;
		this.email = email;
		this.name = name;
		this.pwd = pwd;
		this.tel = tel;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.joindate = joindate;
		this.logindate = logindate;
		this.buyCount = buyCount;
		this.sellCount = sellCount;
		this.sns = sns;
	}

	@Override
	public String toString() {
		return "MemberDTO [memnum=" + membernum + ", email=" + email + ", name=" + name + ", pwd=" + pwd + ", tel=" + tel
				+ ", post1=" + post1 + ", post2=" + post2 + ", addr1=" + addr1 + ", addr2=" + addr2 + ", joindate="
				+ joindate + ", logindate=" + logindate + ", buyCount=" + buyCount + ", sellCount=" + sellCount
				+ ", sns=" + sns + "]";
	}

	public int getMembernum() {
		return membernum;
	}

	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPost1() {
		return post1;
	}

	public void setPost1(String post1) {
		this.post1 = post1;
	}

	public String getPost2() {
		return post2;
	}

	public void setPost2(String post2) {
		this.post2 = post2;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public String getLogindate() {
		return logindate;
	}

	public void setLogindate(String logindate) {
		this.logindate = logindate;
	}

	public int getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}

	public int getSellCount() {
		return sellCount;
	}

	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}

	public String getSns() {
		return sns;
	}

	public void setSns(String sns) {
		this.sns = sns;
	}
	
}
