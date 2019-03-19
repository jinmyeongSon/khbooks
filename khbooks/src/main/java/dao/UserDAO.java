package dao;

import java.util.Map;

import javax.servlet.http.HttpSession;

import dto.UserDTO;

public interface UserDAO {
	//회원가입
	public void register(UserDTO udto);
	
	// 로그인 
	public UserDTO login(UserDTO udto);
	
	//아이디 중복체크
	public int CheckDuplication(String id);

}//end interface
