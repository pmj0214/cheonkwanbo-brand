package kr.co.echomarketing.cheonkwanbobrand.enums;

public enum AttributeKey {

    SEARCH_PARAM("searchParam"),
    DB_LIST("dblist"),
    DB_COUNT("dbCount"),
    NO_DPLCT_COUNT("noDplctCount"),
    NOW_DATE("nowDate"),
    YESTERDAY_DATE("yesterdayDate"),
    PAGE_PATH("pagePath"),
    UTM_PARAM("utmParam"),
    DEVICE_PATH("devicePath"),
    DATA_HEADER("dataHeader"),
    USER_ID("userID"),
    USER_AUTH("userAuth"),
    REPOSITORY("repository"),
    CSS_FILE_NAME("cssDir"),
    REFERER("referer");

    private String name;

    AttributeKey(String name) {
        this.name = name;
    }

    public String find() {
        return name;
    }

}
