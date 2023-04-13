package com.ingang.messageroom.vo;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MessageRoomVO {

	private long roomno, rno, mno, unreadcount1, unreadcount2;
	private String aid, par1, par2, lmcontent, memberimg, roomstatus, field, greetings;
	private long resTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date resDate;
}
