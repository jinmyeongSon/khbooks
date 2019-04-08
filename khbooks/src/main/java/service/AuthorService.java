package service;

import java.util.List;
import java.util.Map;

import dto.AuthorDTO;
import dto.BookDTO;

public interface AuthorService {
	public List<BookDTO> bookListProcess(int auno);
	public AuthorDTO authorProcess(int auno);
	public void insertProcess(Map<String, Object> map);
	public int searchProcess(Map<String, Object> map);
}
