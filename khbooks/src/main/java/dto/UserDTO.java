package dto;

import java.sql.Date;

public class UserDTO {
	private String id;
	private String upass;
	private String uname;
	private String uemail;
	private String uphone;
	private Date ubirth;
	private int ugender;
	private boolean rememberId;
	
	public UserDTO() {
	
	}
	
	

	public UserDTO(String id) {
		super();
		this.id = id;
	}

	public UserDTO(String id, String upass) {
		super();
		this.id = id;
		this.upass = upass;
	}

	public UserDTO(String id, String upass, String uname, String uemail, String uphone, Date ubirth, int ugender) {
		super();
		this.id = id;
		this.upass = upass;
		this.uname = uname;
		this.uemail = uemail;
		this.uphone = uphone;
		this.ubirth = ubirth;
		this.ugender = ugender;
	}

	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public Date getUbirth() {
		return ubirth;
	}

	public void setUbirth(Date ubirth) {
		this.ubirth = ubirth;
	}

	public int getUgender() {
		return ugender;
	}


	public void setUgender(int ugender) {
		this.ugender = ugender;
	}


	public boolean isRememberId() {
		return rememberId;
	}



	public void setRememberId(boolean rememberId) {
		this.rememberId = rememberId;
	}
	
	
	
	
	

}//end class
