package com.ingang.bookreview.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.ingang.bookreview.mapper.BookReviewMapper;

import com.ingang.bookreview.vo.BookReviewVO;
import com.webjjang.util.PageObject;
import lombok.Setter;

// @Controller, @Service, @Repository, @Componet, @RestController, @Advice  - 자동 생성을 위한 어노테이션.
// root-context.xml 또는 servlet-context.xml에 base-package로 선언
@Service
@Qualifier("bookReviewServiceImpl")
public class BookReviewServiceImpl implements BookReviewService {

	@Setter(onMethod_ = @Autowired)
	private BookReviewMapper mapper;
	
	@Override
	public List<BookReviewVO> list(PageObject pageObject, BookReviewVO vo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		map.put("pageObject", pageObject);
		pageObject.setTotalRow(mapper.getTotalRow(map));
		return mapper.list(map);
	}

	@Override
	public int checkDN(BookReviewVO vo) {
		// TODO Auto-generated method stub
//		int result;
//		if(vo == null) result = 0;
//		else result = 1;
//		 result;
		
		return mapper.checkDN(vo);
	}
	
	@Override
	public int write(BookReviewVO vo) {
		// TODO Auto-generated method stub
		
		return mapper.write(vo);
	}

	@Override
	public int update(BookReviewVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(Long rno) {
		// TODO Auto-generated method stub
		return mapper.delete(rno);
	}



	

}
