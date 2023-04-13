package com.ingang.enrollList.service;

import java.util.List;
import java.util.Map;

import com.ingang.enroll.vo.EnrollVO;
import com.webjjang.util.PageObject;

public interface EnrollListService {
	
	public List<EnrollVO> list(PageObject pageObject, String id);


}
