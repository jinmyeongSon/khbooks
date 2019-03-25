package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BookDTO;

public class BUploadDaoImp implements BUploadDAO{
	private SqlSessionTemplate sqlSession;
	
	public BUploadDaoImp() {
	
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<BookDTO> bookListMethod() {
		return sqlSession.selectList("bup.list");
	}
	
	@Override
	public void bookInsertMethod(BookDTO bdto) {
		sqlSession.insert("bup.ins", bdto);
	}

}
