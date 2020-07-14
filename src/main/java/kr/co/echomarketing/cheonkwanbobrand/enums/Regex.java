package kr.co.echomarketing.cheonkwanbobrand.enums;

public enum Regex {

    PATH("/"),
    DOT("[.]"),
    UNDER("_"),
    HYPHEN(" - "),
    COMMA(","),
    EMPTY(""),
    RANGE("~"),
    LINE("\n");

    private String value;

    Regex(String value) {
        this.value = value;
    }

    public String find() {
        return value;
    }

}
