package dao;

import java.util.List;
import java.util.Map;

import dto.AuthorDTO;

public interface FavAuthorDAO {
	public int count(String id);
	public List<AuthorDTO> FavList(Map<String, Object> map);
	public void FavDelete(Map<String, Object> map);
	public int search(Map<String, Object> map);
	public void insert(Map<String, Object> map);
}
