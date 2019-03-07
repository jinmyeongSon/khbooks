package service;

import java.util.List;

import dto.BookDTO;
import dto.GenreDTO;

public interface BookService {
	public List<BookDTO> bookListProcess();
	public List<GenreDTO> genreListProcess();
}
