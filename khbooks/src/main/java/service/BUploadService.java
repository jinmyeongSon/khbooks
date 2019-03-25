package service;

import java.util.List;

import dto.BookDTO;

public interface BUploadService {
	public List<BookDTO> bookViewList();
	public List<BookDTO> bookList(BookDTO bdto);
}//end interface
