package service;

import java.util.List;
import java.util.Map;

import dto.BookDTO;
import dto.ReviewCommentDTO;
import dto.SerialDTO;

public interface SerialService {

	int getSerialCountProcess(int bno);
	int getSerialMyCountProcess(Map<String, Object> map);
	int getUpnoProcess(Map<String, Object> map);
	List<ReviewCommentDTO> getReviewCommentProcess(int upno);
	SerialDTO getSerialProcess(Map<String, Object> map);
	void insertReviewCommentProcess(ReviewCommentDTO rdto);
	void deleteReviewCommentProcess(ReviewCommentDTO rdto);
	int gradeCheckProcess(Map<String, Object> map);
	void gradeInsertProcess(Map<String, Object> map);
	void gradeUpdateProcess(Map<String, Object> map);
	BookDTO bookInfoProcess(int bno);
	List<BookDTO> authorBookProcess(int auno);
	List<ReviewCommentDTO> getAllReviewCommentProcess();
	
}
