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
	
	/////////////댓글//////////////////////////////////////////////////////////////////////////
	
	@Override
	public int replyCountProcess() {
		return dao.replyCount();
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReplyDTO> replyUpdateProcess(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		return null;
	}

}//end class
