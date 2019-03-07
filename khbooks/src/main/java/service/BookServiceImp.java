package service;

import java.util.List;

import dao.BookDAO;
import dto.BookDTO;
import dto.GenreDTO;

public class BookServiceImp implements BookService {
	BookDAO dao;
	
	public List<BookDTO> bookListProcess(){
		return dao.bookList();
	};
	
	@Override
	public List<GenreDTO> genreListProcess() {
		return dao.genreList();
	}
	
	public void setDao(BookDAO dao) {
		this.dao = dao;
	}
}
