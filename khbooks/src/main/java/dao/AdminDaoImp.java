package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.AdminPageDTO;
import dto.BookDTO;
import dto.GenreDTO;
import dto.UserDTO;

public class AdminDaoImp implements AdminDAO {
	private SqlSessionTemplate sqlSession;
	
	public AdminDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int adminLoginCheck(String id, String pass) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pass", pass);
		return sqlSession.selectOne("admin.loginCheck", map);
	}

	@Override
	public List<UserDTO> getUserList(AdminPageDTO adto) {
		return sqlSession.selectList("admin.userList", adto);
	}

	@Override
	public List<BookDTO> getBookList(AdminPageDTO adto) {
		return sqlSession.selectList("admin.bookList", adto);
	}

	@Override
	public int getUserListCount() {
		return sqlSession.selectOne("admin.userListCount");
	}

	@Override
	public List<UserDTO> getUserSearch(AdminPageDTO adto) {
		return sqlSession.selectList("admin.userSearch", adto);
	}

	@Override
	public int getUserSearchCount(AdminPageDTO adto) {
		return sqlSession.selectOne("admin.userSearchCount", adto);
	}

	@Override
	public int getBookListCount() {
		return sqlSession.selectOne("admin.bookListCount");
	}

	@Override
	public List<BookDTO> getBookSearch(AdminPageDTO adto) {
		return sqlSession.selectList("admin.bookSearch", adto);
	}

	@Override
	public int getBookSearchCount(AdminPageDTO adto) {
		return sqlSession.selectOne("admin.bookSearchCount", adto);
	}

	@Override
	public UserDTO getUserOne(String id) {
		return sqlSession.selectOne("admin.userOne", id);
	}

	@Override
	public void userUpdate(UserDTO udto) {
		sqlSession.update("admin.userUpdate", udto);
	}

	@Override
	public BookDTO getBookOne(int bno) {
		return sqlSession.selectOne("admin.bookOne", bno);
	}

	@Override
	public List<GenreDTO> getGenreList() {
		return sqlSession.selectList("book.genreList");
	}

	@Override
	public void bookInsert(BookDTO dto) {
		sqlSession.insert("admin.bookInsert", dto);
	}

	@Override
	public int getAuthorSearchCount(AdminPageDTO adto) {
		return sqlSession.selectOne("admin.authorSearchCount", adto);
	}

	@Override
	public List<BookDTO> getAuthorSearch(AdminPageDTO adto) {
		return sqlSession.selectList("admin.authorSearch", adto);
	}

	@Override
	public int getAuthorListCount() {
		return sqlSession.selectOne("admin.authorListCount");
	}

	@Override
	public List<BookDTO> getAuthorList(AdminPageDTO adto) {
		return sqlSession.selectList("admin.authorList", adto);
	}

}
