package dto;

import java.util.Date;

public class BookDTO {
	int bno;
	String bname;
	int gno;
	Date bupdate;
	int bgrade;
	int bview;
	String bthumb;
	String binfo;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public Date getBupdate() {
		return bupdate;
	}
	public void setBupdate(Date bupdate) {
		this.bupdate = bupdate;
	}
	public int getBgrade() {
		return bgrade;
	}
	public void setBgrade(int bgrade) {
		this.bgrade = bgrade;
	}
	public int getBview() {
		return bview;
	}
	public void setBview(int bview) {
		this.bview = bview;
	}
	public String getBthumb() {
		return bthumb;
	}
	public void setBthumb(String bthumb) {
		this.bthumb = bthumb;
	}
	public String getBinfo() {
		return binfo;
	}
	public void setBinfo(String binfo) {
		this.binfo = binfo;
	}
	
	
}
