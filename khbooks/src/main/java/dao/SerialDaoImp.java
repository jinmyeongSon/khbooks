package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BookDTO;
import dto.ReviewCommentDTO;
import dto.SerialDTO;

public class SerialDaoImp implements SerialDAO {
	SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
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

	@Override
	public SerialDTO getSerial(Map<String, Object> map) {
		return sqlSession.selectOne("serial.getSerial", map);
	}

	@Override
	public void insertReviewComment(ReviewCommentDTO rdto) {
		sqlSession.insert("serial.insertReviewComment", rdto);
	}

	@Override
	public void deleteReviewComment(ReviewCommentDTO rdto) {
		sqlSession.delete("serial.deleteReviewComment", rdto);
	}

	@Override
	public int gradeCheck(Map<String, Object> map) {
		return sqlSession.selectOne("serial.gradeCheck", map);
	}

	@Override
	public void gradeInsert(Map<String, Object> map) {
		sqlSession.insert("serial.gradeInsert", map);
		
	}

	@Override
	public void gradeUpdate(Map<String, Object> map) {
		sqlSession.update("serial.gradeUpdate", map);
		
	}

	@Override
	public BookDTO bookInfo(int bno) {
		return sqlSession.selectOne("book.bookDetail", bno);
	}

	@Override
	public List<BookDTO> authorBook(int auno) {
		return sqlSession.selectList("book.authorBook", auno);
	}
}
