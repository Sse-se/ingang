package com.ingang.book.service;

import java.util.List;

import com.ingang.book.vo.BookVO;
import com.ingang.course.vo.CourseVO;
import com.webjjang.util.PageObject;

public interface BookService {
	// 리스트
	public List<BookVO> list(PageObject pageObject);
	// 보기
	public BookVO view(long no);
	// 강의리스트 가져오기
	public List<BookVO> clist(PageObject pageObject);
	// 등록
	public int write(BookVO vo);
	// 수정
	public Integer update(BookVO vo);
	// 이미지 변경
	public int updateImage(BookVO vo);
	// 삭제
	public int delete(long no);
	// 메인 리스트
	public List<BookVO> mainList();

	
}// end of BookService
