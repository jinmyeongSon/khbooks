package service;

import java.util.List;
import java.util.Map;

import dto.ReviewCommentDTO;

public interface SerialService {

	String getSerialContentProcess(int upno);
	int getSerialCountProcess(int bno);
	int getSerialMyCountProcess(Map<String, Object> map);
	int getUpnoProcess(Map<String, Object> map);
	List<ReviewCommentDTO> getReviewCommentProcess(int upno);
	
}
