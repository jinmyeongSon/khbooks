package service;

import java.util.List;

import dao.BoardDAO;
import dto.BoardDTO;
import dto.PageDTO;

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

}//end class
