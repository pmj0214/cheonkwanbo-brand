package kr.co.echomarketing.cheonkwanbobrand.interceptor;

import kr.co.echomarketing.cheonkwanbobrand.enums.AttributeKey;
import kr.co.echomarketing.cheonkwanbobrand.enums.Security;
import kr.co.echomarketing.cheonkwanbobrand.utils.CommonUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        if (isSessionInValid(session)) {
            request.setAttribute(AttributeKey.PAGE_PATH.find(), Security.LOGIN_PROCESSING_URL.getVal());
            return super.preHandle(request, response, handler);
        }

        Authentication authentication = (Authentication) session.getAttribute("authentication");
        List<GrantedAuthority> grantedAuthority = (List<GrantedAuthority>) authentication.getAuthorities();
        request.setAttribute(AttributeKey.USER_ID.find(), authentication.getPrincipal());
        request.setAttribute(AttributeKey.USER_AUTH.find(), grantedAuthority.get(0).getAuthority());
        request.setAttribute(AttributeKey.PAGE_PATH.find(), "/code".equals(request.getRequestURI()) ? Security.ADMIN_CODE_URL.getVal() : Security.ADMIN_LIST_URL.getVal());

        return super.preHandle(request, response, handler);
    }

    private boolean isSessionInValid(HttpSession session) {
        return CommonUtils.isNull(session) || CommonUtils.isNull(session.getAttribute("authentication"));
    }

}
