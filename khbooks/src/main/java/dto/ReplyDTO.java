package dto;

import java.util.Date;

public class ReplyDTO { //게시판 댓글
	private int bonum; //게시글 번호
	private int bcno; //댓글 번호
	private String id;
	private String bctext;
	private Date bcdate;
	
	public ReplyDTO() {

	}

	public int getBonum() {
		return bonum;
	}

	public void setBonum(int bonum) {
		this.bonum = bonum;
	}

	public int getBcno() {
		return bcno;
	}

	public void setBcno(int bcno) {
		this.bcno = bcno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBctext() {
		return bctext;
	}

	public void setBctext(String bctext) {
		this.bctext = bctext;
	}
	
	public Date getBcdate() {
		return bcdate;
	}
	
	public void setBcdate(Date bcdate) {
		this.bcdate = bcdate;
	}
	
}// end class
