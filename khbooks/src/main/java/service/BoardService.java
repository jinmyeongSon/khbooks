package service;

import java.util.List;

import dto.BoardDTO;
import dto.NoticeDTO;
import dto.PageDTO;
import dto.ReplyDTO;

public interface BoardService {	
	public int countProcess(); 
	public List<BoardDTO> listProcess(PageDTO pdto);
	public BoardDTO contentProcess(int bonum);
	public void insertProcess(BoardDTO dto);
	public BoardDTO updateSelectProcess(int bonum);
	public void updateProcess(BoardDTO dto);
	public void deleteProcess(int bonum);
	
	public int replyCountProcess(int bonum);
	public void replyInsertProcess(ReplyDTO rdto);
	public List<ReplyDTO> replyListProcess(ReplyDTO rdto);
	public List<ReplyDTO> replyDeleteProcess(ReplyDTO rdto);
	public List<ReplyDTO> replyUpdateProcess(ReplyDTO rdto);
}
