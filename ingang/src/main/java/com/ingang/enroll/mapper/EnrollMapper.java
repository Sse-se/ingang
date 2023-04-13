package com.ingang.enroll.mapper;

import java.util.List;
import java.util.Map;

import com.ingang.enroll.vo.EnrollVO;
import com.webjjang.util.PageObject;

public interface EnrollMapper {
	
	// 강의 구매내역
	public List<EnrollVO> orderList(Map<String, Object> map);

	// totalRow 계산
	public long getTotalRow(Map<String, Object> map);
	
	// 모든 회원 강의 구매내역
	public List<EnrollVO> orderListAll(PageObject pageObject);
	
	// 모든 회원 totalRow 계산
	public long getTotalRowAll(PageObject pageObject);
	
	// 강의 구매 상세내역
	public List<EnrollVO> orderView(EnrollVO vo);
	
	// 강의 구매 상세내역 - 방금 구매
	public List<EnrollVO> viewDetail(EnrollVO vo);
	
	// 수강 목록
	public List<EnrollVO> enrollList(Map<String, Object> map);

	// 수강목록 totalRow 계산
	public long getTotalRowEnroll(Map<String, Object> map);
	
	// 강의 결제하기
	// enroll insert
	public int enroll(EnrollVO vo);
	// detail insert
	public int enrollDetail(EnrollVO vo);
	
	// 수강 취소
	// detail deleteAll
	public int deleteDetailAll(EnrollVO vo);
	// detail delete
	public int deleteDetail(EnrollVO vo);
	// enroll delete
	public int deleteEnroll(EnrollVO vo);
	// update totalprice
	public int updateTotalprice(EnrollVO vo);
	
}
