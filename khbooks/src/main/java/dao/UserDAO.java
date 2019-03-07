package dao;

import dto.UserDTO;

public interface UserDAO {
	//public List<UserDTO> userListMethod();
	public void userInsertMethod(UserDTO udto);
	public void userDeleteMethod(UserDTO id);
	public void userUpdateMethod(UserDTO udto);
	
}//end interface
