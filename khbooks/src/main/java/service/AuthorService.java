package service;

import java.util.List;

import dto.AuthorDTO;
import dto.BookDTO;

public interface AuthorService {
	public List<BookDTO> bookListProcess(int auno);
	public AuthorDTO authorProcess(int auno);
}
