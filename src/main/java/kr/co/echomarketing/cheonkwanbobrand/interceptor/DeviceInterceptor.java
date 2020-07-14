package kr.co.echomarketing.cheonkwanbobrand.interceptor;

import kr.co.echomarketing.cheonkwanbobrand.enums.PagePath;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
public class DeviceInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        Device device = DeviceUtils.getCurrentDevice(request);
        String prefixPath = PagePath.PREFIX_MOBILE.pathName();
        if (device.isNormal()) {
            prefixPath = PagePath.PREFIX_PC.pathName();
        }

        request.setAttribute(PagePath.PREFIX_KEY.getPath(), prefixPath);
        request.setAttribute(PagePath.DEVICE_KEY.getPath(), device);
        return super.preHandle(request, response, handler);
    }

}
