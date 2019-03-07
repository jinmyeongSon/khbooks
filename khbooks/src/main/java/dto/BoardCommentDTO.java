package dto;

public class BoardCommentDTO {
	private int rno; //댓글번호
	private int bonum; //게시글 번호
	private String id;
	private String bc_content;
	private int bc_restep; //댓글 순서
	private int bc_relevel; //댓글 계층
	private int bc_ref; //어떤 댓글에 대한 댓글인지

	public BoardCommentDTO() {
		
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getBonum() {
		return bonum;
	}

	public void setBonum(int bonum) {
		this.bonum = bonum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBc_content() {
		return bc_content;
	}

	public void setBc_content(String bc_content) {
		this.bc_content = bc_content;
	}

	public int getBc_restep() {
		return bc_restep;
	}

	public void setBc_restep(int bc_restep) {
		this.bc_restep = bc_restep;
	}

	public int getBc_relevel() {
		return bc_relevel;
	}

	public void setBc_relevel(int bc_relevel) {
		this.bc_relevel = bc_relevel;
	}

	public int getBc_ref() {
		return bc_ref;
	}

	public void setBc_ref(int bc_ref) {
		this.bc_ref = bc_ref;
	}
}
