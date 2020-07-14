package kr.co.echomarketing.cheonkwanbobrand.domain;

import kr.co.echomarketing.cheonkwanbobrand.utils.CommonUtils;
import kr.co.echomarketing.cheonkwanbobrand.utils.DateUtils;
import lombok.Getter;
import lombok.Setter;

import java.text.SimpleDateFormat;
import java.util.Calendar;

@Getter
@Setter
public class AdminSearchParam {

    private String dateFrom;
    private String dateTo;
    private String codeMonth;
    private String encodeKey;
    private String centerNm;
    private String duplicateAt;

    public void init() {
        if (CommonUtils.isNull(this.dateFrom)) {
            this.dateFrom = DateUtils.nowDate();
            this.dateTo = DateUtils.nowDate();
        }

        if (CommonUtils.isNull(this.codeMonth)) {
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
            this.codeMonth = sdf.format(cal.getTime());
        }

        if (CommonUtils.isNull(this.centerNm)) {
            this.centerNm = "";
        }
    }

}
