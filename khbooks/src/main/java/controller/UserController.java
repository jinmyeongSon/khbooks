package controller;




import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import commons.TempKey;
import dao.UserDAO;
import dto.NaverLoginDTO;
import dto.UserDTO;
import service.UserService;

//http://localhost:8090/khbook/signUp.kh
//http://localhost:8090/khbook/loginForm.kh

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
	// 회원가입
	@RequestMapping(value = "/index.kh", method = RequestMethod.GET)
	public String index() {
		return "index2";
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
	public String logInForm() {
		return "login";
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
	@RequestMapping(value="/logout")
	public ModelAndView logoutChk(HttpSession session) {
		session.invalidate();
		session.removeAttribute("login");
		ModelAndView mav= new ModelAndView();
		mav.setViewName("user/login");
		mav.addObject("msg", "logout");
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
	
	//mail
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
