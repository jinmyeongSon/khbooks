package dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

/*
 * readcount : 조회수
 * bref : 게시물과 댓글의 그룹, 게시글이 늘어날 때마다 +1
 * bre_step : 댓글 끼리 순서
 * bre_level : 댓글 계층, 댓글-1 대댓글-2...
 * */

public class BoardDTO {
	private int bonum, readcount, bref, bre_step, bre_level;
	private String btitle, bcontent;
	private Date breg_date;
	
	// board테이블의 파일첨부를 처리해주는 멤버변수
	private String upload;

	// form 페이지에서 파일첨부를 받아 처리해주는 멤버변수
	private MultipartFile filename;
	
	public BoardDTO() {
		
	}

	public int getBonum() {
		return bonum;
	}

	public void setBonum(int bonum) {
		this.bonum = bonum;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getBref() {
		return bref;
	}

	public void setBref(int bref) {
		this.bref = bref;
	}

	public int getBre_step() {
		return bre_step;
	}

	public void setBre_step(int bre_step) {
		this.bre_step = bre_step;
	}

	public int getBre_level() {
		return bre_level;
	}

	public void setBre_level(int bre_level) {
		this.bre_level = bre_level;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public Date getBreg_date() {
		return breg_date;
	}

	public void setBreg_date(Date breg_date) {
		this.breg_date = breg_date;
	}

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}
}
