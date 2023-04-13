package com.ingang.reservation.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ingang.mentoring.vo.MentoringVO;
import com.ingang.reservation.vo.ReservationVO;
import com.webjjang.util.PageObject;

public interface ReservationService {
	

	
	public int write(ReservationVO vo);

	public long findrno(long mno, String id);


	public List<Date> findresdate(long mno);

	public List<Long> findrestime(long mno);

	public long reserved(long roomno);

	public long denied(long roomno);

	

}
