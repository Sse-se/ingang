package com.ingang.notice.controller;

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
import com.ingang.member.vo.MemberVO;
import com.ingang.notice.service.NoticeService;
import com.ingang.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice")
@Log4j
public class NoticeController {
	
	String modul = "notice";
	@Autowired
	@Qualifier("noticeServiceImpl")
	private NoticeService service;
	
	// 리스트
	@RequestMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject, Model model, HttpSession session) {
	    log.info("\n공지사항리스트....................................");
		
	    // 비회원, 회원일 경우 현재공지리스트로 관리자로그인시 전체리스트로
	    MemberVO loginVO =((MemberVO)session.getAttribute("login"));
		if(session.getAttribute("login") == null || loginVO.getGradeNo() == 1) {
			// 한페이지에 데이터는 6개
			pageObject.setPerPageNum(6);
			model.addAttribute("list",service.currentList(pageObject));
		} else if (loginVO.getGradeNo() == 9) {
			// 한페이지에 데이터는 6개
			pageObject.setPerPageNum(6);
			model.addAttribute("list", service.list(pageObject));
		}
	    return modul + "/list";
	}
	@RequestMapping("/view.do")
	public String view(long no, int inc, Model model) {
		log.info("\n공지사항 상세보기....................................");
		model.addAttribute("vo", service.view(no, inc));
		return modul +"/view";
	}
	@GetMapping("/write.do")
	public String writeForm() {
		log.info("공지사항 글쓰기 폼..................................");
		return modul + "/write";
	}
	@PostMapping("/write.do")
	public String write(NoticeVO vo) {
		log.info("\n공지사항 글쓰기 처리 ...............................");
		service.write(vo);
		log.info("vo=" + vo);
		return "redirect:list.do";
	}
	
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) {
		log.info("\n공지사항 글수정 폼 ...............................");
		model.addAttribute("vo", service.view(no, 0));
		return "board/update";
	}
	
	@PostMapping("/update.do")
	public String update(NoticeVO vo) {
		log.info("\n공지사항 글수정 처리 ...............................");
		service.update(vo);

		return "redirect:view.do?no="+vo.getNo()+"&inc=0";
	}
	@GetMapping("/delete.do")
	public String delete(long no) {
		log.info("\n공지사항 글삭제 처리............................");
		service.delete(no);
		return "redirect:list.do";
	}
}
