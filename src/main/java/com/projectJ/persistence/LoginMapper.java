package com.projectJ.persistence;

import org.apache.ibatis.annotations.Mapper;

import com.projectJ.domain.MemberInfoDTO;

@Mapper
public interface LoginMapper {

	public int insertUserData(MemberInfoDTO userDTO); // 회원가입기능
}
