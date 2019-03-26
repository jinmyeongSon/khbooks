package service;

import java.util.List;
import java.util.Map;
import dto.BookDTO;

public interface FavBookService {
	public List<BookDTO> listprocess(Map<String, Object> map);
	public void deleteprocess(int num);
	public int countprocess(String id);
	public int searchprocess(Map<String, Object> map);
	public void insertporcess(Map<String, Object> map);
}
