package com.ingang.bookreview.service;

import java.util.List;

import com.ingang.bookreview.vo.BookReviewVO;
import com.webjjang.util.PageObject;

public interface BookReviewService {
	
	public List<BookReviewVO> list(PageObject pageObject, BookReviewVO vo);
	
	public int checkDN(BookReviewVO vo);
	
	public int write(BookReviewVO vo);
	
	public int update(BookReviewVO vo);
	
	public int delete(Long rno);

}
