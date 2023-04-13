package com.ingang.m_apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ingang.m_apply.mapper.M_applyMapper;
import com.ingang.m_apply.vo.M_applyVO;
import com.ingang.mentoring.vo.MentoringVO;
import com.webjjang.util.PageObject;

import lombok.Setter;

@Service
@Qualifier("M_applyServiceImpl")
public class M_applyServiceImpl implements M_applyService{
	
	@Setter(onMethod_ = @Autowired)
	private M_applyMapper mapper;
	
	@Override
	public List<MentoringVO> list(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}


	@Override
	public int write(M_applyVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}


//	@Override
//	public int delete(M_applyVO vo) {
//		// TODO Auto-generated method stub
//		return mapper.delete(vo);
//	}

} // end of CourseServiceImpl class
