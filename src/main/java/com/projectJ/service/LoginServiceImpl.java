package com.projectJ.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectJ.domain.MemberInfoDTO;
import com.projectJ.persistence.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService{
	
	
	@Autowired
	LoginMapper mapper;

	@Override
	public int insertUserData(MemberInfoDTO userDTO) {
		
		return mapper.insertUserData(userDTO);
	}

	
	


}
