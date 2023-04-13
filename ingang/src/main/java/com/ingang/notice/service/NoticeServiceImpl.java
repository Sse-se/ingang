package com.ingang.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ingang.notice.mapper.NoticeMapper;
import com.ingang.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

import lombok.Setter;

@Service
@Qualifier("noticeServiceImpl")
public class NoticeServiceImpl implements NoticeService{

	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;

	@Override // 전체
	public List<NoticeVO> list(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

	@Override // 예약
	public List<NoticeVO> reservedList(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.reservedList(pageObject);
	}

	@Override // 지난
	public List<NoticeVO> lastList(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.lastList(pageObject);
	}

	@Override // 현재
	public List<NoticeVO> currentList(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getTotalRow1(pageObject));
		return mapper.currentList(pageObject);
	}

	@Override
	public NoticeVO view(long no,int inc) {
		if(inc >= 0) {			
			mapper.increase(no);
		}
		return mapper.view(no);
	}

	@Override
	public int write(NoticeVO vo) {
		return mapper.write(vo);
	}

	@Override
	public int update(NoticeVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int delete(long no) {
		return mapper.delete(no);
	}

}
