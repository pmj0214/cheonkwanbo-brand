package kr.co.echomarketing.cheonkwanbobrand.component;

import kr.co.echomarketing.cheonkwanbobrand.enums.Security;
import kr.co.echomarketing.cheonkwanbobrand.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class AuthSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    @Value("${admin.login.session_timeout}")
    private int sessionTimeout;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        response.setStatus(HttpServletResponse.SC_OK);
        HttpSession session = request.getSession();
        session.setAttribute(Security.STATE_SUCCESS_AUTHENTICATION_KEY.getVal(), authentication);
        session.setMaxInactiveInterval(sessionTimeout);
        SecurityUtils.resSuccessMsg(response);
    }
}
