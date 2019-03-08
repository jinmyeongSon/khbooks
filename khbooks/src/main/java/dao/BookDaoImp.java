package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BookDTO;
import dto.GenreDTO;
import dto.PageDTO;

public class BookDaoImp implements BookDAO{
	SqlSessionTemplate sqlSession; 
	
	@Override
	public List<BookDTO> bookList(PageDTO dto) {
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

}
