package kr.co.echomarketing.cheonkwanbobrand.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminCodeDb {

    private int idx;
    private String center_nm;
    private String gubun;
    private String bc_code;
    private String bcd_cate1;
    private String bcd_cate2;
    private String use_at;
    private int ordr;
    private String start_dt;
    private String end_dt;

    public Object get(String key) {
        switch (key) {
            case "번호":
                return this.idx;
            case "센터명":
                return this.center_nm;
            case "구분":
                return this.gubun;
            case "광고번호":
                return this.bc_code;
            case "매체중분류 코드":
                return this.bcd_cate1;
            case "매체소분류 코드":
                return this.bcd_cate2;
            case "사용여부":
                return this.use_at;
            case "시작일자":
                return this.start_dt;
            case "종료일자":
                return this.end_dt;
            case "정렬순서":
                return this.ordr;
            default:
                return "";
        }
    }

    public String col(String key) {
        switch (key) {
            case "번호":
                return "idx";
            case "센터명":
                return "center_nm";
            case "구분":
                return "gubun";
            case "광고번호":
                return "bc_code";
            case "매체중분류 코드":
                return "bcd_cate1";
            case "매체소분류 코드":
                return "bcd_cate2";
            case "사용여부":
                return "use_at";
            case "시작일자":
                return "start_dt";
            case "종료일자":
                return "end_dt";
            case "정렬순서":
                return "ordr";
            default:
                return "";
        }
    }

}
