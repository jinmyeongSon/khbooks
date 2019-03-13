package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.ReviewCommentDTO;

public class SerialDaoImp implements SerialDAO {
	SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public String getSerialContent(int upno) {
		return sqlSession.selectOne("serial.content", upno);
	}

	@Override
	public int getSerialCount(int bno) {
		return sqlSession.selectOne("serial.count", bno);
	}

	@Override
	public int getSerialMyCount(Map<String, Object> map) {
		return sqlSession.selectOne("serial.myCount", map);
	}

	@Override
	public int getUpno(Map<String, Object> map) {
		return sqlSession.selectOne("serial.upno", map);
	}

	@Override
	public List<ReviewCommentDTO> getReviewComment(int upno) {
		return sqlSession.selectList("serial.reviewList", upno);
	}
}
