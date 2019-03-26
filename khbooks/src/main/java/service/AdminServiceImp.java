package service;

import java.util.List;

import dao.AdminDAO;
import dto.AdminPageDTO;
import dto.BookDTO;
import dto.GenreDTO;
import dto.UserDTO;

public class AdminServiceImp implements AdminService {
	private AdminDAO dao;
	
	public AdminServiceImp() {
		
	}
	
	public void setDao(AdminDAO dao) {
		this.dao = dao;
	}

	@Override
	public int adminLoginCheckProcess(String id, String pass) {
		return dao.adminLoginCheck(id, pass);
	}

	@Override
	public List<UserDTO> getUserListProcess(AdminPageDTO adto) {
		return dao.getUserList(adto);
	}

	@Override
	public List<BookDTO> getBookListProcess(AdminPageDTO adto) {
		return dao.getBookList(adto);
	}

	@Override
	public int getUserListCountProcess() {
		return dao.getUserListCount();
	}

	@Override
	public List<UserDTO> getUserSearchProcess(AdminPageDTO adto) {
		return dao.getUserSearch(adto);
	}

	@Override
	public int getUserSearchCountProcess(AdminPageDTO adto) {
		return dao.getUserSearchCount(adto);
	}

	@Override
	public int getBookSearchCountProcess(AdminPageDTO adto) {
		return dao.getBookSearchCount(adto);
	}

	@Override
	public List<BookDTO> getBookSearchProcess(AdminPageDTO adto) {
		return dao.getBookSearch(adto);
	}

	@Override
	public int getBookListCountProcess() {
		return dao.getBookListCount();
	}

	@Override
	public UserDTO getUserOneProcess(String id) {
		return dao.getUserOne(id);
	}

	@Override
	public void userUpdateProcess(UserDTO udto) {
		dao.userUpdate(udto);
	}

	@Override
	public BookDTO getBookOneProcess(int bno) {
		return dao.getBookOne(bno);
	}

	@Override
	public List<GenreDTO> getGenreListProcess() {
		return dao.getGenreList();
	}

	@Override
	public void bookInsertProcess(BookDTO dto) {
		dao.bookInsert(dto);
		
	}

	@Override
	public int getAuthorSearchCountProcess(AdminPageDTO adto) {
		return dao.getAuthorSearchCount(adto);
	}

	@Override
	public List<BookDTO> getAuthorSearchProcess(AdminPageDTO adto) {
		return dao.getAuthorSearch(adto);
	}

	@Override
	public int getAuthorListCountProcess() {
		return dao.getAuthorListCount();
	}

	@Override
	public List<BookDTO> getAuthorListProcess(AdminPageDTO adto) {
		return dao.getAuthorList(adto);
	}

}
