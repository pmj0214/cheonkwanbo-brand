package kr.co.echomarketing.cheonkwanbobrand.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Admin {

    private String admin_id;
    private String admin_pwd;
    private String authority;

    public Admin(String user_id) {
        this.admin_id = user_id;
    }

    public boolean isAdmin() {
        return authority.equals("admin");
    }

}
