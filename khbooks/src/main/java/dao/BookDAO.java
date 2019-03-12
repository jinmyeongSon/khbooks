package dao;

import java.util.List;
import java.util.Map;

import dto.BookDTO;
import dto.GenreDTO;
import dto.PageDTO;


public interface BookDAO {
	public List<BookDTO> bookList(PageDTO dto);
	public List<GenreDTO> genreList();
	public BookDTO bookDetail(int bno);
	public int getBookCount();
	public int getBookGenreCount(int sortgenre);
	public List<BookDTO> getBookSearchList(PageDTO dto);
	public int getBookSearchCount(Map<String, Object> map);
}
