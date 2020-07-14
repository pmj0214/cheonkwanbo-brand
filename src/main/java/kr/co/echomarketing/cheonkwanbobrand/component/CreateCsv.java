package kr.co.echomarketing.cheonkwanbobrand.component;

import kr.co.echomarketing.cheonkwanbobrand.domain.AdminConsultDb;
import kr.co.echomarketing.cheonkwanbobrand.enums.ConsultDbList;
import kr.co.echomarketing.cheonkwanbobrand.enums.Regex;

import java.util.List;

public class CreateCsv {

    private final List<AdminConsultDb> consultDbs;
    private final Object userAuth;


    public CreateCsv(List<AdminConsultDb> consultDbs, Object userAuth) {
        this.consultDbs = consultDbs;
        this.userAuth = userAuth;
    }

    public String make() {

        StringBuilder csvData = new StringBuilder();
        List<String> headers = ConsultDbList.HEADER.authHeader(userAuth);

        for (String header : headers) {
            csvData.append(header);
            csvData.append(Regex.COMMA.find());
        }

        csvData.setLength(csvData.length() - 1);
        for (AdminConsultDb counsultdb : consultDbs) {
            csvData.append(Regex.LINE.find());
            for (String header : headers) {
                csvData.append(counsultdb.get(header));
                csvData.append(Regex.COMMA.find());
            }
            csvData.setLength(csvData.length() - 1);
        }

        return csvData.toString();
    }

}
