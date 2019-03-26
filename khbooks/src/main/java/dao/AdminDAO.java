package dao;

import java.util.List;

import dto.AdminPageDTO;
import dto.BookDTO;
import dto.GenreDTO;
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

}
