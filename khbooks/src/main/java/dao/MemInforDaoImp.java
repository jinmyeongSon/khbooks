package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import dto.UserDTO;

public class MemInforDaoImp implements MemInforDAO{
	private SqlSessionTemplate sqlSession;
	
	public MemInforDaoImp() {
	}
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public UserDTO list(String id) {
		return sqlSession.selectOne("memInfor.list",id);
	}
	@Override
	public void update(UserDTO dto) {
		sqlSession.update("memInfor.update",dto);
	}
	@Override
	public void delete(String id) {
		sqlSession.delete("memInfor.delete",id);
		
	}

}
