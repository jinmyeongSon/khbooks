package dto;

import java.sql.Date;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class BookDTO {
	private int bno;
	private String bname;
	private int gno;
	private Date bupdate;
	private float bgrade;
	private int bview;
	private String bthumb;
	private String binfo;
	private List<AuthorDTO> aList;
	private int count;
	private MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List<AuthorDTO> getaList() {
		return aList;
	}
	public void setaList(List<AuthorDTO> aList) {
		this.aList = aList;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public Date getBupdate() {
		return bupdate;
	}
	public void setBupdate(Date bupdate) {
		this.bupdate = bupdate;
	}
	public float getBgrade() {
		return bgrade;
	}
	public void setBgrade(float bgrade) {
		this.bgrade = bgrade;
	}
	public int getBview() {
		return bview;
	}
	public void setBview(int bview) {
		this.bview = bview;
	}
	public String getBthumb() {
		return bthumb;
	}
	public void setBthumb(String bthumb) {
		this.bthumb = bthumb;
	}
	public String getBinfo() {
		return binfo;
	}
	public void setBinfo(String binfo) {
		this.binfo = binfo;
	}

	
	
}
