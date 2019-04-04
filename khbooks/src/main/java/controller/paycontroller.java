package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

//http://localhost:8090/khbook/kakaopay.kh

@Controller
public class paycontroller {
	// 관리자 로그인 페이지로 이동
	@RequestMapping ("kakaopay.kh")
	public String adminLogin() {
		return "kakaopay";
	}
	
	@RequestMapping (value="kakaopay.kh",method=RequestMethod.POST)
	public String adminchk() {
		return "kakaopay";
	}
	
	/*
	
	@RequestMapping("payStart.kh")
	public @ResponseBody process() throws IOException {
		String input = "";
		String total = "";
		String url = "https://kapi.kakao.com/v1/payment/ready";
		System.out.println("콘솔진입");
		URL url2 = new URL(url);
		URLConnection conn = url2.openConnection();
		HttpURLConnection urlConn  = (HttpURLConnection) conn;
		urlConn.setRequestMethod("POST");
		urlConn.setRequestProperty("Authorization", "KakaoAK ff1904562abe564cb2195b18c99a7b55");
		urlConn.setRequestProperty("content-type", "application/x-www-form-urlencoded");
		urlConn.setRequestProperty("cid", "TC0ONETIME");
		urlConn.setRequestProperty("partner_order_id", "partner_order_id");
		urlConn.setRequestProperty("partner_user_id", "partner_user_id");
		urlConn.setRequestProperty("item_name", "연재 1페이지");
		urlConn.setRequestProperty("quantity", "1");
		urlConn.setRequestProperty("total_amount", "1100");
		urlConn.setRequestProperty("tax_free_amount", "0");
		urlConn.setRequestProperty("vat_amount", "100");
		urlConn.setRequestProperty("approval_url", "http://localhost:8090/khbook/kakaopay.kh");
		urlConn.setRequestProperty("fail_url", "http://localhost:8090/payfail");
		urlConn.setRequestProperty("cancel_url", "http://localhost:8090/paycancel");

		BufferedReader reader = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
		while((input=reader.readLine())!=null) {
			total+=input;
		}
		System.out.println(total);
		
		return total;
	}//end
*/

}
