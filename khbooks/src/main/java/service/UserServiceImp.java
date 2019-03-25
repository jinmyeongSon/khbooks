package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.UserDAO;
import dto.UserDTO;

@Service
public class UserServiceImp implements UserService {

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

	@Override
	public String naverLogin(String email) {
		return dao.naverinfo(email);
	}

	@Override
	public UserDTO findAccount(String email) {
		return dao.findAccount(email);
	}

	@Override
	public void updateInfo(String id, String pwd) {
		dao.updateInfo(id, pwd);
	}

	
	


	

}// end class
