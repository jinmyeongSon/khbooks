package controller;


import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.UserDAO;
import dto.UserDTO;
import service.MailService;
import service.UserService;

//http://localhost:8090/khbook/index.kh

@Controller
public class UserController {
	private UserDAO dao;
	private UserService service;
	private MailService mailService;
	
	public UserController() { }

	public void setDao(UserDAO dao) {
		this.dao = dao;
	}

	public void setService(UserService service) {
		this.service = service;
	}
	
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
	
	
	@RequestMapping("/binsert.kh")
	public String isnsertPage() {
		return "bookInsertForm";
	}
	
	// 홈
	@RequestMapping(value = "/index.kh", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	// 네이버 로그인
	@RequestMapping(value = "/index-naver.kh", method = RequestMethod.GET)
	public String naverlogin(String email, String gender) {
		return "naver-index";
	}
	
	@RequestMapping(value = "/naloCallback.kh", method = RequestMethod.GET)
	public String naloCallback() {
		return "indexCallback";
	}

	@RequestMapping(value = "/index-naver2.kh", method = RequestMethod.GET)
	public ModelAndView naverlogins(String email, String name, String gender, HttpSession session, Model model) {
		String id = service.naverLogin(email);
		ModelAndView mav = new ModelAndView();
		if(id != null) {
			System.out.println("asd"+id);
			session.setAttribute("id", id);
			model.addAttribute("id");//, id+"님 환영합니다."< 붙이면 주소창에 뜸
			mav.setViewName("redirect:/naloCallback.kh");
		} else {
			mav.addObject("email", email);
			mav.addObject("name", name);
			mav.addObject("gender", gender);
			mav.setViewName("user/signUp2");
		}
		return mav;
	}
	
	
	// 회원가입
	@RequestMapping(value = "/signUp.kh", method = RequestMethod.GET)
	public String signUpForm() {
		return "user/signUp";
	}

	@RequestMapping(value = "/signUp.kh", method = RequestMethod.POST)
	public String signUpSubmit(UserDTO udto) {
		dao.register(udto);
		return "user/login";
	}
	
	
	// 로그인
	@RequestMapping(value = "/loginForm.kh", method = RequestMethod.GET)
	public ModelAndView logInForm(UserDTO udto) {
		ModelAndView mav = new ModelAndView("user/login");
		return mav;
	}
	
	@RequestMapping(value = "/loginPost.kh", method = RequestMethod.POST)
	public ModelAndView loginPost(@ModelAttribute UserDTO udto, HttpSession session) {
		boolean res= service.login(udto, session);
		ModelAndView mav = new ModelAndView();
		
		if(res == true) {
			session.setAttribute("id", udto.getId());
			mav.setViewName("index");
			mav.addObject("msg", "success");
		} else {
			mav.setViewName("user/login");
			mav.addObject("msg", "fail");
		}
		
		return mav;
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
	
	// 이메일 중복체크
	@ResponseBody
	@RequestMapping(value="/checkEmail.kh", method=RequestMethod.POST)
	public Map<Object, Object> emailCheck(@RequestBody String email) {
		int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = service.CheckDuplicationEmail(email);
        map.put("cnt", count);
 
        return map;
	}
	
	// 로그아웃
	@RequestMapping(value="/logout.kh")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	
	 // 이메일 인증
	@RequestMapping(value = "/findId.kh", method = RequestMethod.GET)
	public String findId() {
		return "user/findId";
	}
	@RequestMapping(value = "/findPwd.kh", method = RequestMethod.GET)
	public String findIdPwd() {
		return "user/findPwd";
	}
	
	
    /*@RequestMapping(value = "/sendMail/auth.kh", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public boolean sendMailAuth(HttpSession session, @RequestParam String email) {
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
        

        String subject = "회원가입 인증 코드 발급 안내 입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
        return mailService.send(subject, sb.toString(), "soap8317@gmail.com", email, null);
    }*/
	
    
    // 아이디 찾기
   @RequestMapping(value = "/sendMail/id.kh", method = RequestMethod.POST)
    public String sendMailId(HttpSession session, @RequestParam String email, RedirectAttributes ra) {
        
	   //이메일 존재하는지
        UserDTO udto = service.findAccount(email);

        if (udto != null) {
            String subject = "아이디 찾기 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 아이디는 " + udto.getId()+ " 입니다.");
            mailService.send(subject, sb.toString(), "soap8317@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 해당 이메일로 가입된 아이디를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "redirect:/loginForm.kh";
   }

   // 비밀번호 찾기
   @RequestMapping(value = "/sendMail/password.kh", method = RequestMethod.POST)
   public String sendMailPassword(HttpSession session, @RequestParam String id, @RequestParam String email, RedirectAttributes ra) {

       UserDTO udto = service.findAccount(email);
       
       if (udto != null) {
           if (!udto.getId().equals(id)) {
               ra.addFlashAttribute("resultMsg", "입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
               return "redirect:/loginForm.kh";
           }
           int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
           String password = String.valueOf(ran);
           
           service.updateInfo(udto.getId(), password); // 해당 유저의 DB정보 변경

           String subject = "임시 비밀번호 발급 안내 입니다.";
           StringBuilder sb = new StringBuilder();
           sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
           mailService.send(subject, sb.toString(), "soap8317@gmail.com", email, null);
           ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
       } else {
           ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
       }
       return "redirect:/loginForm.kh";
       }
	
	

}// end class
