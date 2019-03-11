package service;

import java.util.List;

import dto.BoardDTO;
import dto.PageDTO;
import dto.ReplyDTO;

public interface BoardService {	
	public int countProcess(); 
	public List<BoardDTO> listProcess(PageDTO pdto);
	public BoardDTO contentProcess(int bonum);
	public int replyCountProcess(int bonum);
	public void replyInsertProcess(ReplyDTO rdto);
	public List<ReplyDTO> replyListProcess(ReplyDTO rdto);
	public List<ReplyDTO> replyDeleteProcess(ReplyDTO rdto);
	public List<ReplyDTO> replyUpdateProcess(ReplyDTO rdto);
}
