package com.ingang.messageroom.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ingang.mentoring.vo.MentoringVO;
import com.ingang.messageroom.vo.MessageRoomVO;
import com.ingang.reservation.vo.ReservationVO;
import com.webjjang.util.PageObject;

public interface MessageRoomMapper {

	
	public int write(MessageRoomVO vo);

	public List<MessageRoomVO> list(String id);
	
	public long findroomno(String par, String id);


	public int updatep(long roomno);

	public int updater(long roomno);

	public int updatet(long roomno);

	public int updatea(long roomno);

	public MessageRoomVO getvo(long roomno);

	public int timer();

	public long utcservice(Map<String, Object> map);

	public long findx(Map<String, Object> map);

	public long findy(Map<String, Object> map);

	public long increase(Map<String, Object> map);

	public int adtonull(String id);

	public int updatelmcontent(MessageRoomVO mrvo);

	public int updatetTimer();

}
