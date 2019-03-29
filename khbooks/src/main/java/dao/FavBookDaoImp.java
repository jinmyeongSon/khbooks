package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BookDTO;
import dto.PageDTO;

public class FavBookDaoImp implements FavBookDAO{
	private SqlSessionTemplate sqlSession;
	
	public FavBookDaoImp() {
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<BookDTO> FavList(Map<String, Object> map) {
		return sqlSession.selectList("FavBook.list",map);
	}
	@Override
	public void delete(int num) {
		sqlSession.delete("FavBook.delete",num);
		
	}

	@Override
	public int count(String id) {
		return sqlSession.selectOne("FavBook.count",id);
	}

	@Override
	public int search(Map<String, Object> map) {
		return sqlSession.selectOne("FavBook.search",map);
	}

	@Override
	public void insert(Map<String, Object> map) {
		sqlSession.insert("FavBook.insert",map);
		
	}
	
	@Override
	public void bookdelete(Map<String, Object> map) {
		sqlSession.delete("FavBook.deleteFb", map);

	}

	

	
}
