package com.ingang.reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ingang.member.vo.MemberVO;
import com.ingang.mentoring.service.MentoringService;
import com.ingang.mentoring.vo.MentoringVO;
import com.ingang.message.service.MessageService;
import com.ingang.message.vo.MessageVO;
import com.ingang.messageroom.service.MessageRoomService;
import com.ingang.messageroom.vo.MessageRoomVO;
import com.ingang.reservation.service.ReservationService;
import com.ingang.reservation.vo.ReservationVO;
import com.webjjang.util.PageObject;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	@Qualifier("reservationServiceImpl")
	private ReservationService reservationservice;
	@Autowired
	@Qualifier("messageRoomServiceImpl")
	private MessageRoomService messageroomservice;
	@Autowired
	@Qualifier("mentoringServiceImpl")
	private MentoringService mentoringservice;
	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageservice;


	
	@GetMapping("/write.do")
	public String writeForm(long mno , Model model) {

	    // 예약가능한 최소날짜와 최대날짜, 최소시간과 최대시간을 나타낸다.
	    MentoringVO mentoringVO = mentoringservice.getvo(mno);
	    model.addAttribute("vo", mentoringVO);

	    // 멘토링 글 번호에 따른 예약 정보를 가져온다.
	    List<Date> reservedDateList = reservationservice.findresdate(mno);
	    List<Date> availableDateList = new ArrayList<>();

	    // 예약 가능한 날짜 목록 생성
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(mentoringVO.getAvaStartDate());
	    Date startDate = cal.getTime();
	    cal.setTime(mentoringVO.getAvaEndDate());
	    Date endDate = cal.getTime();

//	    for (Date date = startDate; date.before(endDate) || date.equals(endDate); date = DateUtils.addDays(date, 1)) {
//	        if (!reservedDateList.contains(date)) {
//	            availableDateList.add(date);
//	        }
//	    }

	    model.addAttribute("resDate", availableDateList);

	    List<Long> reservedTimeList = reservationservice.findrestime(mno);
	    List<Long> availableTimeList = new ArrayList<>();

	    // 예약 가능한 시간 목록 생성
	    for (Long time = mentoringVO.getAvaStartTime(); time <= mentoringVO.getAvaEndTime(); time += mentoringVO.getAvaTimeUnit()) {
	        if (!reservedTimeList.contains(time)) {
	            availableTimeList.add(time);
	        }
	    }

	    model.addAttribute("resTime", availableTimeList);

	    return "reservation/write";
	}
	
//	@GetMapping("/writeDate.do")
//	public String writeForm(long mno, Model model) {
//
//	    // 예약가능한 최소날짜와 최대날짜, 최소시간과 최대시간을 나타낸다.
//	    MentoringVO mentoringVO = mentoringservice.getvo(mno);
//	    model.addAttribute("vo", mentoringVO);
//
//	    // 멘토링 글 번호에 따른 예약 정보를 가져온다.
//	    List<Date> reservedDateList = reservationservice.findresdate(mno);
//	    List<Date> availableDateList = new ArrayList<>();
//
//	    // 예약 가능한 날짜 목록 생성
//	    Calendar cal = Calendar.getInstance();
//	    cal.setTime(mentoringVO.getAvaStartDate());
//	    Date startDate = cal.getTime();
//	    cal.setTime(mentoringVO.getAvaEndDate());
//	    Date endDate = cal.getTime();
//
//	    for (Date date = startDate; date.before(endDate) || date.equals(endDate); date = DateUtils.addDays(date, 1)) {
//	        if (!reservedDateList.contains(date)) {
//	            availableDateList.add(date);
//	        }
//	    }
//
//	    model.addAttribute("availableDateList", availableDateList);
//
//	    return "reservation/writeDate";
//	}
//	
	

	@PostMapping("/write.do")
	public String write(MessageVO msvo,ReservationVO rvo, MessageRoomVO mvo, HttpServletRequest request, RedirectAttributes rttp)
	        throws ParseException {

	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date resDate = sdf.parse(request.getParameter("resDate"));
	    MemberVO memberVO = (MemberVO) request.getSession().getAttribute("login");
	    long mno = Long.parseLong(request.getParameter("mno"));
	    long resTime = Long.parseLong(request.getParameter("resTime"));
	    long rno = reservationservice.findrno(mno, memberVO.getId());

	    if (rno > 0) { // 예약 있으면 - 예약 실행 x
	        return "reservation/cancel";
	    }

	    // 예약 없을떄 - 예약 실행
	    reservationservice.write(rvo);
//	    rno = rvo.getRno(); // 저장된 예약 번호 가져오기
//	    mvo.setRno(rno);
	    mvo.setMno(mno);
	    mvo.setResDate(resDate);
	    mvo.setLmcontent(request.getParameter("greetings"));
	    mvo.setMemberimg(memberVO.getMemberimg());
	    mvo.setPar1(request.getParameter("aid"));
	    mvo.setPar2(request.getParameter("mid"));
	    mvo.setResTime(resTime);
	    mvo.setField(request.getParameter("field"));
	    mvo.setMemberimg(request.getParameter("memberimg"));
	    messageroomservice.write(mvo);
	    
	    return "redirect:/mentoring/list.do";
	
	}
}
