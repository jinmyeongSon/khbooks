package dto;

import java.util.Date;
import java.util.List;

public class SerialDTO {
	int upno;
	int bno;
	Date sdate;
	String scontent;
	int sprice;
	int ncount;
	int auno;
	String stitle;
	int sgrade;
	List<ReviewCommentDTO> rList;
	public List<ReviewCommentDTO> getrList() {
		return rList;
	}
	public void setrList(List<ReviewCommentDTO> rList) {
		this.rList = rList;
	}
	public int getUpno() {
		return upno;
	}
	public void setUpno(int upno) {
		this.upno = upno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public String getScontent() {
		return scontent;
	}
	public void setScontent(String scontent) {
		this.scontent = scontent;
	}
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public int getNcount() {
		return ncount;
	}
	public void setNcount(int ncount) {
		this.ncount = ncount;
	}
	public int getAuno() {
		return auno;
	}
	public void setAuno(int auno) {
		this.auno = auno;
	}
	public String getStitle() {
		return stitle;
	}
	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	public int getSgrade() {
		return sgrade;
	}
	public void setSgrade(int sgrade) {
		this.sgrade = sgrade;
	}
	
	

}
