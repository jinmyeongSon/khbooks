package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.PageDTO;
import service.FavAuthorService;

//http://localhost:8090/khbook/favAuthorList.kh

@Controller
public class FavAuthorController {
	private FavAuthorService service;
	private int currentPage;
	private PageDTO pdto;
	
	public FavAuthorController() {
	 
	}
	public void setService(FavAuthorService service) {
		this.service = service;
	}
	
	@RequestMapping("/favAuthorList.kh")
	public ModelAndView favAuthorList(String id,PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String,Object>();
		int totalRecord = service.countprocess();
		if(totalRecord >=1) {
			if(pv.getCurrentPage()==0) {
				currentPage=1;
			}else {
				currentPage = pv.getCurrentPage();
			}
			pdto= new PageDTO(currentPage,totalRecord);
			id= "a";
			map.put("id", id);
			map.put("pdto",pdto);
			
			mav.addObject("pv",pdto);
			mav.addObject("aList",service.listprocess(map));
			mav.setViewName("/favAuthor/favAuthorList");
		}else {
			mav.setViewName("/favAuthor/favAuthorList");
		}
		return mav;
	}
	@RequestMapping("/favAuthorDelte.kh")
	public ModelAndView favAuthorDelete(int num) {
		ModelAndView mav = new ModelAndView();
		service.deleteprocess(num);
		mav.setViewName("redirect:/favAuthorList.kh");
		return mav;
	}
}