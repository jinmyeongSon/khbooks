package dto;

import java.math.BigInteger;
import java.security.SecureRandom;

import javax.servlet.http.HttpSession;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;

import service.NaverLoginApi;

public class NaverLoginDTO {
	private final static String CLIENT_ID = "Fl00fuSEpWs8hOdJ0F2n";
    private final static String CLIENT_SECRET = "VyLiuOxmvK";
    private final static String REDIRECT_URI = "http://localhost:8090/khbook/loginForm.kh";
	
    public String generateState()
	{
	    SecureRandom random = new SecureRandom();
	    return new BigInteger(130, random).toString(32);
	}
    
    /* 네아로 인증  URL 생성  Method */
    public String getAuthorizationUrl(HttpSession session) {

    String state = generateState();
    session.setAttribute("state", state);

    /* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
    OAuth20Service oauthService = new ServiceBuilder()
    		.apiKey(CLIENT_ID)
    		.apiSecret(CLIENT_SECRET)
    		.callback(REDIRECT_URI)
    		.state(state)
    		.build(NaverLoginApi.instance());

    return oauthService.getAuthorizationUrl();
    }
	    
}//end class
