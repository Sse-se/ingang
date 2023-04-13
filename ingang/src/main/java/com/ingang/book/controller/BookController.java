package com.ingang.book.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ingang.book.service.BookService;
import com.ingang.book.vo.BookVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/book")
@Log4j
public class BookController {
	
	String modul = "book";
	String path = "/upload/bookfile";

	@Autowired
	@Qualifier("bookServiceImpl")
	private BookService service;
	
	// 교재 리스트
	@RequestMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject, Model model) {
		
		log.info("교재 리스트........................");
		pageObject.setPerPageNum(8);
		
		model.addAttribute("list", service.list(pageObject));
		
		return modul + "/list";
	}
	
	// 교재 상세 보기
	@RequestMapping("/view.do")
	public String view(Long no, Model model,PageObject pageObject) {
		log.info("교재 상세보기 ...................");
		
		model.addAttribute("vo", service.view(no));
		model.addAttribute("vo1", service.clist(pageObject));
		
		return modul + "/view";
	}
	// 교재 등록 폼
	@GetMapping("/write.do")
	public String writeForm() {
		log.info("교재 등록 폼............................");
		return modul + "/write";
	}
	
	// 교재 등록 처리
	@PostMapping("/write.do")
	public String write(BookVO vo, RedirectAttributes rttr,	HttpServletRequest request) throws Exception {
		
		log.info("교재 등록 처리...............................");
		
		// 파일 저장 vo 객체에 저장 파일의 정보를 저장해 놓는다. 
		vo.setFileName(FileUtil.upload(path, vo.getImageFile(), request));
		
		log.info("vo = " + vo);
		// db에 저장
		service.write(vo);
		
		rttr.addFlashAttribute("msg", "교재 등록이 되었습니다.");
		return "redirect:list.do";
	}
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) {
		log.info("교재 수정 폼............................");

		model.addAttribute("vo", service.view(no));
		
		return modul + "/update";
	}
	// 텍스트만 수정
	@PostMapping("/update.do")
	public String update(BookVO vo, PageObject pageObject,RedirectAttributes rttr) {
		log.info("교재 수정 처리...........................");
	
		service.update(vo);
		
		rttr.addFlashAttribute("msg", "교재 수정이 완료되었습니다.");
		
		return "redirect:view.do?no="+vo.getBookNo()
			+"&page="+pageObject.getPage()
			+"&perPageNum="+pageObject.getPerPageNum()
			+"&key="+pageObject.getKey()
			+"&word=" + pageObject.getWord();
	}
//	// 이미지 수정
	@PostMapping("/updateImage.do")
	public String updateImage(BookVO vo,PageObject pageObject, HttpServletRequest request)throws Exception{
		
		log.info("이미지 수정 처리");
		// 서버에 파일 업로드
		vo.setFileName(FileUtil.upload(path, vo.getImageFile(), request));
		// DB에 수정
		service.updateImage(vo);
		// 원래의 파일은 지운다.
		FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteName(), request));
		
		return "redirect:view.do?no="+vo.getBookNo()
			+"&page="+pageObject.getPage()
			+"&perPageNum="+pageObject.getPerPageNum()
			+"&key="+pageObject.getKey()
			+"&word=" + pageObject.getWord();
	}
	@RequestMapping("/delete.do")
	public String delete(long no,Model model, BookVO vo, PageObject pageObject,RedirectAttributes rttr) {
		log.info("교재 품절 처리...........................");
		model.addAttribute("vo", service.view(no));
		rttr.addFlashAttribute("msg", "교재 품절 처리가 완료되었습니다.");
		service.delete(no);
		
		return "redirect:list.do";
	}
	
}// end of BookController
