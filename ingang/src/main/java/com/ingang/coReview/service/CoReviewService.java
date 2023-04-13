package com.ingang.coReview.service;

import java.util.List;

import com.ingang.coReview.vo.CoReviewVO;
import com.webjjang.util.PageObject;

public interface CoReviewService {

	// 리뷰 리스트
	public List<CoReviewVO> list(PageObject pageObject, CoReviewVO vo);

	public long count(CoReviewVO vo);
	
	// 리뷰 작성
	public int write(CoReviewVO vo);
	
	// 리뷰 수정
	public int update(CoReviewVO vo);
	
	// 리뷰 삭제
	public int delete(CoReviewVO vo);
	
	// 좋아요 하기
	public int like(CoReviewVO vo);

	// 좋아요 취소
	public int cancelLike(CoReviewVO vo);
	
	// 내가 좋아요한 리뷰번호 가져오기
	public List<Long> myLike(CoReviewVO vo);
	
	// pno 가져오기
	public long selectPno(CoReviewVO vo);
	
}
