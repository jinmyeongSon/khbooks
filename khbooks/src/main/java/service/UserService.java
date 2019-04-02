package service;

import javax.servlet.http.HttpSession;

import dto.UserDTO;

public interface UserService {
	public boolean login(UserDTO udto, HttpSession session);
	public int CheckDuplication(String id);
	public int CheckDuplicationEmail(String email);
	public String naverLogin(String email);
	public UserDTO findAccount(String email);
	public void updateInfo(String id, String pwd);
}//end interface
