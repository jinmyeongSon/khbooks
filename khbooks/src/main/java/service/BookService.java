package service;

import java.util.List;
import java.util.Map;

import dto.BookDTO;
import dto.GenreDTO;
import dto.SerialDTO;
import dto.BookPageDTO;

public interface BookService {
	public List<BookDTO> bookListProcess(BookPageDTO dto);
	public List<BookDTO> bookSearchProcess(BookPageDTO dto);
	public List<GenreDTO> genreListProcess();
	public BookDTO bookDetailProcess(int bno);
	public int getBookCountProcess();
	public int getBookGenreCountProcess(int sortgenre);
	public int getBookSearchCountProcess(Map<String, Object> map);
	public String getBookGenreProcess(int bno);
	public List<SerialDTO> getSerialListProcess(int bno);
}
