package com.ingang.member.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


import com.ingang.member.service.MemberService;

//스케줄러
@Component
public class MemberScheduler {
	
	@Autowired
	@Qualifier("memberServiceImpl")
	MemberService service;
	
	//12시간마다 90일미접속자 휴면으로 전환
	@Scheduled(cron = "0 0 */12 * * *")
	  public void autoUpdate() {
	    System.out.println("스케줄러 실행");
	    service.sleepUser();
	  }
}
