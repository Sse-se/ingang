package com.ingang.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ingang.book.service.BookService;
import com.ingang.member.service.MemberService;
import com.ingang.member.vo.MemberVO;
import com.ingang.order.service.OrderService;
import com.ingang.order.vo.OrderVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/order")
@Log4j
public class OrderController {

	String modul = "order";

	@Autowired
	@Qualifier("orderServiceImpl")
	private OrderService service;
	
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService mService;
	
	@Autowired
	@Qualifier("bookServiceImpl")
	private BookService bService;
	
	private OrderVO vo = null;
	// 내 주문 목록 리스트
	@RequestMapping("/myList.do")
	public String myList(@ModelAttribute("pageObject") PageObject pageObject, Model model,HttpSession session) {
		log.info("주문 목록 리스트 ............................................");
		// 한 페이지당 10개의 주문목록 보여지게 세팅
		MemberVO mvo= (MemberVO) session.getAttribute("login");
		String id = mvo.getId();
		model.addAttribute("list", service.myList(id, pageObject));
		
		return modul + "/myList";
		
	}
	@RequestMapping("/list.do")
	public String list(@ModelAttribute("pageObject") PageObject pageObject, Model model) {
		log.info("주문 리스트 ............................................");
		// 한 페이지당 10개의 주문목록 보여지게 세팅
		
		model.addAttribute("list", service.list(pageObject));
		
		return modul + "/list";
		
	}
	// 주문 상세 보기
	@RequestMapping("/view.do")
	public String view(long ordNo, Model model, HttpSession session) {
		vo = new OrderVO();
		vo.setOrdNo(ordNo);
		model.addAttribute("vo", service.view(ordNo));
//		MemberVO mvo= (MemberVO) session.getAttribute("login");

		return modul + "/view";
	}
	//교재 구매하기 폼
	@GetMapping("/buy.do")
	public String buyForm(OrderVO vo, Model model,HttpSession session,Long no) {
		// 아이디 세팅
		System.out.println(vo);
		MemberVO mvo= (MemberVO) session.getAttribute("login");
		String id = mvo.getId();
		 System.out.println(id);
		model.addAttribute("vo",vo);
		// 교재 정보 가져오기
		model.addAttribute("book",bService.view(no));
		// 회원 결제 정보 가져오기
		model.addAttribute("member", mService.userView(id));
		return modul + "/buy";
	}
	// 교재 구매처리
	@PostMapping("/buy.do")
	public String buy(OrderVO vo, Model model,HttpSession session) {
		String id = ((MemberVO) session.getAttribute("login")).getId();
		vo.setId(id);
		System.out.println(vo);
		service.buy(vo);
		
		return "redirect:myList.do";
	}
	
	// 관리자용 배송상태수정 
	@PostMapping("/update.do")
	public String update(long ordNo, String dlvCondition) {
		vo = new OrderVO();
		vo.setOrdNo(ordNo);
		vo.setDlvCondition(dlvCondition);
		service.update(vo);
		
		return "redirect:list.do";
	}
	// 교재 목록 삭제
	@GetMapping("/delete.do")
	public String delete(long ordNo) {
		service.delete(ordNo);
		return "redirect:myList.do";
	}
	
}
