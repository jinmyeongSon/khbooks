package service;

import java.util.List;
import java.util.Map;

import dao.FavAuthorDAO;
import dto.AuthorDTO;

public class FavAuthorServiceImp implements FavAuthorService {
	private FavAuthorDAO dao;
	
	public FavAuthorServiceImp() {
	}
	
	public void setDao(FavAuthorDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<AuthorDTO> listprocess(Map<String, Object> map) {
		return dao.FavList(map);
	}

	@Override
	public int countprocess(String id) {
		return dao.count(id);
	}

	@Override
	public void deleteprocess(Map<String, Object> map) {
		dao.FavDelete(map);
		
	}

	@Override
	public int searchprocess(Map<String, Object> map) {
		return dao.search(map);
	}

	@Override
	public void insertprocess(Map<String, Object> map) {
		dao.insert(map);
		
	}
	

}