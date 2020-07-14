package kr.co.echomarketing.cheonkwanbobrand.component;

import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.Key;

public class AES256Utils {

    private final static String SERET_TYPE = "AES";
    private final static String KEY = "Echomarketing123!";
    private final static String SERET_INSTANCE_TYPE = "AES/CBC/PKCS5Padding";

    private String iv;
    private Key keySpec;

    public AES256Utils() throws UnsupportedEncodingException {
        this.iv = KEY.substring(0, 16);
        byte[] keyBytes = new byte[16];
        byte[] b = KEY.getBytes(StandardCharsets.UTF_8.name());
        int len = b.length;
        if (len > keyBytes.length) {
            len = keyBytes.length;
        }
        System.arraycopy(b, 0, keyBytes, 0, len);
        SecretKeySpec keySpec = new SecretKeySpec(keyBytes, SERET_TYPE);

        this.keySpec = keySpec;
    }

    // 암호화
    public String encrypt(String str) throws GeneralSecurityException, UnsupportedEncodingException {
        Cipher c = Cipher.getInstance(SERET_INSTANCE_TYPE);
        c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));
        byte[] encrypted = c.doFinal(str.getBytes(StandardCharsets.UTF_8.name()));
        String enStr = new String(Base64.encodeBase64(encrypted));
        return enStr;
    }

    // 복호화
    public String decrypt(String str) throws GeneralSecurityException, UnsupportedEncodingException {
        Cipher c = Cipher.getInstance(SERET_INSTANCE_TYPE);
        c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));
        byte[] byteStr = Base64.decodeBase64(str.getBytes());
        return new String(c.doFinal(byteStr), StandardCharsets.UTF_8.name());
    }

}
