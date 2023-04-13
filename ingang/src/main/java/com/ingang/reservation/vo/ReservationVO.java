package com.ingang.reservation.vo;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReservationVO {

	private long rno, mno, lecFee;
	private String aid, mid, greetings, resStatus;
	private long avaStartTime, avaEndTime, resTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date avaStartDate, avaEndDate, resDate;
	

}
