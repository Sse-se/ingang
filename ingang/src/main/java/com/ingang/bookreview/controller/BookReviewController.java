package com.ingang.bookreview.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.URLEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ingang.bookreview.service.BookReviewService;
import com.ingang.bookreview.vo.BookReviewVO;
import com.ingang.member.vo.MemberVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/bookreview")
@Log4j
public class BookReviewController {

	@Autowired
	@Qualifier("bookReviewServiceImpl")
	private BookReviewService service;
	
	@GetMapping(value = "/list.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<Map<String, Object>> list(PageObject pageObject, long no, HttpSession session){
		log.info("리뷰 리스트");
		log.info("pageObject = " + pageObject + ", no = " + no );
		
		BookReviewVO vo = new BookReviewVO();
		if((MemberVO)session.getAttribute("login") != null) {
			vo.setId(((MemberVO)session.getAttribute("login")).getId());
		}
		
		vo.setNo(no);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", service.list(pageObject, vo));
		map.put("pageObject", pageObject);
		
		if((MemberVO)session.getAttribute("login") != null) {
			map.put("detailNo", service.checkDN(vo));
		}
		
		log.info("return map = " + map);
		
		return new ResponseEntity<Map<String,Object>> (map, HttpStatus.OK);
		
	}
	
	@PostMapping(value = "/write.do", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE+";charset=utf-8"})
//			produces = {"text/plain;charset=utf-8"})
	public ResponseEntity<String> write(@RequestBody BookReviewVO vo, HttpSession session) {
		
		log.info(MediaType.TEXT_PLAIN_VALUE);
		
		// session에서 id를 꺼내야 한다.
		vo.setId(((MemberVO)session.getAttribute("login")).getId());;
		
		log.info(vo);
		
		
		try {
			service.write(vo);
			// Contorller에서 encode와 JS에서 decode를 사용해서 처리를 해야 한글을 맞출 수 있다.
//			return new ResponseEntity<String>(URLEncoder.encode("리뷰가 정상적으로 등록되었습니다.", "utf-8"), HttpStatus.OK);
			return new ResponseEntity<String>("리뷰가 정상적으로 등록되었습니다.", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PostMapping(value = "/update.do", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE+";charset=utf-8"})
//			produces = {"text/plain;charset=utf-8"})
	public ResponseEntity<String> update(@RequestBody BookReviewVO vo, HttpSession session) {
		
		log.info(MediaType.TEXT_PLAIN_VALUE);
		
		vo.setId(((MemberVO)session.getAttribute("login")).getId());
		
		log.info(vo);
		
		
		try {
			int result = service.update(vo);
			if(result == 1)
				return new ResponseEntity<String>("리뷰가 정상적으로 수정되었습니다.", HttpStatus.OK);
			else
				return new ResponseEntity<String>("리뷰의 정보를 확인해 주세요. 새로고침해서 진행해 주세요.", 
						HttpStatus.INTERNAL_SERVER_ERROR);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@DeleteMapping(value = "/delete.do",
			produces = {MediaType.TEXT_PLAIN_VALUE+";charset=utf-8"})
//			produces = {"text/plain;charset=utf-8"})
	public ResponseEntity<String> delete(long rno) {
		
		log.info(rno);
		
		try {
			int result = service.delete(rno);
			if(result == 1)
				return new ResponseEntity<String>("리뷰가 정상적으로 삭제가 되었습니다.", HttpStatus.OK);
			else
				return new ResponseEntity<String>("리뷰의 정보를 확인해 주세요. 새로고침해서 진행해 주세요.", 
						HttpStatus.INTERNAL_SERVER_ERROR);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
