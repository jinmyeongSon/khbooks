package service;

import dto.UserDTO;

public interface UserService {
	public UserDTO login(UserDTO udto) throws Exception;
	public int CheckDuplication(String id);
}//end interface
