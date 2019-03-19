package service;

import java.util.List;

import dto.UserDTO;

public interface MemInforService {
	public UserDTO listprocess(String id);
	public void updateProcess(UserDTO dto);
}
