package com.ingang.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ingang.book.mapper.BookMapper;
import com.ingang.book.vo.BookVO;
import com.ingang.course.vo.CourseVO;
import com.webjjang.util.PageObject;

import lombok.Setter;

@Service
@Qualifier("bookServiceImpl")
public class BookServiceImpl implements BookService{

	@Setter(onMethod_ = @Autowired)
	private BookMapper mapper;
	
	@Override
	public List<BookVO> list(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

	@Override
	public BookVO view(long no) {
		return mapper.view(no);
	}
	@Override
	public List<BookVO> clist(PageObject pageObject){
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.clist(pageObject);
	}

	@Override
	public int write(BookVO vo) {
		mapper.write(vo);
		return 1;
	}

	@Override
	public Integer update(BookVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int updateImage(BookVO vo) {
		return mapper.updateImage(vo);
	}

	@Override
	public int delete(long no) {
		return mapper.delete(no);
	}

	@Override
	public List<BookVO> mainList() {
		// TODO Auto-generated method stub
		return mapper.mainList();
	}

}
