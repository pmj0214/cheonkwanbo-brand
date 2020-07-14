package kr.co.echomarketing.cheonkwanbobrand.domain;

import kr.co.echomarketing.cheonkwanbobrand.utils.DateUtils;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {

    private String reg_date;
    private String expire_date;
    private String phone_number;

    // 셋팅한 일자(1일) 내에 디비를 남길 경우
    public boolean isDailyDuplicate(long dailyDuplicate) {
        return DateUtils.isDuplicate(this.reg_date, dailyDuplicate);
    }

    // 2달 이내 디비를 남길 경우
    public boolean isTwoMonthDuplicate() {
        return DateUtils.isTowMonthDuplicate(this.expire_date);
    }

}
