package dto;

public class UploadDTO { //공지사항 첨부파일
	private int rno;
	private int uno;
	private String rupload;
	
	public UploadDTO() {
		
	}
	
	public UploadDTO(String rupload) {
		this.rupload = rupload;
	}
	
	public UploadDTO(int rno, String rupload) {
		this.rno = rno;
		this.rupload = rupload;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getRupload() {
		return rupload;
	}

	public void setRupload(String rupload) {
		this.rupload = rupload;
	}
	
}
