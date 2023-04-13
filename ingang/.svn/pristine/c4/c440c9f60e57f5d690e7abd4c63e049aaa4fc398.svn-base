package com.ingang.enroll.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ingang.coReview.mapper.CoReviewMapper;
import com.ingang.coReview.vo.CoReviewVO;
import com.ingang.enroll.mapper.EnrollMapper;
import com.ingang.enroll.vo.EnrollVO;
import com.webjjang.util.PageObject;

@Service
@Qualifier("enrollServiceImpl")
public class EnrollServiceImpl implements EnrollService {

	@Autowired
	private EnrollMapper mapper;
	
	@Autowired
	private CoReviewMapper rmapper;
	
	// 본인 강의 구매내역
	@Override
	public List<EnrollVO> orderList(String id, PageObject pageObject) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pageObject", pageObject);

		pageObject.setTotalRow(mapper.getTotalRow(map));
		
		return mapper.orderList(map);
	}
	
	// 모든회원 강의 구매내역 - 관리자
	@Override
	public List<EnrollVO> orderListAll(PageObject pageObject) {
		// TODO Auto-generated method stub
		
		pageObject.setTotalRow(mapper.getTotalRowAll(pageObject));
		
		return mapper.orderListAll(pageObject);
	}
	
	// 본인강의 구매 상세내역 
	@Override
	public List<EnrollVO> orderView(EnrollVO vo) {
		// TODO Auto-generated method stub
		return mapper.orderView(vo);
	}
	
	@Override
	public List<EnrollVO> viewDetail(EnrollVO vo) {
		// TODO Auto-generated method stub
		return mapper.viewDetail(vo);
	}
	

	// 수강 목록
	@Override
	public List<EnrollVO> enrollList(String id, PageObject pageObject) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pageObject", pageObject);
		
		pageObject.setTotalRow(mapper.getTotalRowEnroll(map));
		
		return mapper.enrollList(map);
	}

	// 강의 결제
	@Transactional
	@Override
	public int enroll(EnrollVO vo) {
		// TODO Auto-generated method stub
		
		// enroll insert
		mapper.enroll(vo);
		// detail insert --> 여러개면 for문으로
		mapper.enrollDetail(vo);
		
		return 1;
	}

	// 본인 강의 결제취소
	@Transactional
	@Override
	public int deleteEnroll(EnrollVO vo) {
		// TODO Auto-generated method stub
		
		CoReviewVO reVO = new CoReviewVO();
		
		long[] pnoList = vo.getPnoList();
		long[] priceList = vo.getPriceList();
		
		// 취소할 강의들의 가격 합 
		for(long price : priceList) {
			vo.setCancelprice(vo.getCancelprice()+price);
		}
		// 취소할 강의들 상태 변경
		for(long pno : pnoList) {
			// 취소한 강의의 수강평 삭제
			reVO.setId(vo.getId());
			reVO.setPno(pno);
			rmapper.deleteLike(reVO);
			rmapper.delete(reVO);
			
			// delete delete -- 부분 취소
			vo.setPno(pno);
			mapper.deleteDetail(vo);
		}
		// 취소할 강의들 합 총 결제금액에서 빼기
		mapper.updateTotalprice(vo);
		
		// allCancel이 1이면 enroll 테이블에 취소로 변경
		if(vo.getAllCancel() == 1) {
			// delete enroll
			mapper.deleteEnroll(vo);
		}
		
		return 1;
	}


}
