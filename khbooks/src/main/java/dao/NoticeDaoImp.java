package dao;

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
		sqlSession.selectOne("notice.readCount");
	}

	@Override
	public NoticeDTO noticeView(int nnum) {
		return sqlSession.selectOne("notice.view", nnum);
	}

	@Override
	public void noticeInsert(NoticeDTO ndto) {
		sqlSession.insert("notice.insert", ndto);
		int nnum = ndto.getNnum();
		System.out.println("dao에서 공지사항 번호 : " + nnum);
		List<UploadDTO> uList = ndto.getuList();
		if(uList != null && uList.size() > 0) {
			for(int i = 0; i < uList.size(); i++) {
				uList.set(i, new UploadDTO(nnum, uList.get(i).getUpname()));
			}
			sqlSession.insert("upload.insert", uList);
		}
	}

	@Override
	public NoticeDTO noticeUpdateNum(int nnum) {
		return null;
	}

	@Override
	public void noticeUpdate(NoticeDTO ndto) {
		
	}

	@Override
	public void noticeDelete(int nnum) {
		
	}

}
