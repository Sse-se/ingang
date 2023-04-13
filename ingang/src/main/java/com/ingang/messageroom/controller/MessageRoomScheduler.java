package com.ingang.messageroom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ingang.messageroom.service.MessageRoomService;

@EnableScheduling
@Component
public class MessageRoomScheduler {
	
    private final MessageRoomService mrservice;

	@Autowired
    public MessageRoomScheduler(@Qualifier("messageRoomServiceImpl")MessageRoomService mrservice) {
        this.mrservice = mrservice;
    }

	@Scheduled(cron = "*/10 * * * * *")
    public void runTimer() {
        mrservice.timer();
        System.out.println("대화방 '진행중' 스케줄러 실행 ............................");
    }
	@Scheduled(cron = "*/10 * * * * *")
	public void runUpdatet() {
		mrservice.updatetTimer();
		System.out.println("대화방 '종료' 스케줄러 실행 ............................");
	}
	
	
}