package com.projectJ.dao;

public class OauthDAO {

	
	// 유니코드를 한글로 변환해주는 기능
	public String uniTokor(String uni) {
	    StringBuffer result = new StringBuffer();
	    
	    for(int i=0; i<uni.length(); i++){
	        if(uni.charAt(i) == '\\' &&  uni.charAt(i+1) == 'u'){    
	            Character c = (char)Integer.parseInt(uni.substring(i+2, i+6), 16);
	            result.append(c);
	            i+=5;
	        }else{
	            result.append(uni.charAt(i));
	        }
	    }
	    return result.toString();
	}
	
}
