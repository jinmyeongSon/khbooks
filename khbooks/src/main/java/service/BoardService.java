package service;

import java.util.List;

import dto.BoardDTO;
import dto.PageDTO;

public interface BoardService {	
	public int countProcess(); 
	public List<BoardDTO> listProcess(PageDTO pdto);
	public BoardDTO contentProcess(int bonum);
}
