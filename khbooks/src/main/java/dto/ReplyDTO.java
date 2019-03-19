package dto;

import java.util.Date;

public class ReplyDTO { //게시판 댓글
	private int bonum; //게시글 번호
	private int bcno; //댓글 번호
	private String id;
	private String bctext;
	private int bcstep; //댓글 간 순서
	private int bclevel; // 댓글 계층 댓글=1, 대댓=2 ...
	private int bcfor; //ref
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

	public int getBcstep() {
		return bcstep;
	}

	public void setBcstep(int bcstep) {
		this.bcstep = bcstep;
	}

	public int getBclevel() {
		return bclevel;
	}

	public void setBclevel(int bclevel) {
		this.bclevel = bclevel;
	}

	public int getBcfor() {
		return bcfor;
	}

	public void setBcfor(int bcfor) {
		this.bcfor = bcfor;
	}
	
	public Date getBcdate() {
		return bcdate;
	}
	
	public void setBcdate(Date bcdate) {
		this.bcdate = bcdate;
	}
	
}// end class
