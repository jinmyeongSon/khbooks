package dao;


import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import dto.UserDTO;


@Repository
public class UserDaoImp implements UserDAO{
	private SqlSessionTemplate sqlSession;
	
	
	public UserDaoImp() {
	
	}
	
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void register(UserDTO udto) {
		sqlSession.insert("user.u_ins", udto);
	}
	

	@Override
	public UserDTO login(UserDTO udto) {
		return sqlSession.selectOne("user.login", udto);
	}


	@Override
	public int CheckDuplication(String id) {
		return sqlSession.selectOne("user.id_chk", id);
	}


	


	
	
}//end class
