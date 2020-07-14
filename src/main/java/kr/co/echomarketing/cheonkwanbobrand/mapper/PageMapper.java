package kr.co.echomarketing.cheonkwanbobrand.mapper;

import kr.co.echomarketing.cheonkwanbobrand.domain.AdminCodeDb;
import kr.co.echomarketing.cheonkwanbobrand.domain.ConsultDb;
import kr.co.echomarketing.cheonkwanbobrand.domain.OneDbLog;
import kr.co.echomarketing.cheonkwanbobrand.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface PageMapper {
    Integer findByConnectIp(ConsultDb consultDb);

    User findByPhoneNumber(ConsultDb consultDb);

    void saveConsultDb(ConsultDb consultDb);

    void saveUniquePhoneNumber(ConsultDb consultDb);

    void deleteExpirePhoneNumber(ConsultDb consultDb);

}
