package service;

import java.util.List;
import java.util.Map;

import dao.FavBookDAO;
import dto.BookDTO;

public class FavBookServiceImp implements FavBookService{
	private FavBookDAO dao;
	
	
	public FavBookServiceImp() {
	}
	
	public void setDao(FavBookDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public List<BookDTO> listprocess(Map<String, Object> map) {
		return dao.FavList(map);
	}
	@Override
	public void deleteprocess(int num) {
		dao.delete(num);
	}

	@Override
	public int countprocess(String id) {
		return dao.count(id);
	}

	@Override
	public int searchprocess(Map<String, Object> map) {
		return dao.search(map);
	}

	@Override
	public void insertporcess(Map<String, Object> map) {
		dao.insert(map);
	}
	
}
