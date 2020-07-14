package kr.co.echomarketing.cheonkwanbobrand.enums;

public enum DateFormat {

    YYYY_MM_DD_HH_MM_SS("yyyy-MM-dd HH:mm:ss"),
    YYYYMMDD("yyyyMMdd"),
    YYYYMMDDHHMMSS("yyyyMMddHHmmss");

    private String value;

    DateFormat(String value) {
        this.value = value;
    }

    public String find() {
        return value;
    }

}
