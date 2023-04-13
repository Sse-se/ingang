package com.ingang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ingang.book.service.BookService;
import com.ingang.course.service.CourseService;
import com.ingang.member.service.MemberService;
import com.ingang.member.vo.MemberVO;
import com.ingang.message.service.MessageService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	@Qualifier("courseServiceImpl")
	private CourseService cService;

	@Autowired
	@Qualifier("bookServiceImpl")
	private BookService bService;
	
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService mService;
	
	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageService messageservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		
		model.addAttribute("book", bService.mainList());
		model.addAttribute("course", cService.mainList());
		model.addAttribute("teacher", mService.teacherList());
	
			
		if((MemberVO)session.getAttribute("login") != null) {
			session.setAttribute("unreadCount", messageservice.allunreadcount(((MemberVO)session.getAttribute("login")).getId()));

		}
		
		return "main";
	}
	
}
