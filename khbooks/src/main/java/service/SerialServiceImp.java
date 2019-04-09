package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.SerialDAO;
import dto.BookDTO;
import dto.ReviewCommentDTO;
import dto.SerialDTO;

public class SerialServiceImp implements SerialService {
	SerialDAO dao;
	
	public void setDao(SerialDAO dao) {
		this.dao = dao;
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

	@Override
	public SerialDTO getSerialProcess(Map<String, Object> map) {
		return dao.getSerial(map);
	}

	@Override
	public void insertReviewCommentProcess(ReviewCommentDTO rdto) {
		dao.insertReviewComment(rdto);
	}

	@Override
	public void deleteReviewCommentProcess(ReviewCommentDTO rdto) {
		dao.deleteReviewComment(rdto);
	}

	@Override
	public int gradeCheckProcess(Map<String, Object> map) {
		return dao.gradeCheck(map);
	}

	@Override
	public void gradeInsertProcess(Map<String, Object> map) {
		dao.gradeInsert(map);
	}

	@Override
	public void gradeUpdateProcess(Map<String, Object> map) {
		dao.gradeUpdate(map);
	}

	@Override
	public BookDTO bookInfoProcess(int bno) {
		return dao.bookInfo(bno);
	}


	@Override
	public List<BookDTO> authorBookProcess(Map<String, Object> map) {
		return dao.authorBook(map);
	}

	@Override
	public List<ReviewCommentDTO> getAllReviewCommentProcess() {
		return dao.getAllReviewComment();
	}
	
	@Override
	public int getSerialPriceProcess(int bno, int rm) {
		return dao.getSerialPrice(bno, rm);
	}
	
	@Override
	public int getSerialCheckProcess(int bno, int rm, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("rm", rm);
		int upno = dao.getUpno(map);
		return dao.getSerialCheck(upno, id);
	}
	
@Override
	public void serialPayProcess(int bno, int rm, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("rm", rm);
		int upno = dao.getUpno(map);
		map.put("upno", upno);
		map.put("id", id);
		dao.serialPay(map);
	}

	
}
