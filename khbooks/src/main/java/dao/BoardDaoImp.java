package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.PageDTO;

public class BoardDaoImp implements BoardDAO {
	private SqlSessionTemplate sqlSession;
	
	public BoardDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int count() {
		return sqlSession.selectOne("board.count");
	}

	@Override
	public List<BoardDTO> list(PageDTO pdto) {
		return sqlSession.selectList("board.list", pdto);
	}
	
	@Override
	public void readCount(int num) {
		sqlSession.update("board.readCount");
	}
	
	@Override
	public BoardDTO content(int bonum) {
		return sqlSession.selectOne("board.content", bonum);
	}
	
}
