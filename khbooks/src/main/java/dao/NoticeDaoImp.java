package dao;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import dto.NoticeDTO;
import dto.PageDTO;
import dto.UploadDTO;

public class NoticeDaoImp implements NoticeDAO {
	private SqlSessionTemplate sqlSession;
	
	public NoticeDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int noticeCount() {
		return sqlSession.selectOne("notice.count");
	}

	@Override
	public List<NoticeDTO> noticeList(PageDTO pdto) {
		return sqlSession.selectList("notice.list", pdto);
	}

	@Override
	public void noticeReadCount(int nnum) {
		sqlSession.update("notice.readCount", nnum);
	}

	@Override
	public List<NoticeDTO> noticeView(int nnum) {
		return sqlSession.selectList("notice.view", nnum);
	}

	@Override
	public void noticeInsert(NoticeDTO ndto) {
		sqlSession.insert("notice.insert", ndto);
		
		int nnum = ndto.getNnum();
		String aid = ndto.getAid();
		System.out.println("dao에서 공지사항 번호 : " + nnum);
		
		List<UploadDTO> uList = ndto.getuList();
		if(uList != null && uList.size() > 0) {
			for(int i = 0; i < uList.size(); i++) {
				uList.set(i, new UploadDTO(nnum, uList.get(i).getUpname(), aid));
			}
			sqlSession.insert("upload.insert", uList);
		}
	}

	@Override
	public List<NoticeDTO> noticeUpdateNum(int nnum) {
		return sqlSession.selectList("notice.view", nnum);
	}

	@Override
	public void noticeUpdate(NoticeDTO ndto) {
		System.out.println("dao에서 수정 게시글 번호 : " + ndto.getNnum());
		
		List<UploadDTO> uList = ndto.getuList();
		if(uList != null && uList.size() > 0) {
			for(int i = 0; i < uList.size(); i++) {
				uList.set(i, new UploadDTO(ndto.getNnum(), uList.get(i).getUpname(), ndto.getAid()));
			}
			sqlSession.insert("upload.insert", uList);
		}
		

		sqlSession.update("notice.update", ndto);
	}
	
	@Override
	public List<UploadDTO> uploadList(UploadDTO udto) {
		return sqlSession.selectList("upload.list", udto);
	}

	@Override
	public void noticeDelete(int nnum) {
		String path = "c:/khNotice/";
		List<UploadDTO> uList = sqlSession.selectList("upload.list", nnum);
		System.out.println("uList 사이즈 : " + uList.size());
		
		for(UploadDTO udto : uList) {
			if(udto.getUpname() != null) {
				File oldFile = new File(path, udto.getUpname());
				oldFile.delete();
			}
			sqlSession.delete("upload.delete", udto.getUpno());
		}
		sqlSession.delete("notice.delete", nnum);
	}//end noticeDelete()
	

}//end class
