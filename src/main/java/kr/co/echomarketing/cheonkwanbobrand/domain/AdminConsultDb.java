package kr.co.echomarketing.cheonkwanbobrand.domain;

import kr.co.echomarketing.cheonkwanbobrand.utils.CommonUtils;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminConsultDb {

    private int idx;
    private String create_date;
    private String _source;
    private String _medium;
    private String _campaign;
    private String _group;
    private String _term;
    private String _content;
    private String name;
    private String phone_number;
    private String gender;
    private String age;
    private String consultation_details;
    private String btn_type;
    private String position;
    private String connect_ip;
    private String device;
    private boolean duplicate;

    public Object get(String key) {
        switch (key) {
            case "번호":
                return this.idx;
            case "접수일시":
                return CommonUtils.nullConvert(this.create_date);
            case "기기":
                return CommonUtils.nullConvert(this.device);
            case "매체":
                return CommonUtils.nullConvert(this._source);
            case "캠페인":
                return CommonUtils.nullConvert(this._campaign);
            case "그룹":
                return CommonUtils.nullConvert(this._content);
            case "소재":
                return CommonUtils.nullConvert(this._term);
            case "브랜드":
                return CommonUtils.nullConvert(this._medium);
            case "신청자이름":
                return CommonUtils.nullConvert(this.name);
            case "전화번호":
                return CommonUtils.nullConvert(this.phone_number);
            case "성별":
                return CommonUtils.nullConvert(this.gender);
            case "나이":
                return CommonUtils.nullConvert(this.age);
            case "상담내용":
                return CommonUtils.nullConvert(this.consultation_details);
            case "중복여부":
                return this.duplicate;
            case "버튼구분":
                return CommonUtils.nullConvert(this.btn_type);
            case "입력위치":
                return CommonUtils.nullConvert(this.position);
            case "IP":
                return CommonUtils.nullConvert(this.connect_ip);
            default:
                return "";
        }
    }

}
