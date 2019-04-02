package dao;

import java.util.List;

import dto.AuthorDTO;
import dto.BookDTO;

public interface AuthorDAO {
	public List<BookDTO> BookList(int auno);  
	public AuthorDTO Author(int auno);
}
