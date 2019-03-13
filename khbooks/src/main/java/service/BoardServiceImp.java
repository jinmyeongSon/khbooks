package service;

import java.util.List;

import dao.BoardDAO;
import dto.BoardDTO;
import dto.PageDTO;
import dto.ReplyDTO;

public class BoardServiceImp implements BoardService {
	private BoardDAO dao;
	
	public BoardServiceImp() {
		
	}
	
	public void setDao(BoardDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public int countProcess() {
		return dao.count();
	}
	
	@Override
	public List<BoardDTO> listProcess(PageDTO pdto) {
		return dao.list(pdto);
	}
	
	@Override
	public BoardDTO contentProcess(int bonum) {
		dao.readCount(bonum);
		return dao.content(bonum);
	}
	
	@Override
	public void insertProcess(BoardDTO dto) {
		
	}
	
	@Override
	public BoardDTO updateSelectProcess(int bonum) {
		return dao.updateNum(bonum);
	}
	
	@Override
	public void updateProcess(BoardDTO dto) {
		dao.update(dto);
	}
	
	@Override
	public void deleteProcess(int bonum) {
		dao.delete(bonum);
	}
	
	/////////////댓글//////////////////////////////////////////////////////////////////////////
	
	@Override
	public int replyCountProcess(int bonum) {
		return dao.replyCount(bonum);
	}

	@Override
	public List<ReplyDTO> replyListProcess(ReplyDTO rdto) {
		return dao.replyListMethod(rdto.getBonum());
	}
	
	@Override
	public void replyInsertProcess(ReplyDTO rdto) {
		dao.replyInsertMethod(rdto);
	}
	
	@Override
	public List<ReplyDTO> replyDeleteProcess(ReplyDTO rdto) {
		dao.replyDeleteMethod(rdto.getBcno());
		return dao.replyListMethod(rdto.getBonum());
	}

	@Override
	public List<ReplyDTO> replyUpdateProcess(ReplyDTO rdto) {
		dao.replyUpdateMethod(rdto);
		return dao.replyListMethod(rdto.getBonum());
	}

}//end class
