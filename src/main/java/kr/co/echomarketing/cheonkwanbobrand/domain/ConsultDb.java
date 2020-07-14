package kr.co.echomarketing.cheonkwanbobrand.domain;

import kr.co.echomarketing.cheonkwanbobrand.enums.ExceptUser;
import kr.co.echomarketing.cheonkwanbobrand.utils.CommonUtils;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ConsultDb {

    private String userName;
    private String userMobile;
    private String userConsult;
    private String userAge;
    private String gender;
    private String btnType;
    private String frmPosition;
    private String ip;
    private String encodeKey;
    private String device;
    private boolean duplicate;
    private UtmParam utmParam;
    private String centerNm;
    private String referer;
    private String agree;
    private String agree2;
    private String agree3;

    public void setUserMobile(String userMobile){
        this.userMobile = CommonUtils.makePhoneNumber(userMobile);
    }

    public boolean isExceptUser() {
        return ExceptUser.USER_NAME.getValue().contains(this.userName);
    }

}
