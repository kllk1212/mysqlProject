package com.projectJ.dao;

// 랜덤값 생성 클래스
public class Random {

	public static String getRandomStr(int size) {
		if(size > 0) {
			char[] tmp = new char[size];
			for(int i=0; i<tmp.length; i++) {
				int div = (int) Math.floor( Math.random() * 2 );
				
				if(div == 0) { // 0이면 숫자로
					tmp[i] = (char) (Math.random() * 10 + '0') ;
				}else { //1이면 알파벳
					tmp[i] = (char) (Math.random() * 26 + 'A') ;
				}
			}
			return new String(tmp);
		}
		return "ERROR : Size is required."; 
	}
	
	// Buffer를 사용하지 않고 변환하기
	public static byte[] toBytesWithoutBuffer(char[] chars) {
	    if (chars == null) return null;
	    byte[] byteArray = new byte[chars.length];
	    for (int i = 0; i < chars.length; i++) {
	        byteArray[i] = (byte) chars[i];
	    }
	    return byteArray;
	}
	
}
