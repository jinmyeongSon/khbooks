package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView favAuthorList(HttpSession session,PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String,Object>();
		String id=(String)session.getAttribute("id");
		session.setAttribute("id", id);
		if(id==null) {
			mav.setViewName("/favAuthor/favAuthorList");
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
				map.put("id",(String)session.getAttribute("id"));
				map.put("pdto",pdto);
				
				mav.addObject("pv",pdto);
				mav.addObject("aList",service.listprocess(map));
				mav.setViewName("/favAuthor/favAuthorList");
			}else {
				mav.setViewName("/favAuthor/favAuthorList");
			}
		}
		return mav;
	}
	@RequestMapping("/favAuthorDelte.kh")
	public ModelAndView favAuthorDelete(HttpSession session,int num) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", (String)session.getAttribute("id"));
		map.put("auno", num);
		service.deleteprocess(map);
		mav.setViewName("redirect:/favAuthorList.kh");
		return mav;
	}
	@RequestMapping("/favAinsert.kh")
	public @ResponseBody int favAInsert(HttpSession session,int auno) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", (String)session.getAttribute("id"));
		map.put("auno", auno);
		int num = service.searchprocess(map);
		if(num==0) {
			service.insertprocess(map);
		}
		
		return num; 
	}
	
}