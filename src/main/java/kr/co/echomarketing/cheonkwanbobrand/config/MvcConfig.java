package kr.co.echomarketing.cheonkwanbobrand.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * <pre>
 * Java File Name : MvcConfig.java
 * Description : web mvc 설정
 * </pre>
 * <p>
 * Copyright (C) 2019 by EchoMKT All right reserved.
 */
@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/pc/**").addResourceLocations("/WEB-INF/resources/pc/");
        registry.addResourceHandler("/mobile/**").addResourceLocations("/WEB-INF/resources/mobile/");
        registry.addResourceHandler("/common/**").addResourceLocations("/WEB-INF/resources/common/");
        registry.addResourceHandler("/admin/**").addResourceLocations("/WEB-INF/resources/admin/");
    }

}
