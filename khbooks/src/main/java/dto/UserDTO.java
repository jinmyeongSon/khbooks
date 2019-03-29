package dto;

import java.sql.Date;

public class UserDTO {
	private int uno;
	private String id;
	private String upass;
	private String uname;
	private String uemail;
	private String uphone;
	private Date ubirth;
	private int ugender;	
	public UserDTO() {
	
	}
	
	
	public UserDTO(String id) {
		super();
		this.id = id;
	}




	public int getUno() {
		return uno;
	}

	
	public void setUno(int uno) {
		this.uno = uno;
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



}//end class
