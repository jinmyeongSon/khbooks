package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.UserDAO;
import dto.UserDTO;

@Service
public class UserServiceImp implements UserService{
	
	@Inject
	private UserDAO dao;
	
	public void setDao(UserDAO dao) {
		this.dao = dao;
	}

	@Override
	public UserDTO login(UserDTO udto) throws Exception {
		return dao.login(udto);
	}

	@Override
	public int CheckDuplication(String id) {
		return dao.CheckDuplication(id);
	}
	
}//end class
