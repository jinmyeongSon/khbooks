package dao;

import java.util.List;

import dto.UserDTO;

public interface MemInforDAO {
	public UserDTO list(String id);
	public void update(UserDTO dto);
	public void delete(String id);
}
