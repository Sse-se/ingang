package com.ingang.course.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ingang.course.mapper.CourseMapper;
import com.ingang.course.vo.CourseVO;
import com.webjjang.util.PageObject;

import lombok.Setter;

@Service
@Qualifier("courseServiceImpl")
public class CourseServiceImpl implements CourseService{
	
	@Setter(onMethod_ = @Autowired)
	private CourseMapper mapper;
	
	// 리스트
	@Override
	public List<CourseVO> list(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	// 보기
	@Override
	public CourseVO view(long no) {
		return mapper.view(no);
	}
	
	// 등록
	@Override
	public int write(CourseVO vo) {
		mapper.write(vo);
		return 1;
	}

	// 수정
	@Override
	public int update(CourseVO vo) {
		mapper.update(vo);
		return 1;
	}

	// 삭제
	@Override
	public int delete(long no) {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}

	@Override
	public List<CourseVO> mainList() {
		// TODO Auto-generated method stub
		return mapper.mainList();
	}

} // end of CourseServiceImpl class
