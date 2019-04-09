package controller;

import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	// 네이버 로그인 체크
	@RequestMapping(value = "/index-naver2.kh", method = RequestMethod.GET)
	public ModelAndView naverlogins(String email, String name, String gender, HttpSession session, Model model) {
		// 이메일로 가입된 아이디 있는지 찾기
		String id = service.naverLogin(email);
		ModelAndView mav = new ModelAndView();
		if(id != null) {
			// 있으면 로그인 처리
			session.setAttribute("id", id);
			model.addAttribute("id");
			String path = (String)session.getAttribute("prev");
			mav.setViewName("redirect:"+path);
		} else {
			// 없으면 회원가입
			mav.addObject("email", email);
			mav.addObject("name", name);
			mav.addObject("gender", gender);
			mav.setViewName("user/signUp2");
		}
		return mav;
	}
	
	// 회원가입 화면
	@RequestMapping(value = "/signUp.kh", method = RequestMethod.GET)
	public String signUpForm() {
		return "user/signUp";
	}

	// 회원가입 완료
	@RequestMapping(value = "/signUp.kh", method = RequestMethod.POST)
	public String signUpSubmit(UserDTO udto) {
		dao.register(udto);
		return "user/login";
	}
	
	
	// 로그인 화면
	@RequestMapping(value = "/loginForm.kh", method = RequestMethod.GET)
	public ModelAndView logInForm(UserDTO udto, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("prev", req.getHeader("Referer"));
		ModelAndView mav = new ModelAndView("user/login");
		return mav;
	}
	
	// 로그인 체크
	@RequestMapping(value = "/loginPost.kh", method = RequestMethod.POST)
	public ModelAndView loginPost(@ModelAttribute UserDTO udto, HttpSession session) {
		UserDTO gudto = service.login(udto);
		ModelAndView mav = new ModelAndView();
		if(gudto != null) {
			session.setAttribute("id", gudto.getId());
			session.setAttribute("point", gudto.getPoint());
			if(session.getAttribute("prev")!=null) {
				String path = (String)session.getAttribute("prev");
				session.removeAttribute("prev");
				mav.setViewName("redirect:"+path);
			}else {
				mav.setViewName("redirect:mainpage.kh");
			}
		} else {
			mav.setViewName("user/login");
			mav.addObject("msg", "fail");
		}
		return mav;
	}
	
	// 아이디 중복체크
	@RequestMapping(value="/checkId.kh", method=RequestMethod.POST)
	public @ResponseBody int idcheck(@RequestBody String id) {
        return service.CheckDuplication(id);
	}
	
	// 이메일 중복체크
	@RequestMapping(value="/checkEmail.kh", method=RequestMethod.POST)
	public @ResponseBody int emailCheck(@RequestBody String email) {
		System.out.println(email);
        return service.CheckDuplicationEmail(email);
	}
	
	// 로그아웃
	@RequestMapping(value="/logout.kh")
	public ModelAndView logoutChk(HttpSession session,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String path = (String)req.getHeader("Referer");
		mav.setViewName("redirect:"+path);
		session.invalidate();		
		return mav;
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
