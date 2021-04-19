package net.imcore;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;

public class AESProjectActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        String key = "abcdefghijklmnopqrstuvwxyz123456";

		String plainText;
		String encodeText = null;
		String decodeText = null;
		// Encrypt
		plainText  = "한글을 테스트 합니다.";
		try {
			encodeText = AES256Cipher.AES_Encode(plainText, key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Log.d("AES256_Encode", encodeText);
		
		// Decrypt
		try {
			decodeText = AES256Cipher.AES_Decode(encodeText, key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Log.d("AES256_Decode", decodeText);

    }
}