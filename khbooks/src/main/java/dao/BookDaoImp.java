package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BookDTO;
import dto.GenreDTO;

public class BookDaoImp implements BookDAO{
	SqlSessionTemplate sqlSession; 
	
	@Override
	public List<BookDTO> bookList() {
		return sqlSession.selectList("book.bookList");
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

}
