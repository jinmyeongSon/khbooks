package service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import dto.UserDTO;

public interface UserService {
	public UserDTO login(UserDTO udto);
	public int CheckDuplication(String id);
	public int CheckDuplicationEmail(String email);
	public String naverLogin(String email);
	public UserDTO findAccount(String email);
	public void updateInfo(String id, String pwd);
	public void paypay(Map<String, Object> map);
}//end interface
