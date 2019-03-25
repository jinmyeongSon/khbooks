package controller;


import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import commons.AuthInfo;
import commons.TempKey;
import dao.UserDAO;
import dto.UserDTO;
import service.UserService;

//http://localhost:8090/khbook/index.kh
@Controller
public class UserController {
	private UserDAO dao;
	private UserService service;
	private MailSender mailSander;
	
	public UserController() {

	}

	public void setDao(UserDAO dao) {
		this.dao = dao;
	}

	public void setService(UserService service) {
		this.service = service;
	}
	
	public void setMailSander(MailSender mailSander) {
		this.mailSander = mailSander;
	}
	
	// 홈
	@RequestMapping(value = "/index.kh", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	
	// 회원가입
	@RequestMapping(value = "/signUp.kh", method = RequestMethod.GET)
	public String signUpForm() {
		return "user/signUp";
	}

	@RequestMapping(value = "/signUp.kh", method = RequestMethod.POST)
	public String signUpSubmit(UserDTO udto) {
		dao.register(udto);
		return "user/signCom";
	}
	
	
	// 로그인
	@RequestMapping(value = "/loginForm.kh", method = RequestMethod.GET)
	public ModelAndView logInForm(UserDTO udto, @CookieValue(value="REMEMBER", required=false) Cookie rememberCookie) {
		if(rememberCookie != null) {
			udto.setId(rememberCookie.getValue());
			udto.setRememberId(true);
		}
		ModelAndView mav = new ModelAndView("user/login");
		return mav;
	}
	
	@RequestMapping(value = "/loginPost.kh", method = RequestMethod.POST)
	public void loginPost(UserDTO udto, Model model, HttpSession session) throws Exception {
		UserDTO dto = service.login(udto);
		if (dto == null) {
			model.addAttribute("msg", "Login Fail!!");
		} else {
			session.setAttribute("id", dto.getId());
		}

	}

	/*@RequestMapping(value = "/loginPost.kh", method = RequestMethod.POST)
	public void loginPost(UserDTO udto, Model model, HttpSession session, HttpServletResponse response) throws Exception {
		UserDTO dto = service.login(udto);
		if (dto == null) {
			model.addAttribute("msg", "Login Fail!!");
		} else {
	        service.login(udto);
			model.addAttribute("udto", dto);
			
			//쿠키 생성
			 Cookie rememberCookie = new Cookie("REMEMBER", udto.getId());
			 rememberCookie.setPath("/");
			 if(udto.isRememberId()) {
			   rememberCookie.setMaxAge(60*60*24*7);				  
			 } else {
			   rememberCookie.setMaxAge(0);
			 }
			 response.addCookie(rememberCookie);
			 
		}	
	}*/
	
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/checkId.kh", method=RequestMethod.POST)
	public Map<Object, Object> idcheck(@RequestBody String id) {
		int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = service.CheckDuplication(id);
        map.put("cnt", count);
 
        return map;
	}
	
	// 로그아웃
/*	@RequestMapping(value="/logout")
	public ModelAndView logoutChk(HttpSession session) {
		session.invalidate();
		session.removeAttribute("login");
		ModelAndView mav= new ModelAndView();
		mav.setViewName("user/login");
		mav.addObject("msg", "logout");
		return mav;
	}*/
	
	@RequestMapping(value="/logout.kh")
	public ModelAndView logoutChk(HttpSession session) {

		session.invalidate();
		session.removeAttribute("id");
		ModelAndView mav= new ModelAndView("redirect:/index");
		return mav;
	}
	

	// 아이디 찾기
	@RequestMapping(value = "/findIdForm.kh", method=RequestMethod.GET)
	public String findIdForm() {
		return "user/findIdForm";
	}
	
	@RequestMapping("/findId")
	public String view(Model model) {
		model.addAttribute("id", "dd");
		return "user/findId";
	}
	
	
	// 이메일 인증
	@Autowired private JavaMailSenderImpl mailSender;
	@RequestMapping(value = "/sendMail.do")
	public @ResponseBody String sendMail(HttpServletRequest request) {
		//System.out.println("emall:"+email);
		System.out.println("emall:"+request.getParameter("email"));
		String key = new TempKey().getKey(6, false); 
		try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom("soap8317@gmail.com","uu");  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(request.getParameter("email"));     // 받는사람 이메일
		      messageHelper.setSubject("[uu] Email인증코드 입니다."); // 메일제목은 생략이 가능하다
		      messageHelper.setText(key);  // 메일 내용
		     
		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
		return key;
	}




	

}// end class
