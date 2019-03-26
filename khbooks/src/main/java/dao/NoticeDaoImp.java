package dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;

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
	
	@Override
	public List<NoticeDTO> search(String bname) {
		return sqlSession.selectList("notice.searchList", bname);
	}
	
	@Override
	public void fileDelete(int upno) {
		sqlSession.delete("notice.fileDelete", upno);
	}
	
	@Override
	public List<NoticeDTO> searchList(String searchWord, PageDTO pdto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bname", searchWord);
		map.put("startRow", pdto.getStartRow());
		map.put("endRow", pdto.getEndRow());
		
		return sqlSession.selectList("notice.searchList", map);
	}
	
	@Override
	public int searchTotalRecord(String bname) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bname", bname);
		
		return sqlSession.selectOne("notice.searchCount", map);
	}
	
	@Override
	public List<NoticeDTO> popularPost() {
		return sqlSession.selectList("notice.popular");
	}
	

}//end class
