package service;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	public boolean login(UserDTO udto, HttpSession session) {
		boolean res = dao.login(udto);
		if(res) {
			session.setAttribute("userId", udto.getId());
		}
		return res;
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

	@Override
	public int CheckDuplicationEmail(String email) {
		return dao.CheckDuplicationEmail(email);
	}


	@Override
	public void paypay(Map<String, Object> map) {
		dao.paypay(map);
	}

	
	


	

}// end class
