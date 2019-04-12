package dao;

import java.util.List;
import java.util.Map;

import dto.AdminPageDTO;
import dto.AuthorDTO;
import dto.BookDTO;
import dto.GenreDTO;
import dto.SerialDTO;
import dto.UserDTO;

public interface AdminDAO {

	public int adminLoginCheck(String id, String pass);

	public List<UserDTO> getUserList(AdminPageDTO adto);

	public List<BookDTO> getBookList(AdminPageDTO adto);

	public int getUserListCount();

	public List<UserDTO> getUserSearch(AdminPageDTO adto);

	public int getUserSearchCount(AdminPageDTO adto);

	public int getBookListCount();

	public List<BookDTO> getBookSearch(AdminPageDTO adto);

	public int getBookSearchCount(AdminPageDTO adto);

	public UserDTO getUserOne(String id);

	public void userUpdate(UserDTO udto);

	public BookDTO getBookOne(int bno);

	public List<GenreDTO> getGenreList();

	public void bookInsert(BookDTO dto);

	public int getAuthorSearchCount(AdminPageDTO adto);

	public List<BookDTO> getAuthorSearch(AdminPageDTO adto);

	public int getAuthorListCount();

	public List<BookDTO> getAuthorList(AdminPageDTO adto);

	public AuthorDTO getAuthorOne(int auno);

	public void authorUpdate(AuthorDTO adto);

	public void authorInsert(AuthorDTO adto);

	public void userDelete(String id);

	public void bookDelete(int bno);

	public void authorDelete(int auno);
	
	public String getBookGenre(int bno);
	
	public List<SerialDTO> getSerialList(int bno);

	public void serialDelete(int upno);

	public void serialUpdate(SerialDTO sdto);

	public void bookUpdate(BookDTO bdto);

	public void bookAuthorDelete(Map<String, Object> map);

	public List<AuthorDTO> bookAuthorSearch(Map<String, Object> map);

	public void bookAuthorInsert(Map<String, Object> map);

	public void serialInsert(SerialDTO dto);

}
