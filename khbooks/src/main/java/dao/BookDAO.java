package dao;

import java.util.List;
import java.util.Map;

import dto.BookDTO;
import dto.GenreDTO;
import dto.SerialDTO;
import dto.BookPageDTO;


public interface BookDAO {
	public List<BookDTO> bookList(BookPageDTO dto);
	public List<GenreDTO> genreList();
	public BookDTO bookDetail(int bno);
	public int getBookCount();
	public int getBookGenreCount(int sortgenre);
	public List<BookDTO> getBookSearchList(BookPageDTO dto);
	public int getBookSearchCount(Map<String, Object> map);
	public String getBookGenre(int bno);
	public List<SerialDTO> getSerialList(int bno);
}