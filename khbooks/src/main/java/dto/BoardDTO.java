package dto;

import java.sql.Date;

/*
 * readcount : 조회수
 * bref : 어떤 게시물에 대한 댓글인지 번호
 * bre_step : 댓글 끼리 순서 1,2,3,4,...
 * bre_level : 댓글 계층, 댓글-1 대댓글-2...
 * */

public class BoardDTO {
	private int bonum, bcount;
	private String bname, btext, id;
	private Date bdate;
	private int replyCount;
	
	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public BoardDTO() {
		
	}

	public int getBonum() {
		return bonum;
	}

	public void setBonum(int bonum) {
		this.bonum = bonum;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getBtext() {
		return btext;
	}

	public void setBtext(String btext) {
		this.btext = btext;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
