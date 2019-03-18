package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.PageDTO;
import service.FavBookService;

//http://localhost:8090/khbook/favBookList.kh

@Controller
public class FavBookController {
	private FavBookService service;
	private int currentPage;
	private PageDTO pdto;
	
	public FavBookController() {
	}
	
	public void setService(FavBookService service) {
		this.service = service;
	}

	@RequestMapping("/favBookList.kh")
	public ModelAndView favBookList(String id,PageDTO pv) {
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
			mav.setViewName("/favBook/favBookList");
		}else {
			mav.setViewName("/favBook/favBookList");
		}
		return mav;
	}
	@RequestMapping("/favDelete.kh")
	public ModelAndView favDelete(int num) {
		ModelAndView mav = new ModelAndView();
		System.out.println(num);
		service.deleteprocess(num);
		mav.setViewName("redirect:/favBookList.kh");
		return mav;
	}
	
}
