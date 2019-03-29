package service;

import java.util.List;
import java.util.Map;
import dto.AuthorDTO;

public interface FavAuthorService {
	public List<AuthorDTO> listprocess(Map<String,Object>map);
	public int countprocess(String id);
	public void deleteprocess(Map<String, Object> map);
	public int searchprocess(Map<String, Object> map);
	public void insertprocess(Map<String, Object> map);
}
