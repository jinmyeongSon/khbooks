package dao;

import java.util.List;
import java.util.Map;

import dto.AuthorDTO;

public interface FavAuthorDAO {
	public int count();
	public List<AuthorDTO> FavList(Map<String, Object> map);
}
