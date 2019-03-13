package dao;

import java.util.List;

import dto.BoardDTO;
import dto.PageDTO;
import dto.ReplyDTO;

public interface BoardDAO {
	public int count();
	public List<BoardDTO> list(PageDTO pdto);
	public void readCount(int num);
	public BoardDTO content(int num);
	public void insert(BoardDTO dto);
	public BoardDTO updateNum(int num);
	public void update( BoardDTO dto);
	public void delete(int num);
	/////////////////////////////////
	public int replyCount(int bonum);
	public List<ReplyDTO> replyListMethod(int bno);
	public void replyInsertMethod(ReplyDTO rdto);
	public void replyUpdateMethod(ReplyDTO rdto);
	public void replyDeleteMethod(int rno);
	
}
