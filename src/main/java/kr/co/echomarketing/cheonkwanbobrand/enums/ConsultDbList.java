package kr.co.echomarketing.cheonkwanbobrand.enums;

import kr.co.echomarketing.cheonkwanbobrand.utils.CommonUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum ConsultDbList {

    HEADER(Arrays.asList("번호", "접수일시", "기기", "브랜드", "매체", "캠페인", "그룹", "소재", "신청자이름", "전화번호", "성별", "나이", "상담내용", "중복여부", "버튼구분", "입력위치", "IP")),
    REMOVE_HEADER(Arrays.asList("기기", "캠페인", "그룹", "버튼구분", "입력위치")),
    CODE_HEADER(Arrays.asList("센터명", "구분", "광고번호", "매체중분류 코드", "매체소분류 코드", "사용여부", "시작일자", "종료일자", "정렬순서"));

    private List<String> names;

    ConsultDbList(List<String> names) {
        this.names = names;
    }

    public List<String> authHeader(Object auth) {
        List<String> headers = new ArrayList<>(this.names);
        if (!CommonUtils.isNull(auth) && auth.equals("ROLE_USER")) {
            headers.removeIf(reif -> this.REMOVE_HEADER.names.contains(reif));
            return headers;
        }
        return headers;
    }

}
