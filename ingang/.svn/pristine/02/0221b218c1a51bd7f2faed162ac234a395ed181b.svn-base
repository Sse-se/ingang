package com.ingang.messageroom.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ingang.mentoring.mapper.MentoringMapper;
import com.ingang.mentoring.vo.MentoringVO;
import com.ingang.messageroom.mapper.MessageRoomMapper;
import com.ingang.messageroom.vo.MessageRoomVO;
import com.ingang.reservation.mapper.ReservationMapper;
import com.ingang.reservation.vo.ReservationVO;
import com.webjjang.util.PageObject;

import lombok.Setter;

@Service
@Qualifier("messageRoomServiceImpl")
public class MessageRoomServiceImpl implements MessageRoomService{
	
	@Setter(onMethod_ = @Autowired)
	private MessageRoomMapper mapper;
	


	@Override
	public int write(MessageRoomVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}



	@Override
	public List<MessageRoomVO> list(String id) {
		// TODO Auto-generated method stub
		return mapper.list(id);
	}



	@Override
	public long findroomno(String par, String id) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int updatep(long roomno) {
		// TODO Auto-generated method stub
		return mapper.updatep(roomno);
	}



	@Override
	public int updater(long roomno) {
		// TODO Auto-generated method stub
		return mapper.updater(roomno);
	}



	@Override
	public int updatet(long roomno) {
		// TODO Auto-generated method stub
		return mapper.updatet(roomno);
	}



	@Override
	public int updatea(long roomno) {
		// TODO Auto-generated method stub
		return mapper.updatea(roomno);
	}



	@Override
	public MessageRoomVO getvo(long roomno) {
		// TODO Auto-generated method stub
		return mapper.getvo(roomno);
	}



	@Override
	public int timer() {
		// TODO Auto-generated method stub
		return mapper.timer();
	}



	@Override
	public long utcservice(long roomno, String id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("roomno",roomno);
		map.put("id", id);
		
		long x = mapper.findx(map);
		long y = mapper.findy(map);
		
		map.put("x",x);
		map.put("y",y);
		
		
			
			return mapper.utcservice(map);
	
	}



	@Override
	public long increase(long roomno, String par1, String id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("roomno",roomno);
		map.put("id", id);
		long x = mapper.findx(map);
		long y = mapper.findy(map);
		map.put("x",x);
		map.put("y",y);
		
		return mapper.increase(map);
	
	}



	@Override
	public int adtonull(String id) {
		// TODO Auto-generated method stub
		
		
		return mapper.adtonull(id);
	}



	@Override
	public int updatelmcontent(MessageRoomVO mrvo) {
		// TODO Auto-generated method stub
		return mapper.updatelmcontent(mrvo);
	}



	@Override
	public int updatetTimer() {
		// TODO Auto-generated method stub
		return mapper.updatetTimer();
	}
	// 보기
	// 등록
	// 수정
	// 삭제

} // end of CourseServiceImpl class
