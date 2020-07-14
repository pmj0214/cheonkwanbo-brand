package kr.co.echomarketing.cheonkwanbobrand.service;

import kr.co.echomarketing.cheonkwanbobrand.domain.Admin;
import kr.co.echomarketing.cheonkwanbobrand.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private AdminMapper adminMapper;

    public Admin findByUser(Admin admin) {
        return adminMapper.findByUser(admin);
    }

}
