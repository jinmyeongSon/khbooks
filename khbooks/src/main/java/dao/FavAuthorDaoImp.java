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
	public void FavDelete(int num) {
		sqlSession.delete("FavAuthor.delete",num);
	}
}
