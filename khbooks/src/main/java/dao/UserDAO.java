package dao;


import java.util.Map;

import javax.servlet.http.HttpSession;

import dto.UserDTO;

public interface UserDAO {
	//회원가입
	public void register(UserDTO udto);
	
	// 로그인 
	//public UserDTO login(UserDTO udto);
	public boolean login(UserDTO udto);
	
	//아이디 중복체크
	public int CheckDuplication(String id);
	
	//아이디 중복체크
	public int CheckDuplicationEmail(String email);

	public void paypay(Map<String, Object> map);
	
	//네이버 로그인
	public String naverinfo(String email);
	
	public UserDTO findAccount(String email);
	
	public void updateInfo(String id, String pwd);
}//end interface
