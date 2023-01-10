package com.projectJ.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectJ.domain.UserInfoDTO;
import com.projectJ.persistence.MainMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MainServiceImpl implements MainService{

	@Autowired
	private MainMapper mapper;


	
	@Override
	public void insertUserData(UserInfoDTO userDTO) {

		mapper.insertUserData(userDTO);
	}



	@Override
	public int idCheck(UserInfoDTO dto) {
		return mapper.idCheck(dto);
	}



	@Override
	public int idPwCheck(UserInfoDTO dto) {
		return mapper.idPwCheck(dto);
	}




	
	



}
