package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.UserDTO;

public class UserDaoImp implements UserDAO{
	private SqlSessionTemplate sqlSession;
	
	public UserDaoImp() {
	
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void userInsertMethod(UserDTO udto) {
		sqlSession.insert("user.u_insert", udto);
		
	}

	
	@Override
	public void userUpdateMethod(UserDTO udto) {
		sqlSession.update("user.u_update", udto);
		
	}
	
	@Override
	public void userDeleteMethod(UserDTO id) {
		sqlSession.delete("user.u_delete", id);
		
	}

	
	
}//end class
