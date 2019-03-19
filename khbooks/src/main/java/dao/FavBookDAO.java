package dao;

import java.util.List;
import java.util.Map;

import dto.BookDTO;
import dto.PageDTO;

public interface FavBookDAO {
	public List<BookDTO> FavList(Map<String, Object> map);
	public void delete(int num);
	public int count();
}
