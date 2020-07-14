package kr.co.echomarketing.cheonkwanbobrand.mapper;

import kr.co.echomarketing.cheonkwanbobrand.domain.Admin;
import kr.co.echomarketing.cheonkwanbobrand.domain.AdminCodeDb;
import kr.co.echomarketing.cheonkwanbobrand.domain.AdminConsultDb;
import kr.co.echomarketing.cheonkwanbobrand.domain.AdminSearchParam;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {

    Admin findByUser(Admin admin);

    List<AdminConsultDb> findByDbList(AdminSearchParam adminSearchParam);

    Integer countByDbList(AdminSearchParam adminSearchParam);
}
