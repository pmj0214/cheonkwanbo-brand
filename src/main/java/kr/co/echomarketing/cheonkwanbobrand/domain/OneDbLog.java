package kr.co.echomarketing.cheonkwanbobrand.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OneDbLog {

    private Integer idx;
    private String centerNm;
    private String paramJson;
    private String rtnJson;
    private String createDate;
    private String encodeKey;

}
