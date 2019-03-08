package service;

import java.util.List;

import dao.BookDAO;
import dto.BookDTO;
import dto.GenreDTO;
import dto.PageDTO;

public class BookServiceImp implements BookService {
	BookDAO dao;
	
	public List<BookDTO> bookListProcess(PageDTO dto){
		return dao.bookList(dto);
	};
	
	@Override
	public List<GenreDTO> genreListProcess() {
		return dao.genreList();
	}
	
	@Override
	public BookDTO bookDetailProcess(int bno) {
		return dao.bookDetail(bno);
	}
	
	@Override
	public int getBookCountProcess() {
		return dao.getBookCount();
	}
	
	public void setDao(BookDAO dao) {
		this.dao = dao;
	}

	@Override
	public int getBookGenreCountProcess(int sortgenre) {
		return dao.getBookGenreCount(sortgenre);
	}
	
}
