package controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.MailService;
import service.UserService;


//http://localhost:8090/khbook/sendMail/auth.kh
//https://wfreud.tistory.com/178

public class MailController {
	 private UserService service;
     private MailService mailService;
 
     public void setService(UserService service) {
		this.service = service;
	}
 
     public void setMailService(MailService mailService) {
         this.mailService = mailService;
     }
     
    /*
 
    // 회원가입 이메일 인증
     @RequestMapping(value = "/sendMail/auth.kh", method = RequestMethod.POST, produces = "application/json")
     @ResponseBody
     public boolean sendMailAuth(HttpSession session, @RequestParam String email) {
         int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
         String joinCode = String.valueOf(ran);
         session.setAttribute("joinCode", joinCode);
         
         System.out.println("awfafw");
 
         String subject = "회원가입 인증 코드 발급 안내 입니다.";
         StringBuilder sb = new StringBuilder();
         sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
         return mailService.send(subject, sb.toString(), "soap8317@gmail.com", email, null);
     }
     
    // 아이디 찾기
     @RequestMapping(value = "/sendMail/id", method = RequestMethod.POST)
     public String sendMailId(HttpSession session, @RequestParam String email, @RequestParam String captcha, RedirectAttributes ra) {
         String captchaValue = (String) session.getAttribute("captcha");
         if (captchaValue == null || !captchaValue.equals(captcha)) {
             ra.addFlashAttribute("resultMsg", "자동 방지 코드가 일치하지 않습니다.");
             return "redirect:/find/id";
         }
 
        // UserDTO user = service.findAccount(email);
         if (user != null) {
             String subject = "아이디 찾기 안내 입니다.";
             StringBuilder sb = new StringBuilder();
             sb.append("귀하의 아이디는 " + user.getId() + " 입니다.");
             mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
             ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 해당 이메일로 가입된 아이디를 발송 하였습니다.");
         } else {
             ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
         }
         return "redirect:/find/id";
    }

    // 비밀번호 찾기
    @RequestMapping(value = "/sendMail/password", method = RequestMethod.POST)
    public String sendMailPassword(HttpSession session, @RequestParam String id, @RequestParam String email, @RequestParam String captcha, RedirectAttributes ra) {
        String captchaValue = (String) session.getAttribute("captcha");
        if (captchaValue == null || !captchaValue.equals(captcha)) {
            ra.addFlashAttribute("resultMsg", "자동 방지 코드가 일치하지 않습니다.");
            return "redirect:/find/password";
        }
 
        User user = userService.findAccount(email);
        if (user != null) {
            if (!user.getId().equals(id)) {
                ra.addFlashAttribute("resultMsg", "입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
                return "redirect:/find/password";
            }
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);
            userService.updateInfo(user.getNo(), "password", password); // 해당 유저의 DB정보 변경
 
            String subject = "임시 비밀번호 발급 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
            mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "redirect:/find/password";
        }
*/

}
