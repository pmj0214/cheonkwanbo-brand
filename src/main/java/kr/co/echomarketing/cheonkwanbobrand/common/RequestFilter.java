package kr.co.echomarketing.cheonkwanbobrand.common;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import java.io.IOException;

/**
 * Class Name  : CorsFilter
 * Description :
 * <p>
 * Copyright (C) 2019 by EchoMKT All right reserved.
 */
@Component
@Order(-1)

public class RequestFilter implements Filter {

    @Value("${iker80.url}")
    private String iker80Url;

    @Value("${iker.url}")
    private String ikerUrl;

    @Value("${miker80.url}")
    private String miker80Url;

    @Value("${miker.url}")
    private String mikerUrl;

    @Value("${realman.ip.url}")
    private String realmanIpUrl;

    @Value("${allcut.ip.url}")
    private String allcutIpUrl;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequestWrapper requestWrapper = new HttpServletRequestWrapper((HttpServletRequest) request);
        String origin = ((HttpServletRequest) request).getHeader("origin");
        HttpServletResponseWrapper responseWrapper = new HttpServletResponseWrapper((HttpServletResponse) response);

        if (StringUtils.equals(origin, iker80Url)
                || StringUtils.equals(origin, ikerUrl)
                || StringUtils.equals(origin, miker80Url)
                || StringUtils.equals(origin, mikerUrl)
                || StringUtils.equals(origin, realmanIpUrl)
                || StringUtils.equals(origin, allcutIpUrl)) {
            responseWrapper.setHeader("Access-Control-Allow-Origin", origin);
            responseWrapper.setHeader("Access-Control-Allow-Methods", "POST, PUT, GET, OPTIONS, DELETE");
            responseWrapper.setHeader("Access-Control-Allow-Headers", "Content-Type,accept,Origin,Authorization");
            responseWrapper.setHeader("Access-Control-Allow-Credentials", "true");
            responseWrapper.setHeader("Access-Control-Max-Age", "3600");
        }

        if (HttpMethod.OPTIONS.name().equalsIgnoreCase(((HttpServletRequest) request).getMethod())) {
            responseWrapper.setStatus(HttpServletResponse.SC_OK);
        } else {
            chain.doFilter(requestWrapper, responseWrapper);
        }
    }
    @Override
    public void destroy() {
    }
}



