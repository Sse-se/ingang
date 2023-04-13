package com.ingang.messageroom.service;

import java.util.List;


import com.ingang.messageroom.vo.MessageRoomVO;

public interface MessageRoomService {
	

	public List<MessageRoomVO> list(String id);
	
	public int write(MessageRoomVO mvo);

	public long findroomno(String par, String id);

	public int updatep(long roomno);

	public int updater(long roomno);

	public int updatet(long roomno);

	public int updatea(long roomno);

	public MessageRoomVO getvo(long roomno);

	public int timer();

	public long utcservice(long roomno, String id);


	public long increase(long roomno, String par1, String id);

	public int adtonull(String id);

	public int updatelmcontent(MessageRoomVO mrvo);

	public int updatetTimer();
	

}
