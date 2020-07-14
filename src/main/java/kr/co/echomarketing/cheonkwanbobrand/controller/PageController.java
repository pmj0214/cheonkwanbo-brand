package kr.co.echomarketing.cheonkwanbobrand.controller;

import kr.co.echomarketing.cheonkwanbobrand.domain.UtmParam;
import kr.co.echomarketing.cheonkwanbobrand.enums.AttributeKey;
import kr.co.echomarketing.cheonkwanbobrand.enums.PagePath;
import kr.co.echomarketing.cheonkwanbobrand.enums.Regex;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import javax.servlet.http.HttpServletRequest;

@Controller
public class PageController {

    private String devicePath;

    @GetMapping(value = {"/"})
    public String landingPageMapping(HttpServletRequest req, UtmParam utmParam) {

        String pagePath = PagePath.INDEX.getPath();

        attributeSetting(req, utmParam);
        if (!devicePath.contains("pc")) {
            return "redirect:/m";
        }

        req.setAttribute(AttributeKey.REPOSITORY.find(), imagePathConverter(req.getRequestURI()));
        req.setAttribute(AttributeKey.CSS_FILE_NAME.find(), pagePath);

        return Regex.PATH.find()
                .concat(devicePath)
                .concat(pagePath);
    }

    @GetMapping(value = {"/m"})
    public String landingPageMapping_m(HttpServletRequest req, UtmParam utmParam) {

        String pagePath = PagePath.INDEX.getPath();

        attributeSetting(req, utmParam);
        req.setAttribute(AttributeKey.REPOSITORY.find(), imagePathConverter(req.getRequestURI()));
        req.setAttribute(AttributeKey.CSS_FILE_NAME.find(), pagePath);

        return Regex.PATH.find()
                .concat(devicePath)
                .concat(pagePath);
    }

    private void attributeSetting(HttpServletRequest req, UtmParam utmParam) {
        devicePath = (String) req.getAttribute(PagePath.PREFIX_KEY.getPath());
        req.setAttribute(AttributeKey.UTM_PARAM.find(), utmParam);
        req.setAttribute(AttributeKey.DEVICE_PATH.find(), devicePath);
        req.setAttribute(AttributeKey.REFERER.find(), req.getHeader("referer"));
    }

    private String imagePathConverter(String uri) {
        if (uri.equals("/")) {
            return "";
        }
        return uri;
    }

    private String pagePathConverter(String uri) {
        if (devicePath.contains("pc")) {
            return PagePath.INDEX.getPath();
        }
        return uri;
    }
}

