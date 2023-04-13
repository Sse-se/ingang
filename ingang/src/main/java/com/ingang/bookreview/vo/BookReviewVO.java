package com.ingang.bookreview.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BookReviewVO {

	// 리뷰번호, 교재번호, 주문상세번호
	private long rno, no, detailNo;
	private String id, content;
	private Date writeDate;
	private long score, likecnt;
	
}
