package kr.co.echomarketing.cheonkwanbobrand.controller;

import kr.co.echomarketing.cheonkwanbobrand.component.DbDecryptionKey;
import kr.co.echomarketing.cheonkwanbobrand.domain.ConsultDb;
import kr.co.echomarketing.cheonkwanbobrand.domain.UtmParam;
import kr.co.echomarketing.cheonkwanbobrand.enums.PagePath;
import kr.co.echomarketing.cheonkwanbobrand.service.ConsultDbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class ConsultDbController {

    @Autowired
    private DbDecryptionKey dbDecryptionKey;

    @Autowired
    private ConsultDbService consultDbService;

    @ResponseBody
    @RequestMapping(value = "/consultDB", method = RequestMethod.POST)
    public ResponseEntity<?> consultDbSave(HttpServletRequest req, ConsultDb consultDb, UtmParam utmParam)
            throws UnsupportedEncodingException, GeneralSecurityException {

        consultDb.setDevice((String) req.getAttribute(PagePath.PREFIX_KEY.getPath()));
        consultDb.setEncodeKey(dbDecryptionKey.decrypt());
        consultDb.setUtmParam(utmParam);
        consultDb.setIp(req.getHeader("X-Forwarded-For"));

        Map<String, String> statusMsg = new HashMap<>();
        statusMsg.put("statusMsg", consultDbService.consultDbSave(consultDb));
        return new ResponseEntity<>(statusMsg, HttpStatus.CREATED);
    }
}
