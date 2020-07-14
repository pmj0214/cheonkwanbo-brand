package kr.co.echomarketing.cheonkwanbobrand.component;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;

@Component
public class DbDecryptionKey {

    @Value("${database.encode.key}")
    private String dbEncodekey;

    public String decrypt() throws GeneralSecurityException, UnsupportedEncodingException {
        AES256Utils aes256Utils = new AES256Utils();
        return aes256Utils.decrypt(dbEncodekey);
    }

}
