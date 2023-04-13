package com.ingang.course.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ingang.coReview.service.CoReviewService;
import com.ingang.coReview.vo.CoReviewVO;
import com.ingang.course.service.CourseService;
import com.ingang.course.vo.CourseVO;
import com.ingang.member.vo.MemberVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/course")
@Log4j
public class CourseController {
	
	String modul = "course";
	String path = "/upload/course";
	
	@Autowired
	@Qualifier("courseServiceImpl")
	private CourseService service;
	
	@Autowired
	@Qualifier("coReivewServiceImpl")
	private CoReviewService rservice;
	
	// 날짜 형 변환
    @InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }

	// 리스트
	@RequestMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject, Model model) {
		
		log.info("강의 리스트 ===================================="); 
		
		// 한페이지에 보여질 강의 개수()
		pageObject.setPerPageNum(8);
		
		model.addAttribute("list", service.list(pageObject));
		
		return modul + "/list";
	}
	
	// 보기
	@RequestMapping("/view.do")
	public String view(long no, Model model, HttpSession session) {
		
		log.info("강의 보기 ===================================="); 
		String id = null;
		if((MemberVO)session.getAttribute("login") != null)
		 id = ((MemberVO)session.getAttribute("login")).getId();
		
		model.addAttribute("vo", service.view(no));
		
		if(id !=null) {
			CoReviewVO vo = new CoReviewVO();
			vo.setId(id);
			vo.setNo(no);
			model.addAttribute("pno", rservice.selectPno(vo));
		} else {
			model.addAttribute("pno", 0);
		}
		
		return modul + "/view";
	}
	
	// 등록
	@GetMapping("/write.do")
	public String writeForm() {
		
		log.info("강의 등록 폼 ===================================="); 
		
		return modul + "/write";
	}
	
	@PostMapping("/write.do")
	public String write(CourseVO vo, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		
		log.info("강의 등록 처리 ===================================="); 
		
		vo.setImage(FileUtil.upload(path, vo.getImageM(), request));
		
		log.info(vo);
		
		service.write(vo);
		
		
		rttr.addFlashAttribute("msg", "강의 등록이 완료 되었습니다.");
		
		// 시간을 딜레이시키는 처리를 한다.
		Thread.sleep(500);
		
		return "redirect:list.do";
	}
	
	// 수정
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) {
		
		log.info("강의 수정 폼 ===================================="); 
		model.addAttribute("vo", service.view(no));
		
		return modul + "/update";
	}
	
	@PostMapping("/update.do")
	public String update(CourseVO vo, RedirectAttributes rttr, HttpServletRequest request, PageObject pageObject) throws Exception {
		
		log.info("강의 수정 처리 ====================================");
		// 이미지
		vo.setImage(FileUtil.upload(path, vo.getImageM(), request));
		// DB update
		service.update(vo);
		// remove
		FileUtil.remove(FileUtil.getRealPath("", vo.getImageR(), request));
		
		rttr.addFlashAttribute("msg", "강의 수정이 완료 되었습니다.");
		
		return "redirect:view.do?no="+vo.getNo()
				+"&page="+pageObject.getPage()
				+"&perPageNum="+pageObject.getPerPageNum()
				+"&key="+pageObject.getKey()
				+"&word=" + pageObject.getWord()
				;
	}
	
	// 삭제
	@GetMapping("/delete.do")
	public String delete(long no, Model model, CourseVO vo, PageObject pageObject, RedirectAttributes rttr) {
		
		log.info("강의 삭제 처리 ====================================");
		model.addAttribute("vo", service.view(no));
		rttr.addFlashAttribute("msg", "강의 삭제 처리가 완료되었습니다.");
		service.delete(no);
		
		return "redirect:list.do";
	}
	
} // end of CourseController
