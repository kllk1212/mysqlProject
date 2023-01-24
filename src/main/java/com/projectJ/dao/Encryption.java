package com.projectJ.dao;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.security.spec.KeySpec;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Hex;
import org.json.JSONObject;



// 암복호화 클래스
public class Encryption {

	
	private final static String secretKey = "jaehoon"; // 서버 비밀키
	private final static String keyAlgoMethod = "PBKDF2WithHmacSHA512"; // 키의 알고리즘(factory)
	// var hashKey = CryptoJS.PBKDF2(key, salt, {'hasher': CryptoJS.algo.SHA512, 'keySize': (encryptMethodLength/8), 'iterations': iterations});
	
	private final static String ciperAlgoMethod = "AES/CBC/PKCS5Padding"; // cipher의 알고리즘(cipher)
	private final static int iterations = 999; // 해시 함수 암호화 과정 999번 반복 ( 복호화시엔 서버에서 넘어오는 iterations 사용 )
	private final static int keyLength = 256; // 키의 길이 (java 버그로 256만 인식된다고함)
	//private final static String encryptMethod = "AES-256-CBC"; -> 아래 스크립트에서 사용하고 있는 암호화 방식
	// var encrypted = CryptoJS.AES.encrypt(string, hashKey, {'mode': CryptoJS.mode.CBC, 'iv': iv});
	
	
	
	// 암호화 ( 서버(java) -> 프론트(js) )
	public static String encrypt(String sendText){
		String result = "";
		try {
			Random dao = new Random();
			// 랜덤 String타입 iv 16글자 생성 + byte 형변환 + UTF_8
			byte[] iv_before = dao.getRandomStr(16).getBytes(StandardCharsets.UTF_8); // cipher에 넣어야함(hex인코딩전)
			//System.out.println("iv_before 의 길이 : " + iv_before.length);
			// iv_before -> hex로 인코딩 / origiralOutput 으로 보낼땐 hex 인코딩 후 보내야함
			String iv_hex = Hex.encodeHexString(iv_before); // origiralOutput 으로 보낼땐 hex 인코딩 후 보내야함
			//System.out.println("iv_hex : " + iv_hex);		
			// 랜덤 String타입 salt 256글자 생성 + byte 형변환 + UTF_8
			byte[] salt_before = dao.getRandomStr(256).getBytes(StandardCharsets.UTF_8); // KeySpec spec에 넣어야함(hex인코딩전)
			// salt_before -> hex로 인코딩 / origiralOutput 으로 보낼땐 hex 인코딩 후 보내야함
			String salt_hex = Hex.encodeHexString(salt_before); 
	
	        SecretKeyFactory factory = SecretKeyFactory.getInstance(keyAlgoMethod);
	        KeySpec spec = new PBEKeySpec(secretKey.toCharArray(), salt_before, iterations, 256);
	        SecretKey key = new SecretKeySpec(factory.generateSecret(spec).getEncoded(), "AES");
	        Cipher cipher = Cipher.getInstance(ciperAlgoMethod);
	        cipher.init(Cipher.ENCRYPT_MODE, key, new IvParameterSpec(iv_before));
	        byte[] encryptedBytes = cipher.doFinal(sendText.getBytes());
			String base64 = Base64.getEncoder().encodeToString(encryptedBytes);
			String encrypted = "";
			encrypted = new String(base64);
			
			String origiralOutput = "{\"ciphertext\":"+"\"" + encrypted +"\""+","
						+ "\"iv\":" + "\""+ iv_hex + "\"" + ","
						+ "\"salt\":" + "\"" + salt_hex + "\"" + ","
						+ "\"iterations\":" + "\"" + iterations + "\"" + "}";
			String output = Base64.getEncoder().encodeToString(origiralOutput.getBytes());
			System.out.println("origiralOutput : " + origiralOutput);
			System.out.println("Base64 인코딩 후 프론트에 보낼 output : " + output);	
			result = output;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 복호화( 프론트(js) -> 서버(java) )
	public static String decrypt(String token){
		String result = "";
		try {
			byte[] base64Token = Base64.getDecoder().decode(token);
            String base64UTF8 = new String(base64Token,"UTF-8");
            
            // 넘어온 데이터 JSON 형태로 변환 -> {"iv": "데이터","salt": "데이터","ciphertext": "데이터"}
            JSONObject jobj = new JSONObject(base64UTF8);
            
            
            String ivString = jobj.getString("iv");
            //byte[] iv = Hex.decodeHex(ivString);
            byte[] iv = Hex.decodeHex(ivString.toCharArray());

            String saltString = jobj.getString("salt");
            byte[] salt = Hex.decodeHex(saltString.toCharArray());
            
            String ciphertextString = jobj.getString("ciphertext");
            byte[] ciphertext = Base64.getDecoder().decode(ciphertextString.getBytes());
			int iterations = Integer.valueOf(jobj.get("iterations").toString());
	        SecretKeyFactory factory = SecretKeyFactory.getInstance(keyAlgoMethod);
	        KeySpec spec = new PBEKeySpec(secretKey.toCharArray(), salt, iterations, keyLength);
	        SecretKey key = new SecretKeySpec(factory.generateSecret(spec).getEncoded(), "AES");
	        Cipher cipher = Cipher.getInstance(ciperAlgoMethod);
	        cipher.init(Cipher.DECRYPT_MODE, key, new IvParameterSpec(iv));
	        
	        String plaintext = new String(cipher.doFinal(ciphertext), "UTF-8");
	        result = plaintext;
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}//EncryptionDAO
