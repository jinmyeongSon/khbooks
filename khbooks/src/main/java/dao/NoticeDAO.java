package dao;

import java.util.List;

import dto.NoticeDTO;
import dto.PageDTO;
import dto.UploadDTO;

public interface NoticeDAO {
	public int noticeCount();
	public List<NoticeDTO> noticeList(PageDTO pdto);
	public void noticeReadCount(int nnum);
	public List<NoticeDTO> noticeView(int nnum);
	public void	noticeInsert(NoticeDTO ndto);
	public	List<NoticeDTO> noticeUpdateNum(int nnum);
	public void noticeUpdate(NoticeDTO ndto);
	public void noticeDelete(int nnum);
	public List<UploadDTO> uploadList(UploadDTO udto);
}
