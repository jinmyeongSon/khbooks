package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.AuthorDTO;

public class FavAuthorDaoImp implements FavAuthorDAO{
	private SqlSessionTemplate sqlSession;
	
	public FavAuthorDaoImp() {
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int count(String id) {
		return sqlSession.selectOne("FavAuthor.count",id);
	}
	@Override
	public List<AuthorDTO> FavList(Map<String, Object> map) {
		
		return sqlSession.selectList("FavAuthor.list",map);
	}

	@Override
	public void FavDelete(Map<String, Object> map) {
		sqlSession.delete("FavAuthor.delete",map);
	}

	@Override
	public int search(Map<String, Object> map) {
		return sqlSession.selectOne("FavAuthor.search",map);
	}

	@Override
	public void insert(Map<String, Object> map) {
		sqlSession.insert("FavAuthor.insert",map);
		
	}
}
