package kr.co.echomarketing.cheonkwanbobrand.utils;

import kr.co.echomarketing.cheonkwanbobrand.enums.Security;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SecurityUtils {

    public static void resSuccessMsg(HttpServletResponse response) throws IOException {
        JSONObject successMsg = new JSONObject();
        successMsg.put(Security.STATE_KEY.getVal(), Security.STATE_SUCCESS_VALUE.getVal());
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().print(successMsg.toJSONString());
        response.getWriter().flush();
    }

}
