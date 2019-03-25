package dao;

import java.util.List;

import dto.BookDTO;

public interface BUploadDAO {
	public List<BookDTO> bookListMethod();//리스트 보여주기
	public void bookInsertMethod(BookDTO bdto);//인서트
	
}//end interface
