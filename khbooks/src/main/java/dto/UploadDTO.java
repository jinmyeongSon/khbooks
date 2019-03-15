package dto;

public class UploadDTO { //공지사항 첨부파일
	private int nnum; //공지사항 게시글 번호
	private int upnum;
	private String upname;
	private String aid;
	
	public UploadDTO() {
		
	}
	
	public UploadDTO(String upname) {
		this.upname = upname;
	}
	
	public UploadDTO(int nnum, String upname) {
		this.nnum = nnum;
		this.upname = upname;
	}

	public int getNnum() {
		return nnum;
	}

	public void setNnum(int nnum) {
		this.nnum = nnum;
	}

	public int getUpnum() {
		return upnum;
	}

	public void setUpnum(int upnum) {
		this.upnum = upnum;
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
