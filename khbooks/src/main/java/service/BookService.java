package service;

import java.util.List;
import java.util.Map;

import dto.BookDTO;
import dto.GenreDTO;
import dto.PageDTO;

public interface BookService {
	public List<BookDTO> bookListProcess(PageDTO dto);
	public List<BookDTO> bookSearchProcess(PageDTO dto);
	public List<GenreDTO> genreListProcess();
	public BookDTO bookDetailProcess(int bno);
	public int getBookCountProcess();
	public int getBookGenreCountProcess(int sortgenre);
	public int getBookSearchCountProcess(Map<String, Object> map);
}
