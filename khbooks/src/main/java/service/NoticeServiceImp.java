package service;

import java.util.List;
import java.util.Map;

import dao.NoticeDAO;
import dto.NoticeDTO;
import dto.PageDTO;
import dto.UploadDTO;

public class NoticeServiceImp implements NoticeService {
	private NoticeDAO ndao;
	
	public NoticeServiceImp() {
		
	}
	
	public void setNdao(NoticeDAO ndao) {
		this.ndao = ndao;
	}

	@Override
	public int noticeCountPro() {
		return ndao.noticeCount();
	}

	@Override
	public List<NoticeDTO> noticeListPro(PageDTO pdto) {
		return ndao.noticeList(pdto);
	}

	@Override
	public List<NoticeDTO> noticeViewPro(int nnum) {
		ndao.noticeReadCount(nnum);
		return ndao.noticeView(nnum);
	}

	@Override
	public void noticeInsertPro(NoticeDTO ndto) {
		ndao.noticeInsert(ndto);
	}

	@Override
	public List<NoticeDTO> noticeUpdateNum(int nnum) {
		return ndao.noticeUpdateNum(nnum);
	}

	@Override
	public void noticeUpdatePro(NoticeDTO ndto) {
		ndao.noticeUpdate(ndto);
	}

	@Override
	public void noticeDeletePro(int nnum) {
		ndao.noticeDelete(nnum);
	}
	
	@Override
	public List<UploadDTO> uploadList(UploadDTO udto) {
		return ndao.uploadList(udto);
	}

}
