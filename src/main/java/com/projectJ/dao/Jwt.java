package com.projectJ.dao;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.json.JSONObject;



public class Jwt {

	private static final String alg = "HS256"; // 사용할 알고리즘 sha 256
	private static final String secret_key = "work6krwork6kr"; // 비밀 키
	// private static long tokenValidMilisecond = 1000L * 60 * 60; // JWT 만료 시간 1시간


	public static String createAccessToken(int m_idx) { // m_idx = 유저고유번호

		String jwt = null; // 리턴값 선언
		Date date = new Date(); // accessToken 에 넣을 시간 생성
		
		long time = date.getTime()/1000 + 600;
		//long time10min = (date.getTime()/1000) + 600;
		System.out.println("time : " + time);
		//System.out.println("time10min : " + time10min);
		//int time = 1672968543;
		try {
			Map<String, Object> payloadData = new LinkedHashMap();
			payloadData.put("expirationDate", time);
			payloadData.put("id", m_idx);

			Map<String, Object> headerData = new LinkedHashMap();
			headerData.put("alg", "sha256");
			headerData.put("typ", "JWT");

			JSONObject header = new JSONObject(headerData);
			JSONObject payload = new JSONObject(payloadData);

			SHA256 sha256 = new SHA256();
			
			// {"alg":"sha256","typ":"JWT"}{"expirationDate":1672968543,"id":5}work6krwork6kr
			//-> sha256 인코딩
			String signature = sha256.encrypt(header.toString() + payload.toString() + secret_key);
			System.out.println("signature method param 2 :" + signature);
			// {"alg":"sha256","typ":"JWT"}.{"expirationDate":1672968543,"id":5}.53dfa0a84947ce011a831b2d8091c971adbea015a2e7df41090806671e79ccbd
			// -> base64 인코딩
			String jwtBefore = header.toString() + "." + payload.toString() + "." + signature;
			byte[] jwtByte = Base64.encodeBase64(jwtBefore.getBytes());
			jwt = new String(jwtByte);
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return jwt;
	}

	public static String createRefreshToken(int m_idx) {

		String jwt = null; // 리턴값 선언
		Date date = new Date(); // accessToken 에 넣을 시간 생성
		long time = date.getTime()/1000 + 3600;
		
		try {
			Map<String, Object> payloadData = new LinkedHashMap();
			payloadData.put("expirationDate", time);
			payloadData.put("id", m_idx);

			Map<String, Object> headerData = new LinkedHashMap();
			headerData.put("alg", "sha256");
			headerData.put("typ", "JWT");

			JSONObject header = new JSONObject(headerData);
			JSONObject payload = new JSONObject(payloadData);

			SHA256 sha256 = new SHA256();
			
			// {"alg":"sha256","typ":"JWT"}{"expirationDate":1672968543,"id":5}work6krwork6kr
			//-> sha256 인코딩
			String signature = sha256.encrypt(header.toString() + payload.toString() + secret_key);
			//System.out.println("signature method param 2 :" + signature);
			// {"alg":"sha256","typ":"JWT"}.{"expirationDate":1672968543,"id":5}.53dfa0a84947ce011a831b2d8091c971adbea015a2e7df41090806671e79ccbd
			// -> base64 인코딩
			String jwtBefore = header.toString() + "." + payload.toString() + "." + signature;
			byte[] jwtByte = Base64.encodeBase64(jwtBefore.getBytes());
			jwt = new String(jwtByte);
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return jwt;

	}
	/*
	public static String test(int sno) {

		String jwt = null; // 리턴값 선언
		
		Date date = new Date(); // accessToken 에 넣을 시간 생성
		//String timeBefore = String.valueOf(date.getTime()/1000);
		//int time = Integer.parseInt(timeBefore.substring(0, timeBefore.length()-3));
		
		long time = date.getTime()/1000;
		long time10min = (date.getTime()/1000) + 600;
		System.out.println("time : " + time);
		System.out.println("time10min : " + time10min);
		//int time = 1672968543;
		try {
			Map<String, Object> payloadData = new LinkedHashMap();
			payloadData.put("expirationDate", time);
			payloadData.put("id", sno);

			Map<String, Object> headerData = new LinkedHashMap();
			headerData.put("alg", "sha256");
			headerData.put("typ", "JWT");

			JSONObject header = new JSONObject(headerData);
			JSONObject payload = new JSONObject(payloadData);

			SHA256 sha256 = new SHA256();
			
			// {"alg":"sha256","typ":"JWT"}{"expirationDate":1672968543,"id":5}work6krwork6kr
			//-> sha256 인코딩
			String signature = sha256.encrypt(header.toString() + payload.toString() + secret_key);
			System.out.println("signature method param 2 :" + signature);
			// {"alg":"sha256","typ":"JWT"}.{"expirationDate":1672968543,"id":5}.53dfa0a84947ce011a831b2d8091c971adbea015a2e7df41090806671e79ccbd
			// -> base64 인코딩
			String jwtBefore = header.toString() + "." + payload.toString() + "." + signature;
			byte[] jwtByte = Base64.encodeBase64(jwtBefore.getBytes());
			jwt = new String(jwtByte);
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return jwt;
	}
	 * */
}
