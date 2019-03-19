package dao;

import java.util.List;
import java.util.Map;

import dto.ReviewCommentDTO;
import dto.SerialDTO;

public interface SerialDAO {

	int getSerialCount(int bno);

	int getSerialMyCount(Map<String, Object> map);

	int getUpno(Map<String, Object> map);

	List<ReviewCommentDTO> getReviewComment(int upno);

	SerialDTO getSerial(Map<String, Object> map);

	void insertReviewComment(ReviewCommentDTO rdto);

	void deleteReviewComment(ReviewCommentDTO rdto);
	
}
