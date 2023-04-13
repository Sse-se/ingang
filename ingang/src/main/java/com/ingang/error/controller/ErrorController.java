package com.ingang.error.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {
	

	@RequestMapping("loginError.do")
	public String loginError() {
		
		return "/error/loginError";
	}
	
	@RequestMapping("authError.do")
	public String authError() {
		
		return "/error/authError";
	}

}
