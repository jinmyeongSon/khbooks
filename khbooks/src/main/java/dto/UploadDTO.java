package dto;

public class UploadDTO { //공지사항 첨부파일
	private int nnum; //공지사항 게시글 번호
	private int upno;
	private String upname;
	private String aid;
	
	public UploadDTO() {
		
	}
	
	public UploadDTO(String upname) {
		this.upname = upname;
	}
	
	public UploadDTO(int nnum, String upname, String aid) {
		this.nnum = nnum;
		this.upname = upname;
		this.aid = aid;
	}

	public int getNnum() {
		return nnum;
	}

	public void setNnum(int nnum) {
		this.nnum = nnum;
	}

	public int getUpno() {
		return upno;
	}

	public void setUpno(int upno) {
		this.upno = upno;
	}

	public String getUpname() {
		return upname;
	}

	public void setFname(String fname) {
		this.upname = fname;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}
	
}
