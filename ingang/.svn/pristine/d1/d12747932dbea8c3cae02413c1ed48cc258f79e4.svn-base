package com.ingang.mentoring.vo;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MentoringVO {

	private long mno, lecFee;
	private String mid, head, field, career, incumbent, intro, status;
	private long avaStartTime, avaEndTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date avaStartDate, avaEndDate;
	private String memberimg;
	public int getAvaTimeUnit() {
		// TODO Auto-generated method stub
		return 60;
	} 
}
