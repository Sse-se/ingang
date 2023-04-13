package com.ingang.enroll.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ingang.course.service.CourseService;
import com.ingang.enroll.service.EnrollService;
import com.ingang.enroll.vo.EnrollVO;
import com.ingang.member.service.MemberService;
import com.ingang.member.vo.MemberVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/enroll")
@Log4j
public class EnrollContorller {
	
	@Autowired
	@Qualifier("enrollServiceImpl")
	private EnrollService service;
	
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService mService;
	
	@Autowired
	@Qualifier("courseServiceImpl")
	private CourseService cService;
	
	private EnrollVO vo = null;
	
	// 임시 페이지 -- 나중에 삭제
	@RequestMapping("/test.do")
	public String test() {
		
		return "/enroll/test";
		
	}
	
	// 본인 강의 구매내역
	@RequestMapping("/orderList.do")
	public String orderList(@ModelAttribute("pageObject") PageObject pageObject, Model model, HttpSession session) {
		
		log.info("강의 구매 내역 -----------------------------------------------");
		// 아이디 -- 세션에서 가져오기
		String id = ((MemberVO)session.getAttribute("login")).getId();
			
		// 내 강의 구매내역 실행
		model.addAttribute("list", service.orderList(id ,pageObject));
		// 내 강의 구매내역 페이지로 이동
		return "/enroll/orderList";
	}
	
	// 모든 회원 강의 구매내역 - 관리자
	@RequestMapping("/orderListAll.do")
	public String orderListAll(@ModelAttribute("pageObject") PageObject pageObject, Model model) {
		
		log.info("관리자 : 강의 구매 내역 -----------------------------------------------");
		
		// 모든회원 강의 구매내역 실행
		model.addAttribute("list", service.orderListAll(pageObject));
		// 모든회원 강의 구매내역 페이지로 이동
		return "/enroll/orderListAll";
		
	}
	
	// 강의 구매 상세내역
	@RequestMapping("/orderView.do")
	public String orderView(long eno, Model model, HttpSession session) {
		
		log.info("강의 구매 상세내역 -----------------------------------------------");
		// 필요한 정보 vo에 저장 - eno,id
		vo = new EnrollVO();
		String id = ((MemberVO)session.getAttribute("login")).getId();

		vo.setId(id);
		vo.setEno(eno);
		
		// 내 강의 구매 상세내역 실행 
		model.addAttribute("view", service.orderView(vo));
		// 내 강의 구매내역 페이지로 이동
		return "/enroll/orderView";
	}
	
	// 강의 구매 상세내역 - 방금 구매한 상세내역
	@RequestMapping("/viewDetail.do")
	public String viewDetail(Model model, HttpSession session) {
		
		log.info("방금 구매한 강의 구매 상세내역 -----------------------------------------------");
		// 필요한 정보 vo에 저장 - eno,id
		vo = new EnrollVO();
		String id = ((MemberVO)session.getAttribute("login")).getId();
		
		vo.setId(id);
		
		// 내 강의 구매 상세내역 실행 
		model.addAttribute("view", service.viewDetail(vo));
		// 내 강의 구매내역 페이지로 이동
		return "/enroll/orderView";
	}
	
	// 수강 목록
	@RequestMapping("/enrollList.do")
	public String enrollList(@ModelAttribute("pageObject") PageObject pageObject, Model model, HttpSession session) {
		log.info("수강 목록 -----------------------------------------------");
		pageObject.setPerPageNum(9);
		
		log.info(pageObject);
		// 세션에서 아이디 가져오기
		String id = ((MemberVO)session.getAttribute("login")).getId();
		// 내 수강목록 실행
		model.addAttribute("list", service.enrollList(id, pageObject));
		// 내 수강목록 페이지로 이동
		return "/enroll/enrollList";
	}
	
	// 수강 결제 페이지
	@GetMapping("/enroll.do")
	public String enrollForm(Model model, HttpSession session, long no) {
		log.info("수강 결제 페이지 -----------------------------------------------");
		// 아이디 가져오기
		String id = ((MemberVO)session.getAttribute("login")).getId();
		// 해당 강의 정보 가져오기
		model.addAttribute("course", cService.view(no));
		// 해당 회원 결제 정보 가져오기
		model.addAttribute("member", mService.userView(id));
		// 수강 결제 페이지로 이동
		return "/enroll/enroll";
	}
	
	// 수강 결제 처리
	@PostMapping("/enroll.do")
	public String enroll(EnrollVO vo, Model model, HttpSession session) {
		log.info("수강 결제 처리 -----------------------------------------------");
		String id = ((MemberVO)session.getAttribute("login")).getId();
		vo.setId(id);

		// 수강 결제 처리
		service.enroll(vo);
		
		return "/enroll/enrollSuccess";
	}
	
	// 수강 취소
	@PostMapping("/delete.do")
	public String delete(EnrollVO vo,RedirectAttributes rttr, HttpSession session) {
		log.info("수강 결제 취소 -----------------------------------------------");
		
		String id = ((MemberVO)session.getAttribute("login")).getId();
		vo.setId(id);
		// 수강 결제 취소 실행
		service.deleteEnroll(vo);
		// 메시지 출력
		rttr.addFlashAttribute("msg", "정상적으로 취소되었습니다.");
		// 결제 취소 후 내 결제 목록으로 이동
		return "redirect:/enroll/orderList.do";
	}
	

}
