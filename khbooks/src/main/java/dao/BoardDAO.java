package dao;

import java.util.List;

import dto.BoardDTO;
import dto.PageDTO;

public interface BoardDAO {
	public int count();
	public List<BoardDTO> list(PageDTO pdto);
	public void readCount(int num);
	public BoardDTO content(int num);

}
