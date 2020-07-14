package kr.co.echomarketing.cheonkwanbobrand.config;

import kr.co.echomarketing.cheonkwanbobrand.component.AuthFailureHandler;
import kr.co.echomarketing.cheonkwanbobrand.component.AuthProvider;
import kr.co.echomarketing.cheonkwanbobrand.component.AuthSuccessHandler;
import kr.co.echomarketing.cheonkwanbobrand.component.LogoutSuccessHandler;
import kr.co.echomarketing.cheonkwanbobrand.enums.Security;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import static java.lang.Boolean.TRUE;


@Configuration
@EnableWebSecurity
@EnableGlobalAuthentication
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private AuthProvider authProvider;

    @Autowired
    private AuthSuccessHandler authSuccessHandler;

    @Autowired
    private AuthFailureHandler authFailureHandler;

    @Autowired
    private LogoutSuccessHandler logoutSuccessHandler;

    @Override
    public void configure(WebSecurity web) {
        web.ignoring().antMatchers("/WEB-INF/resources/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers(Security.LOGIN_PAGE.getVal()).permitAll()
                .antMatchers(Security.LOGIN_PROCESSING_URL.getVal()).permitAll()
                .and().csrf().disable()
                .formLogin()
                .loginPage(Security.LOGIN_PROCESSING_URL.getVal())
                .defaultSuccessUrl(Security.LOGIN_PAGE.getVal(), TRUE)
                .failureUrl(Security.LOGIN_PAGE.getVal())
                .failureHandler(authFailureHandler)
                .successHandler(authSuccessHandler)
                .usernameParameter("adminID")
                .passwordParameter("inputPassword")
                .and()
                .logout().logoutRequestMatcher(new AntPathRequestMatcher(Security.LOGOUT_PROCESSING_URL.getVal()))
                .logoutSuccessHandler(logoutSuccessHandler)
                .and()
                .authenticationProvider(authProvider);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
