package dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import dto.AdminPageDTO;
import dto.AuthorDTO;
import dto.BookDTO;
import dto.GenreDTO;
import dto.SerialDTO;
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

	@Override
	public AuthorDTO getAuthorOne(int auno) {
		return sqlSession.selectOne("admin.authorOne", auno);
	}

	@Override
	public void authorUpdate(AuthorDTO adto) {
		sqlSession.update("admin.authorUpdate", adto);
	}

	@Override
	public void authorInsert(AuthorDTO adto) {
		sqlSession.insert("admin.authorInsert", adto);
	}

	@Override
	public void userDelete(String id) {
		sqlSession.delete("admin.userDelete", id);
	}

	@Override
	public void bookDelete(int bno) {
		sqlSession.delete("admin.bookDelete", bno);
	}

	@Override
	public void authorDelete(int auno) {
		sqlSession.delete("admin.authorDelete", auno);
	}

	@Override
	public String getBookGenre(int bno) {
		return sqlSession.selectOne("book.bookGenre", bno);
	}

	@Override
	public List<SerialDTO> getSerialList(int bno) {
		return sqlSession.selectList("book.serialList", bno);
	}

	@Override
	public void serialDelete(int upno) {
		String scontent = sqlSession.selectOne("admin.getContent", upno);
		if(scontent != null) {
			File oldFile = new File("C:\\temp\\test", scontent);
			oldFile.delete();
		}
		sqlSession.delete("admin.serialDelete", upno);
	}

	@Override
	public void serialUpdate(SerialDTO sdto) {
		if(sdto.getScontent() != null) {
			String scontent = sqlSession.selectOne("admin.getContent", sdto.getUpno());
			if(scontent != null) {
				File oldFile = new File("C:\\temp\\test", scontent);
				oldFile.delete();
			}
		}
		sqlSession.update("admin.serialUpdate", sdto);
	}

	@Override
	public void bookUpdate(BookDTO bdto) {
		sqlSession.update("admin.bookUpdate", bdto);
	}

	@Override
	public void bookAuthorDelete(Map<String, Object> map) {
		sqlSession.delete("admin.baDelete", map);
	}
	
}
