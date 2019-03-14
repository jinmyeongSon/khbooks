package dto;

import java.sql.Date;

public class NoticeDTO {
	private int nnum;
	private String aid;
	private String nname;
	private String ntext;
	private Date ndate;
	private int ncount;
	
	public NoticeDTO() {
		
	}

	public int getNnum() {
		return nnum;
	}

	public void setNnum(int nnum) {
		this.nnum = nnum;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public String getNtext() {
		return ntext;
	}

	public void setNtext(String ntext) {
		this.ntext = ntext;
	}

	public Date getNdate() {
		return ndate;
	}

	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}

	public int getNcount() {
		return ncount;
	}

	public void setNcount(int ncount) {
		this.ncount = ncount;
	}

}
