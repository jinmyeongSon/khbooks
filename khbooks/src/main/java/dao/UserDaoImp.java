package dao;


import java.util.HashMap;
import java.util.Map;

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
	

	/*@Override
	public UserDTO login(UserDTO udto) {
		return sqlSession.selectOne("user.login", udto);
	}*/
	@Override
	public boolean login(UserDTO udto) {
		String id =  sqlSession.selectOne("user.login", udto);
		return (id == null) ? false : true;
	}


	@Override
	public int CheckDuplication(String id) {
		return sqlSession.selectOne("user.id_chk", id);
	}


	@Override
	public String naverinfo(String email) {
		return sqlSession.selectOne("user.naverInfo", email);
	}


	@Override
	public UserDTO findAccount(String email) {
		return sqlSession.selectOne("user.find_id", email);
	}


	@Override
	public void updateInfo(String id, String pwd) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		sqlSession.update("user.temp_pwd", map);
		
	}


	@Override
	public int CheckDuplicationEmail(String email) {
		return sqlSession.selectOne("user.email_chk", email);
	}



	
	
	
}//end class
