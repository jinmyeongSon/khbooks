package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.AuthorDTO;
import dto.BookDTO;

public class AuthorDaoImp implements AuthorDAO{
	private SqlSessionTemplate sqlSession;
	
	public AuthorDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<BookDTO> BookList(int auno) {
		return sqlSession.selectList("author.bookList",auno);
	}

	@Override
	public AuthorDTO Author(int auno) {
		return sqlSession.selectOne("author.authorin",auno);
	}

	@Override
	public void insert(Map<String, Object> map) {
		sqlSession.insert("author.insert",map);
		
	}

	@Override
	public int search(Map<String, Object> map) {
		return sqlSession.selectOne("author.search",map);
	}
	
}
