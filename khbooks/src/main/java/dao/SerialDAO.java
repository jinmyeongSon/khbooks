package dao;

import java.util.List;
import java.util.Map;

import dto.BookDTO;
import dto.ReviewCommentDTO;
import dto.SerialDTO;

public interface SerialDAO {

	List<ReviewCommentDTO> getAllReviewComment();

	int getSerialCount(int bno);

	int getSerialMyCount(Map<String, Object> map);

	int getUpno(Map<String, Object> map);

	List<ReviewCommentDTO> getReviewComment(int upno);

	SerialDTO getSerial(Map<String, Object> map);

	void insertReviewComment(ReviewCommentDTO rdto);

	void deleteReviewComment(ReviewCommentDTO rdto);

	int gradeCheck(Map<String, Object> map);

	void gradeInsert(Map<String, Object> map);

	void gradeUpdate(Map<String, Object> map);

	BookDTO bookInfo(int bno);

	List<BookDTO> authorBook(Map<String, Object> map);

	int getSerialPrice(int bno, int rm);

	int getSerialCheck(int upno, String id);

	void serialPay(Map<String, Object> map);
	
}
