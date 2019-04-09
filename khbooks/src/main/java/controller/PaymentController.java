package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.UserService;


@Controller
public class PaymentController {
	private UserService service;

	public PaymentController() {

	}

	public void setService(UserService service) {
		this.service = service;
	}

	/*// 캐시
	@RequestMapping(value = "/cash.kh", method = {RequestMethod.GET, RequestMethod.POST})
	public String cash(int total_amount, HttpSession session) {
		String total = "";
		String url = "http://localhost:8090/khbook/cash.kh";
		url += "?id=" + session.getAttribute("id");
		url += "&total_amount=" + total_amount;
		session.setAttribute("total_amount", total_amount);
		Map<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("id");
		int coin = total_amount / 100;
		map.put("id", id);
		map.put("coin", coin);
		service.paypay(map);
		return "paymentPage/pay";
		
	}*/
	
	@RequestMapping("/cash.kh")
	public ModelAndView cash(int total_amount, HttpSession session) {
		ModelAndView mav= new ModelAndView();
		
		
		mav.addObject("id", session.getAttribute("id"));
		session.setAttribute("total_amount", total_amount);
		mav.setViewName("paymentPage/pay");
		return mav;
	}
	

	@RequestMapping(value = "/payment.kh", method = RequestMethod.GET)
	public String cassh() {
		return "paymentPage/payment";
	}
	
	
	

	@RequestMapping(value = "/searchOpen.kh", produces = "application/json;charset=UTF-8")
	public @ResponseBody String process(int total_amount, HttpSession session) throws IOException {
		String input = "";
		String total = "";
		String url = "https://kapi.kakao.com/v1/payment/ready";
		url += "?cid=TC0ONETIME";
		url += "&partner_order_id=khbooks";
		url += "&partner_user_id=" + session.getAttribute("id");
		url += "&item_name=coin";
		url += "&quantity=1";
		url += "&total_amount=" + total_amount;
		url += "&tax_free_amount=" + total_amount;
		url += "&approval_url=http://localhost:8090/khbook/paysuccess.kh?finish=success";
		url += "&cancel_url=http://localhost:8090/khbook/paysuccess.kh?finish=cancle";
		url += "&fail_url=http://localhost:8090/khbook/paysuccess.kh?finish=fail";
		session.setAttribute("total_amount", total_amount);
		URL url2 = new URL(url);
		URLConnection conn = url2.openConnection();
		HttpURLConnection urlConn = (HttpURLConnection) conn;
		urlConn.setRequestMethod("POST");
		urlConn.setRequestProperty("Authorization", "KakaoAK 91a92236f37fd6953c3932b0c8c8b9d1");
		urlConn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		BufferedReader reader = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
		while ((input = reader.readLine()) != null) {
			total += input;
		}
		System.out.println(total);

		return total;
	}// end process()

	@RequestMapping(value = "/paysuccess.kh")
	public ModelAndView paysuccess(String finish, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (finish == "success") {
			mav.addObject("total_amount", session.getAttribute("total_amount"));
		}
		mav.addObject("finish", finish);
		mav.setViewName("paymentPage/payfinish");

		return mav;
	}

	@RequestMapping("/dsds.kh")
	public String sdd(int total_amount, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("id");
		int coin = total_amount / 100;
		map.put("id", id);
		map.put("coin", coin);
		service.paypay(map);
		return "index";
	}
	
}// endclass
