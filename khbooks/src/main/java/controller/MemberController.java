package controller;

import java.security.Provider.Service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.UserDTO;
import service.MemInforService;



//http://localhost:8090/khbook/memberInfor.kh

@Controller
public class MemberController {
	private MemInforService service;
	
	
	public MemberController() {
	}
	public void setService(MemInforService service) {
		this.service=service;
	}
	
	@RequestMapping("/memberInfor.kh")
	public ModelAndView listMethod(UserDTO pv,String id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",service.listprocess(id));
		mav.setViewName("/member/meminformation");
		
		return mav;
	}
	@RequestMapping("/passtest.kh")
	public ModelAndView passTest(String id) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto",service.listprocess(id));
		mav.setViewName("/member/passtest");
		return mav;
	}
	@RequestMapping("/updateForm.kh")
	public ModelAndView updateForm (String id) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto",service.listprocess(id));
		mav.setViewName("/member/updateForm");
		return mav;
	}
	@RequestMapping("/update.kh")
	public ModelAndView updateMethod(UserDTO dto) {
		ModelAndView mav= new ModelAndView();
		service.updateProcess(dto);
		mav.setViewName("redirect:/memberInfor.kh");
		return mav;
	}
	
}