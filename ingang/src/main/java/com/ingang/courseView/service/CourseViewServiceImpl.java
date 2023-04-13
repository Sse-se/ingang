package com.ingang.courseView.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ingang.courseView.mapper.CourseViewMapper;
import com.ingang.courseView.vo.CourseViewVO;

@Service
@Qualifier("courseViewServiceImpl")
public class CourseViewServiceImpl implements CourseViewService{

	@Autowired
	private CourseViewMapper mapper;	
	
	@Override
	public int update(CourseViewVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

}
