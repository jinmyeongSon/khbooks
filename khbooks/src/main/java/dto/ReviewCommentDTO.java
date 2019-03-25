package dto;

import java.util.Date;

public class ReviewCommentDTO {
	private int rno;
	private String id;
	private int upno;
	private int bno;
	private String rtext;
	private Date rdate;
	private int grade;
	private String bname;
	
	
	public int getRno() {
		return rno;
	}
	
	public void setRno(int rno) {
		this.rno = rno;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
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
	
	public String getRtext() {
		return rtext;
	}
	
	public void setRtext(String rtext) {
		this.rtext = rtext;
	}
	
	public Date getRdate() {
		return rdate;
	}
	
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	
	public int getGrade() {
		return grade;
	}
	
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public String getBname() {
		return bname;
	}
	
	public void setBname(String bname) {
		this.bname = bname;
	}
	
}
