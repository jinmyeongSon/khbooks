package service;

import java.util.List;

import dao.MemInforDAO;
import dto.UserDTO;


public class MemInforServiceImp implements MemInforService{
	private MemInforDAO dao;
	
	public MemInforServiceImp() {
	}
	

	public void setDao(MemInforDAO dao) {
		this.dao = dao;
	}

	@Override
	public UserDTO listprocess(String id) {
		return dao.list(id);
	}
	
	@Override
	public void updateProcess(UserDTO dto) {
		dao.update(dto);
	}


	@Override
	public void deleteProcess(String id) {
		dao.delete(id);
		
	}

}
