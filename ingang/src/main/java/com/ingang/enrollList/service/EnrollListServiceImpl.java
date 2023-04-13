package com.ingang.enrollList.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ingang.enroll.vo.EnrollVO;
import com.ingang.enrollList.mapper.EnrollListMapper;
import com.webjjang.util.PageObject;

@Service
@Qualifier("enrollListServiceImpl")
public class EnrollListServiceImpl implements EnrollListService{

	@Autowired
	private EnrollListMapper mapper;
	
	@Override
	public List<EnrollVO> list(PageObject pageObject, String id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageObject", pageObject);
		map.put("id", id);
		
		pageObject.setTotalRow(mapper.getTotalRowEnroll(map));
		map.put("pageObject", pageObject);
		
		return mapper.list(map);
	}

}
