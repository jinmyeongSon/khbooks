package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BookDTO;
import dto.GenreDTO;
import dto.SerialDTO;
import dto.BookPageDTO;

public class BookDaoImp implements BookDAO{
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<BookDTO> bookList(BookPageDTO dto) {
		return sqlSession.selectList("book.bookList", dto);
	}
	
	@Override
	public List<GenreDTO> genreList() {
		return sqlSession.selectList("book.genreList");
	}
	
	@Override
	public BookDTO bookDetail(int bno) {
		return sqlSession.selectOne("book.bookDetail", bno);
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int getBookCount() {
		return sqlSession.selectOne("book.bookCount");
	}

	@Override
	public int getBookGenreCount(int sortgenre) {
		return sqlSession.selectOne("book.bookGenreCount", sortgenre);
	}

	@Override
	public List<BookDTO> getBookSearchList(BookPageDTO dto) {
		return sqlSession.selectList("book.bookSearchList", dto);
	}

	@Override
	public int getBookSearchCount(Map<String, Object> map) {
		return sqlSession.selectOne("book.bookSearchCount", map);
	}

	@Override
	public String getBookGenre(int bno) {
		return sqlSession.selectOne("book.bookGenre", bno);
	}

	@Override
	public List<SerialDTO> getSerialList(int bno) {
		return sqlSession.selectList("book.serialList", bno);
	}

}
