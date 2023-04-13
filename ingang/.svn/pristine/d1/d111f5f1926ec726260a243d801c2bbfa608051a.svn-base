package com.ingang.enroll.service;

import java.util.List;

import com.ingang.enroll.vo.EnrollVO;
import com.webjjang.util.PageObject;

public interface EnrollService {

	// 강의 구매내역
	public List<EnrollVO> orderList(String id, PageObject pageObject);

	// 모든 회원 강의 구매내역
	public List<EnrollVO> orderListAll(PageObject pageObject);

	// 강의 구매 상세내역
	public List<EnrollVO> orderView(EnrollVO vo);
	
	// 강의 구매 상세내역
	public List<EnrollVO> viewDetail(EnrollVO vo);
	
	// 수강 목록
	public List<EnrollVO> enrollList(String id, PageObject pageObject);
	
	// 강의 결제하기
	public int enroll(EnrollVO vo);
	
	// 수강 취소
	public int deleteEnroll(EnrollVO vo);
	
}
