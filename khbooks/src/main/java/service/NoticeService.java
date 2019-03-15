package service;

import java.util.List;

import dto.BoardDTO;
import dto.NoticeDTO;
import dto.PageDTO;

public interface NoticeService {
	public int noticeCountPro(); 
	public List<NoticeDTO> noticeListPro(PageDTO pdto);
	public NoticeDTO noticeViewPro(int nnum);
	public void noticeInsertPro(NoticeDTO dto);
	public NoticeDTO noticeUpdateSelectPro(int nnum);
	public void noticeUpdatePro(NoticeDTO dto);
	public void noticeDeletePro(int nnum);

}
