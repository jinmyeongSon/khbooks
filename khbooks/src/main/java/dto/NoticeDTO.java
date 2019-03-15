package dto;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDTO {
	private int nnum;
	private String aid;
	private String bname;
	private String btext;
	private Date ndate;
	private int ncount;
	private List<UploadDTO> uList;
	private List<MultipartFile> filename;
	
	public NoticeDTO() {
		
	}

	public int getNnum() {
		return nnum;
	}

	public void setNnum(int nnum) {
		this.nnum = nnum;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
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

	public Date getNdate() {
		return ndate;
	}

	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}

	public int getNcount() {
		return ncount;
	}

	public void setNcount(int ncount) {
		this.ncount = ncount;
	}
	
	public List<UploadDTO> getuList() {
		return uList;
	}
	
	public void setuList(List<UploadDTO> uList) {
		this.uList = uList;
	}
	
	public List<MultipartFile> getFilename() {
		return filename;
	}
	
	public void setFilename(List<MultipartFile> filename) {
		this.filename = filename;
	}

}
