package kr.co.echomarketing.cheonkwanbobrand.controller;

import kr.co.echomarketing.cheonkwanbobrand.enums.PagePath;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorPageController implements ErrorController {

    @GetMapping("/error")
    public String errorMapping(){
        return PagePath.ERROR_PATH.getPath();
    }

    @Override
    public String getErrorPath() {
        return PagePath.ERROR_PATH.getPath();
    }
}
