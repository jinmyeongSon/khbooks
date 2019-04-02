package service;

import java.util.List;

import dao.AuthorDAO;
import dto.AuthorDTO;
import dto.BookDTO;

public class AuthorServiceImp implements AuthorService {
	private AuthorDAO dao;
	
	public AuthorServiceImp() {
		
	}
	public void setDao(AuthorDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public List<BookDTO> bookListProcess(int auno) {
		return dao.BookList(auno);
	}

	@Override
	public AuthorDTO authorProcess(int auno) {
		return dao.Author(auno);
	}
	
}
