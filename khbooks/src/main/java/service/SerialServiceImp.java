package service;

import java.util.List;
import java.util.Map;

import dao.SerialDAO;
import dto.ReviewCommentDTO;

public class SerialServiceImp implements SerialService {
	SerialDAO dao;
	
	public void setDao(SerialDAO dao) {
		this.dao = dao;
	}

	@Override
	public String getSerialContentProcess(int upno) {
		return dao.getSerialContent(upno);
	}

	@Override
	public int getSerialCountProcess(int bno) {
		return dao.getSerialCount(bno);
	}

	@Override
	public int getSerialMyCountProcess(Map<String, Object> map) {
		return dao.getSerialMyCount(map);
	}

	@Override
	public int getUpnoProcess(Map<String, Object> map) {
		return dao.getUpno(map);
	}

	@Override
	public List<ReviewCommentDTO> getReviewCommentProcess(int upno) {
		return dao.getReviewComment(upno);
	}
	
}
