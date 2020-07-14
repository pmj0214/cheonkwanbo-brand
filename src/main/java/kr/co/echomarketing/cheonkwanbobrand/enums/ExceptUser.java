package kr.co.echomarketing.cheonkwanbobrand.enums;

import lombok.Getter;

import java.util.Arrays;
import java.util.List;

public enum ExceptUser {

    USER_NAME(Arrays.asList("테스트")),
    PHONE_NUMBER(Arrays.asList(""));

    @Getter
    private List<String> value;

    ExceptUser(List<String> value) {
        this.value = value;
    }

}
