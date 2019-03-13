package dao;

import java.util.List;
import java.util.Map;

import dto.ReviewCommentDTO;

public interface SerialDAO {

	String getSerialContent(int upno);

	int getSerialCount(int bno);

	int getSerialMyCount(Map<String, Object> map);

	int getUpno(Map<String, Object> map);

	List<ReviewCommentDTO> getReviewComment(int upno);
	
}
