package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.PageDTO;
import dto.ReplyDTO;

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
		sqlSession.update("board.readCount", num);
	}
	
	@Override
	public BoardDTO content(int bonum) {
		return sqlSession.selectOne("board.content", bonum);
	}
	
	@Override
	public void insert(BoardDTO dto) {
		sqlSession.insert("board.insert", dto);
	}
	
	@Override
	public void update(BoardDTO dto) {
		sqlSession.update("board.update", dto);
	}
	
	@Override
	public BoardDTO updateNum(int bonum) {
		return sqlSession.selectOne("board.content", bonum);
	}
	
	@Override
	public void delete(int bonum) {
		sqlSession.delete("board.delete", bonum);
	}
	
	@Override
	public int replyCount(int bonum) {
		return sqlSession.selectOne("reply.count", bonum);
	}

	@Override
	public List<ReplyDTO> replyListMethod(int bonum) {
		return sqlSession.selectList("reply.list", bonum);
	}

	@Override
	public void replyInsertMethod(ReplyDTO rdto) {
		sqlSession.insert("reply.insert", rdto);
	}

	@Override
	public void replyUpdateMethod(ReplyDTO rdto) {
		sqlSession.update("reply.update", rdto);
	}

	@Override
	public void replyDeleteMethod(int bcno) {
		sqlSession.delete("reply.delete", bcno);
	}

}
