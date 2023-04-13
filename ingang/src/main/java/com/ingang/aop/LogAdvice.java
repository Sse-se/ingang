package com.ingang.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class LogAdvice {

	// @Around - 실행 전,후 처리를 선언해서 동작시킨다
	@Around("execution(* com.ingang.*.service.*ServiceImpl.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
		
		log.info("+=======================================+");
		long start = System.currentTimeMillis();
		
		log.info("+실행 객체 : "+pjp.getTarget());
		log.info("+실행 메서드 : "+pjp.getSignature());
		log.info("+데이터 : "+Arrays.toString(pjp.getArgs()));
		
		Object result = null;
		
		try {
			result = pjp.proceed();
		} catch (Throwable e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		log.info("+처리 결과 : "+result);
		long end = System.currentTimeMillis();
		
		log.info("+처리 시간 : "+(end-start));
		log.info("+=======================================+");
		
		return result;
	}
	
}
