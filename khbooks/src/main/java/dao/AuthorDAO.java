package dao;

import java.util.List;
import java.util.Map;

import dto.AuthorDTO;
import dto.BookDTO;

public interface AuthorDAO {
	public List<BookDTO> BookList(int auno);  
	public AuthorDTO Author(int auno);
	public void insert(Map<String, Object> map);
	public int search(Map<String, Object> map);
}
