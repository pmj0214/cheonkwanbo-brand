package kr.co.echomarketing.cheonkwanbobrand.config;

import kr.co.echomarketing.cheonkwanbobrand.enums.PagePath;
import kr.co.echomarketing.cheonkwanbobrand.enums.Security;
import kr.co.echomarketing.cheonkwanbobrand.interceptor.DeviceInterceptor;
import kr.co.echomarketing.cheonkwanbobrand.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mobile.device.DeviceHandlerMethodArgumentResolver;
import org.springframework.mobile.device.DeviceResolverHandlerInterceptor;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Bean
    public DeviceResolverHandlerInterceptor
    deviceResolverHandlerInterceptor() {
        return new DeviceResolverHandlerInterceptor();
    }

    @Bean
    public DeviceHandlerMethodArgumentResolver
    deviceHandlerMethodArgumentResolver() {
        return new DeviceHandlerMethodArgumentResolver();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(deviceResolverHandlerInterceptor());
        registry.addInterceptor(new DeviceInterceptor()).addPathPatterns(Security.ROOT_PATH.getVal(), PagePath.CONSULTDB.getPath(), PagePath.INDEX_MOBILE.getPath());
        registry.addInterceptor(new LoginInterceptor()).addPathPatterns(Security.LOGIN_PAGE.getVal(), PagePath.EXCEL_DOWN.getPath(), Security.CODE_PAGE.getVal());
    }

    @Override
    public void addArgumentResolvers(
            List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(deviceHandlerMethodArgumentResolver());
    }

}
