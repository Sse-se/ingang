package com.ingang.message.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ingang.mentoring.vo.MentoringVO;
import com.ingang.message.vo.MessageVO;
import com.ingang.reservation.vo.ReservationVO;

public interface MessageMapper {

	
	public int write(MessageVO vo);

	public long findrno(Map<String, Object> map);


	public List<Long> findrestime(long mno);

	public List<Date> findresdate(long mno);

	public List<MessageVO> list(Map<String, Object> map);

	public int allunreadcount(String id);

	
	
}
