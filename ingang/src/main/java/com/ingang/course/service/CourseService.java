package com.ingang.course.service;

import java.util.List;

import com.ingang.course.vo.CourseVO;
import com.webjjang.util.PageObject;

public interface CourseService {

	// 리스트
	public List<CourseVO> list(PageObject pageObject);
	
	// 보기
	public CourseVO view(long no);
	
	// 등록
	public int write(CourseVO vo);
	
	// 수정
	public int update(CourseVO vo);
	
	// 삭제
	public int delete(long no);
	
	// 메인 리스트
	public List<CourseVO> mainList();

} // end of CourseService interface
