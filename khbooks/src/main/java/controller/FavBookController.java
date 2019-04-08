package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView favBookList(PageDTO pv,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String,Object>();
		String id = (String)session.getAttribute("id");
		session.setAttribute("id", id);
		if(id== null) {
			mav.setViewName("/favBook/favBookList");
		}else {
			int totalRecord = service.countprocess(id);
			if(totalRecord >=1) {
				if(pv.getCurrentPage()==0) {
					currentPage=1;
				}else {
					currentPage = pv.getCurrentPage();
				}
				pdto= new PageDTO(currentPage,totalRecord);
				//id= "a";
				map.put("id", (String)session.getAttribute("id"));
				map.put("pdto",pdto);
				
				mav.addObject("pv",pdto);
				mav.addObject("aList",service.listprocess(map));
				mav.setViewName("/favBook/favBookList");
			}else {
				mav.setViewName("/favBook/favBookList");
			}
		}
		
		return mav;
	}
	@RequestMapping("/favDelete.kh")
	public ModelAndView favDelete(HttpSession session,int num, int currentPage) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", (String)session.getAttribute("id"));
		map.put("bno", num);
		service.deleteprocess(map);
		PageDTO pv= new PageDTO(currentPage,service.countprocess((String)session.getAttribute("id")));
		if(pv.getTotalPage() <= currentPage)
			mav.addObject("currentPage",pv.getTotalPage());
		else 
			mav.addObject("currentPage",pv.getTotalPage());
		mav.addObject("currentPage",currentPage);
		mav.setViewName("redirect:/favBookList.kh");
		return mav;
	}
	@RequestMapping("/favinsert.kh")
	public @ResponseBody int favInsert(HttpSession session,int bno) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", (String)session.getAttribute("id"));
		map.put("bno", bno);
		int num = service.searchprocess(map);
		if(num==0) {
			service.insertporcess(map);
		}
		
		return num; 
	}
	
	@RequestMapping("/favBookDelete.kh")
	public @ResponseBody int favBookDelete(int bno,HttpSession session) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", (String)session.getAttribute("id"));
		map.put("bno", bno);
		service.bookdeleteprocess(map);
		return 1;
	}
	
	
}
