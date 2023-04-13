package com.ingang.mentoring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ingang.mentoring.service.MentoringService;
import com.ingang.messageroom.service.MessageRoomService;

@EnableScheduling
@Component
public class MentoringScheduler {
	
    private final MentoringService mservice;

	@Autowired
    public MentoringScheduler(@Qualifier("mentoringServiceImpl")MentoringService mservice) {
        this.mservice = mservice;
    }

	@Scheduled(cron = "*/10 * * * * *")
    public void runTimer() {
        mservice.timer();
        System.out.println("멘토 리스트 갱신 스케줄러 실행 ............................");
    }
}