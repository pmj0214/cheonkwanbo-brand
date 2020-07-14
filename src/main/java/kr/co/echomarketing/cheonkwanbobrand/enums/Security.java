package kr.co.echomarketing.cheonkwanbobrand.enums;

import lombok.Getter;

public enum Security {

    ROOT_PATH("/"),
    ALL_PATH("/**"),
    LOGIN_PAGE("/admin"),
    CODE_PAGE("/code"),
    LOGIN_PROCESSING_URL("/admin/login"),
    ADMIN_LIST_URL("/admin/list"),
    ADMIN_CODE_URL("/admin/code"),
    USER_ID_KEY("id"),
    USER_PWD_KEY("password"),
    LOGOUT_PROCESSING_URL("/admin/logout"),
    STATE_KEY("auth"),
    STATE_FAILUE_VALUE("false"),
    STATE_MSG_KEY("message"),
    STATE_FAILUE_MSG_VALUE("Unregistered user or wrong password input."),
    STATE_SUCCESS_VALUE("true"),
    STATE_SUCCESS_AUTHENTICATION_KEY("authentication");

    @Getter
    private String val;

    Security(String val) {
        this.val = val;
    }

}
