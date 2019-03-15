package service;

import java.util.List;

import dao.NoticeDAO;
import dto.BoardDTO;
import dto.NoticeDTO;
import dto.PageDTO;

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
	public NoticeDTO noticeViewPro(int nnum) {
		ndao.noticeReadCount(nnum);
		return ndao.noticeView(nnum);
	}

	@Override
	public void noticeInsertPro(NoticeDTO ndto) {
		ndao.noticeInsert(ndto);
	}

	@Override
	public NoticeDTO noticeUpdateSelectPro(int nnum) {
		return null;
	}

	@Override
	public void noticeUpdatePro(NoticeDTO dto) {
		
	}

	@Override
	public void noticeDeletePro(int nnum) {
		
	}

}
