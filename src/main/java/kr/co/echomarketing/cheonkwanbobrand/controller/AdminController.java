package kr.co.echomarketing.cheonkwanbobrand.controller;

import kr.co.echomarketing.cheonkwanbobrand.component.DbDecryptionKey;
import kr.co.echomarketing.cheonkwanbobrand.domain.AdminSearchParam;
import kr.co.echomarketing.cheonkwanbobrand.enums.AttributeKey;
import kr.co.echomarketing.cheonkwanbobrand.enums.ConsultDbList;
import kr.co.echomarketing.cheonkwanbobrand.service.AdminConsultDbService;
import kr.co.echomarketing.cheonkwanbobrand.utils.CommonUtils;
import kr.co.echomarketing.cheonkwanbobrand.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;

@Controller
public class AdminController {

    @Autowired
    private DbDecryptionKey dbDecryptionKey;

    @Autowired
    private AdminConsultDbService adminConsultDbService;

    @GetMapping("/admin")
    public String adminPage(HttpServletRequest req, AdminSearchParam adminSearchParam)
            throws GeneralSecurityException, UnsupportedEncodingException {

        adminSearchParam.init();
        adminSearchParam.setEncodeKey(dbDecryptionKey.decrypt());
        req.setAttribute(AttributeKey.SEARCH_PARAM.find(), adminSearchParam);
        req.setAttribute(AttributeKey.DB_LIST.find(), adminConsultDbService.consultDbListView(adminSearchParam));
        req.setAttribute(AttributeKey.DB_COUNT.find(), adminConsultDbService.consultDbListCount(adminSearchParam));
        adminSearchParam.setDuplicateAt("N");
        req.setAttribute(AttributeKey.NO_DPLCT_COUNT.find(), adminConsultDbService.consultDbListCount(adminSearchParam));
        req.setAttribute(AttributeKey.NOW_DATE.find(), DateUtils.nowDate());
        req.setAttribute(AttributeKey.YESTERDAY_DATE.find(), DateUtils.yesterdayDate(DateUtils.nowDate()));
        req.setAttribute(
                AttributeKey.DATA_HEADER.find(),
                ConsultDbList.HEADER.authHeader(req.getAttribute(AttributeKey.USER_AUTH.find()))
        );

        return (String) req.getAttribute(AttributeKey.PAGE_PATH.find());
    }

    @RequestMapping(path = "/admin/excel", method = RequestMethod.GET)
    public void excelDownload(HttpServletRequest req, HttpServletResponse res, AdminSearchParam adminSearchParam) throws IOException, GeneralSecurityException {

        adminSearchParam.init();
        adminSearchParam.setEncodeKey(dbDecryptionKey.decrypt());
        String fileName = CommonUtils.exportFileNameGenerator(adminSearchParam);
        adminConsultDbService.consultDbExport(res, adminSearchParam, req.getAttribute(AttributeKey.USER_AUTH.find()), fileName);

//        res.setCharacterEncoding("EUC-KR");
//        res.setContentType("text/html; charset=EUC-KR");
//        res.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"".concat(fileName).concat("\""));
//        res.getWriter().write(csvData);

    }

}
