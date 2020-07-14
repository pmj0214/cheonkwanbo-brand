package kr.co.echomarketing.cheonkwanbobrand.utils;


import kr.co.echomarketing.cheonkwanbobrand.domain.AdminSearchParam;
import kr.co.echomarketing.cheonkwanbobrand.enums.Regex;
import org.springframework.util.StringUtils;

import java.util.regex.Pattern;

public class CommonUtils {

    public static boolean isNull(Object target) {
        if (null == target) {
            return true;
        }
        if (target.getClass().getName().contains("String")) {
            return StringUtils.isEmpty(target);
        }

        return false;
    }

    public static String nullConvert(String target) {
        if (isNull(target)) {
            return "";
        }
        return target;
    }

    public static String exportFileNameGenerator(AdminSearchParam adminSearchParam) {
        return new StringBuilder()
                .append("consultDB(")
                .append(adminSearchParam.getDateFrom())
                .append(Regex.RANGE.find())
                .append(adminSearchParam.getDateTo())
                .append(")")
                .append(Regex.UNDER.find())
                .append(DateUtils.nowDateTime())
                .append(".xlsx")
                .toString();
    }

    public static String makePhoneNumber(String phoneNoStr) {
        String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";
        if (!Pattern.matches(regEx, phoneNoStr)) {
            return null;
        }
        return phoneNoStr.replaceAll(regEx, "$1-$2-$3");
    }

}
