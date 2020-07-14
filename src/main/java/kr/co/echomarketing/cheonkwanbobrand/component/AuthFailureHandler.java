package kr.co.echomarketing.cheonkwanbobrand.component;

import kr.co.echomarketing.cheonkwanbobrand.enums.Security;
import org.json.simple.JSONObject;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class AuthFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        JSONObject failureMsg = new JSONObject();
        failureMsg.put(Security.STATE_KEY.getVal(), Security.STATE_FAILUE_VALUE.getVal());
        failureMsg.put(Security.STATE_MSG_KEY.getVal(), Security.STATE_FAILUE_MSG_VALUE.getVal());
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        response.getWriter().print(failureMsg.toJSONString());
        response.getWriter().flush();
    }

}
