package kr.co.echomarketing.cheonkwanbobrand.enums;


import lombok.Getter;

public enum PagePath {

    INDEX("/index"),
    INDEX_MOBILE("/m"),
    PREFIX_PC("/pc"),
    PREFIX_MOBILE("/mobile"),
    PREFIX_KEY("devicePath"),
    DEVICE_KEY("device"),
    CONSULTDB("/consultDB"),
    ERROR_PATH("/common/error"),
    EXCEL_DOWN("/admin/excel");

    @Getter
    private String path;

    PagePath(String path) {
        this.path = path;
    }

    public String pathName() {
        String paths = this.path.replace(Regex.PATH.find(), Regex.EMPTY.find());
        return paths;
    }

}
