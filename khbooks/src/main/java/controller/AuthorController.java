package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.AuthorService;

//http://localhost:8090/khbook/author.kh

@Controller
public class AuthorController {
	private AuthorService service;
	
	public AuthorController(){
		
	}
	public void setService(AuthorService service) {
		this.service = service;
	}
	@RequestMapping("/author.kh")
	public ModelAndView mak(int auno,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList",service.authorProcess(auno));
		mav.addObject("bList",service.bookListProcess(auno));
		if(session.getAttribute("id")!=null) {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("id", (String)session.getAttribute("id"));
			map.put("auno", auno);
			mav.addObject("fbchk",service.searchProcess(map));
		}else {
			mav.addObject("fbchk", 0);
		}
		mav.setViewName("author");
		return mav;
	}
	
	@RequestMapping("/authorinsert.kh")
	public @ResponseBody int insertmethod(HttpSession session,int auno) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", (String)session.getAttribute("id"));
		map.put("auno", auno);
		int num = service.searchProcess(map);
		if(num==0) {
			service.insertProcess(map);
		}
		return num;
	}
	
}
