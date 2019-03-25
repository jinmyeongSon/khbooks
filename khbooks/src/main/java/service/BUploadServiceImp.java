package service;

import java.util.List;

import dao.BUploadDAO;
import dto.BookDTO;

public class BUploadServiceImp implements BUploadService{
	private BUploadDAO dao;
	
	public BUploadServiceImp() {
	
	}
	
	public void setDao(BUploadDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<BookDTO> bookList(BookDTO bdto) {
		dao.bookInsertMethod(bdto);
		return dao.bookListMethod();
	}

	@Override
	public List<BookDTO> bookViewList() {
		return dao.bookListMethod();
	}

	
	
}//end class
