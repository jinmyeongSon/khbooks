package service;

import java.util.List;

import dto.AdminPageDTO;
import dto.BookDTO;
import dto.GenreDTO;
import dto.UserDTO;

public interface AdminService {

	public int adminLoginCheckProcess(String id, String pass);

	public List<UserDTO> getUserListProcess(AdminPageDTO adto);

	public List<BookDTO> getBookListProcess(AdminPageDTO adto);

	public int getUserListCountProcess();

	public List<UserDTO> getUserSearchProcess(AdminPageDTO adto);

	public int getUserSearchCountProcess(AdminPageDTO adto);

	public int getBookSearchCountProcess(AdminPageDTO adto);

	public List<BookDTO> getBookSearchProcess(AdminPageDTO adto);

	public int getBookListCountProcess();

	public UserDTO getUserOneProcess(String id);

	public void userUpdateProcess(UserDTO udto);

	public BookDTO getBookOneProcess(int bno);

	public List<GenreDTO> getGenreListProcess();

	public void bookInsertProcess(BookDTO dto);

	public int getAuthorSearchCountProcess(AdminPageDTO adto);

	public List<BookDTO> getAuthorSearchProcess(AdminPageDTO adto);

	public int getAuthorListCountProcess();

	public List<BookDTO> getAuthorListProcess(AdminPageDTO adto);

}
