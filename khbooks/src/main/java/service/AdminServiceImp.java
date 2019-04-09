package service;

import java.util.List;
import java.util.Map;

import dao.AdminDAO;
import dto.AdminPageDTO;
import dto.AuthorDTO;
import dto.BookDTO;
import dto.GenreDTO;
import dto.SerialDTO;
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

	@Override
	public AuthorDTO getAuthorOneProcess(int auno) {
		return dao.getAuthorOne(auno);
	}

	@Override
	public void authorUpdateProcess(AuthorDTO adto) {
		dao.authorUpdate(adto);
	}

	@Override
	public void authorInsertProcess(AuthorDTO adto) {
		dao.authorInsert(adto);
	}

	@Override
	public void userDeleteProcess(String id) {
		dao.userDelete(id);
	}

	@Override
	public void bookDeleteProcess(int bno) {
		dao.bookDelete(bno);
	}

	@Override
	public void authorDeleteProcess(int auno) {
		dao.authorDelete(auno);
	}

	@Override
	public String getBookGenreProcess(int bno) {
		return dao.getBookGenre(bno);
	}

	@Override
	public List<SerialDTO> getSerialListProcess(int bno) {
		return dao.getSerialList(bno);
	}

	@Override
	public void serialDeleteProcess(int upno) {
		dao.serialDelete(upno);
	}

	@Override
	public void serialUpdateProcess(SerialDTO sdto) {
		dao.serialUpdate(sdto);
	}

	@Override
	public void bookUpdateProcess(BookDTO bdto) {
		dao.bookUpdate(bdto);
	}

	@Override
	public void bookAuthorDeleteProcess(Map<String, Object> map) {
		dao.bookAuthorDelete(map);
	}

	@Override
	public List<AuthorDTO> bookAuthorSearchProcess(Map<String, Object> map) {
		return dao.bookAuthorSearch(map);
	}

	@Override
	public void bookAuthorInsertProcess(Map<String, Object> map) {
		dao.bookAuthorInsert(map);
	}
}
