package com.projectJ.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projectJ.persistence.MapMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MapServiceImpl implements MapService{
	
	@Autowired
	private MapMapper mapper;

}
