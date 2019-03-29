package dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class SerialDTO {
	private int upno;
	private int bno;
	private Date sdate;
	private String scontent;
	private int sprice;
	private int ncount;
	private int auno;
	private String stitle;
	private float sgrade;
	private MultipartFile filename;
	
	public MultipartFile getFilename() {
		return filename;
	}
	public void setFilename(MultipartFile filename) {
		this.filename = filename;
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
	public float getSgrade() {
		return sgrade;
	}
	public void setSgrade(float sgrade) {
		this.sgrade = sgrade;
	}
}
