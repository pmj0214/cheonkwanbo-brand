package kr.co.echomarketing.cheonkwanbobrand.component;

import kr.co.echomarketing.cheonkwanbobrand.domain.Admin;
import kr.co.echomarketing.cheonkwanbobrand.domain.AdminAuthentication;
import kr.co.echomarketing.cheonkwanbobrand.service.UserService;
import kr.co.echomarketing.cheonkwanbobrand.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component("authProvider")
public class AuthProvider implements AuthenticationProvider {

    @Autowired
    private UserService userService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String id = authentication.getName();
        String pwd = authentication.getCredentials().toString();

        Admin admin = userService.findByUser(new Admin(id));
        if (isNotRegUser(admin, pwd)) {
            return null;
        }

        return new AdminAuthentication(id, pwd, userAuthorization(admin));
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

    private boolean isNotRegUser(Admin admin, String pwd) {
        return CommonUtils.isNull(admin) || isPasswordDifferent(admin, pwd);
    }

    private boolean isPasswordDifferent(Admin admin, String pwd) {
        return !passwordEncoder.matches(pwd, admin.getAdmin_pwd());
    }

    private List<GrantedAuthority> userAuthorization(Admin admin) {
        List<GrantedAuthority> grantedAuthorityList = new ArrayList<>();
        grantedAuthorityList.add(new SimpleGrantedAuthority(admin.getAuthority()));
        return grantedAuthorityList;
    }
}
