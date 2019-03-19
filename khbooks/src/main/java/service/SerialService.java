package service;

import java.util.List;
import java.util.Map;

import dto.ReviewCommentDTO;
import dto.SerialDTO;

public interface SerialService {

	int getSerialCountProcess(int bno);
	int getSerialMyCountProcess(Map<String, Object> map);
	int getUpnoProcess(Map<String, Object> map);
	List<ReviewCommentDTO> getReviewCommentProcess(int upno);
	SerialDTO getSerialProcess(Map<String, Object> map);
	void insertReviewCommentProcess(ReviewCommentDTO rdto);
	
}
