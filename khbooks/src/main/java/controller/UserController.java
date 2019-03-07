package controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//http://localhost:8090/khbook/signUp.kh

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		logger.debug("====>msg입니다");
		return "main/index";
	}
	
	//회원가입 페이지 접속
	@RequestMapping("signUp.kh")
	public ModelAndView goSignUp() {
		ModelAndView mav = new ModelAndView("user/signUp");
		
		return mav;
	}
	
	
	
	/*@RequestMapping("signUp.do")
	public String signUp() {
		return "user/signUp";
	}
	
	
	//로그인
		@RequestMapping
		public boolean logIn(String id, String pwd) {
			
			return null;
		}
	
	
	//아이디 찾기
	@RequestMapping
	public String findId() {
		return null;
	}
	
	//비밀번호 찾기
	@RequestMapping
	public String findPwd() {
		return null;
	}*/
	
	
	
}//end class
