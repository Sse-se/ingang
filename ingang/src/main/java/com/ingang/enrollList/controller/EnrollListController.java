package com.ingang.enrollList.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ingang.enrollList.service.EnrollListService;
import com.ingang.member.vo.MemberVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/enrollList")
@Log4j
public class EnrollListController {
	
	@Autowired
	@Qualifier("enrollListServiceImpl")
	private EnrollListService service;
	
	@GetMapping(value="/list.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<Map<String, Object>> list(PageObject pageObject, HttpSession session){
		pageObject.setPerPageNum(9);
		log.info("pageObject : "+pageObject);
		
		String id = null;
		id = ((MemberVO)session.getAttribute("login")).getId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", service.list(pageObject, id));
		map.put("pageObject", pageObject);
		
		log.info("list : "+map.get("list"));
		log.info("pageObject : "+map.get("pageObject"));
		
		return new ResponseEntity<Map<String, Object>> (map, HttpStatus.OK);
	}

}
