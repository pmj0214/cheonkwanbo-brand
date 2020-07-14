package kr.co.echomarketing.cheonkwanbobrand.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onedb.agency.AgencyAPI;
import kr.co.echomarketing.cheonkwanbobrand.component.DbDecryptionKey;
import kr.co.echomarketing.cheonkwanbobrand.domain.AdminCodeDb;
import kr.co.echomarketing.cheonkwanbobrand.domain.ConsultDb;
import kr.co.echomarketing.cheonkwanbobrand.domain.OneDbLog;
import kr.co.echomarketing.cheonkwanbobrand.domain.User;
import kr.co.echomarketing.cheonkwanbobrand.mapper.PageMapper;
import kr.co.echomarketing.cheonkwanbobrand.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ConsultDbService {

    private static final String ONE_DAY_DUPLICATE_MSG = "oneDayDuplicate";
    private static final String SUCCESS_MSG = "success";
    private static final String ERROR_MSG = "error";
    private static final String ONE_MIN_DUPLICATE_MSG = "oneMinIp";

    @Value("${user.duplicate.day}")
    private long dailyDuplicate;

    @Value("${onedb.url}")
    private String onedbUrl;

    @Autowired
    private PageMapper pageMapper;

    @Autowired
    private DbDecryptionKey dbDecryptionKey;

    private ConsultDb consultDb;
    private User regUser;

    public String consultDbSave(ConsultDb consultDb) {
        Map<String, String> apiMap = new HashMap<String, String>();

        try {
            this.consultDb = consultDb;

            if (pageMapper.findByConnectIp(consultDb) > 0) {
                return ONE_MIN_DUPLICATE_MSG;
            }

            regUser = pageMapper.findByPhoneNumber(consultDb);

            apiMap.put("m_csip", consultDb.getIp());
            apiMap.put("r_referer", consultDb.getReferer());
            apiMap.put("m_name", consultDb.getUserName());
            apiMap.put("m_phone", consultDb.getUserMobile());
            apiMap.put("m_sex", consultDb.getGender());
            apiMap.put("m_age", consultDb.getUserAge());
            apiMap.put("m_bad", "");
            apiMap.put("centerNm", "ckb");
            apiMap.put("utm_source", consultDb.getUtmParam().getUtm_source());

            if (CommonUtils.isNull(regUser)) {
                pageMapper.saveUniquePhoneNumber(consultDb);
                pageMapper.saveConsultDb(consultDb);
                return SUCCESS_MSG;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return duplicateUser(apiMap);
    }

    private String duplicateUser(Map<String, String> apiMap) {

        // 중복이더라도 이름이 예외처리 이름이라면 저장
        if (consultDb.isExceptUser()) {
            pageMapper.saveConsultDb(consultDb);
            return SUCCESS_MSG;
        }

        if (regUser.isDailyDuplicate(dailyDuplicate)) {
            return ONE_DAY_DUPLICATE_MSG;
        }

        boolean twoMonthDuplicate = regUser.isTwoMonthDuplicate();
        expireUserUpdate(twoMonthDuplicate);

        consultDb.setDuplicate(twoMonthDuplicate);
        pageMapper.saveConsultDb(consultDb);

        return SUCCESS_MSG;
    }

    private void expireUserUpdate(boolean twoMonthDuplicate) {
        if (!twoMonthDuplicate) {
            pageMapper.deleteExpirePhoneNumber(consultDb);
            pageMapper.saveUniquePhoneNumber(consultDb);
        }
    }

}
