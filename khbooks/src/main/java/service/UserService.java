package service;

import dto.UserDTO;

public interface UserService {
	public UserDTO login(UserDTO udto) throws Exception;
	public int CheckDuplication(String id);
	public String naverLogin(String email);
	public UserDTO findAccount(String email);
	public void updateInfo(String id, String pwd);
}//end interface
