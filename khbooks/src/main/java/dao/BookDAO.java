package dao;

import java.util.List;

import dto.BookDTO;
import dto.GenreDTO;


public interface BookDAO {
	public List<BookDTO> bookList();
	public List<GenreDTO> genreList();

}
