package service;

import java.util.List;

import dto.NoticeDTO;
import dto.PageDTO;
import dto.UploadDTO;

public interface NoticeService {
	public int noticeCountPro(); 
	public List<NoticeDTO> noticeListPro(PageDTO pdto);
	public List<NoticeDTO> noticeViewPro(int nnum);
	public void noticeInsertPro(NoticeDTO dto);
	public List<NoticeDTO> noticeUpdateNum(int nnum);
	public void noticeUpdatePro(NoticeDTO dto);
	public void noticeDeletePro(int nnum);
	public List<UploadDTO> uploadList(UploadDTO udto);

}
