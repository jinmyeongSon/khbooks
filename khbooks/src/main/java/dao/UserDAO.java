package dao;


import dto.UserDTO;

public interface UserDAO {
	//회원가입
	public void register(UserDTO udto);
	
	// 로그인 
	public UserDTO login(UserDTO udto);
	
	//아이디 중복체크
	public int CheckDuplication(String id);

	//네이버 로그인
	public String naverinfo(String email);
	
	public UserDTO findAccount(String email);
	
	public void updateInfo(String id, String pwd);
}//end interface
