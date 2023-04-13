package com.ingang.cart.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ingang.cart.service.CartService;
import com.ingang.cart.vo.CartVO;
import com.ingang.member.service.MailSendService;
import com.ingang.member.service.MemberService;
import com.ingang.member.vo.MemberVO;
import com.webjjang.util.PageObject;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart")
@Log4j
public class CartController {
	
	String modul = "cart";
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService service;
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService mservice;
	String id = null;
	@GetMapping("/list.do")
	public String list(Model model, HttpSession session){
		
		// session에서 로그인한 사용자의 ID 가져오기
		
		MemberVO vo1= (MemberVO) session.getAttribute("login");
		id = vo1.getId();
		 System.out.println(id);
				
		
		log.info("cart 리스트 ................................");
		model.addAttribute("list", service.list(id));
		model.addAttribute("member", mservice.userView(id));
		log.info(mservice.userView(id));
	
		return modul + "/list";
		
		
		
		
	}
	
	 
	

	@PostMapping(value = "/update.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public  ResponseEntity<String>update(CartVO vo,  HttpSession session) {
		
//		int result = service.update(vo);
//	    System.out.println("1111111111111111111111111111111111111");
//	    if(result == 1)
//	    	return new ResponseEntity<String>("정상적으로 수정 되었습니다.", HttpStatus.OK);
//	    
		try {
			int result = service.update(vo);
			if(result == 1)
			return new ResponseEntity<String>("1" , HttpStatus.OK);
			else
				return new ResponseEntity<String>("2" , HttpStatus.OK);
		} catch (Exception e) {
//			 TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	    	
	    
	}
	
	@PostMapping(value = "/delete.do", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> delete(long cartNo) {

		try {
			int result = service.delete(cartNo);
			if(result == 1)
			return new ResponseEntity<String>("10" , HttpStatus.OK);
			else
				return new ResponseEntity<String>("20" , HttpStatus.OK);
		} catch (Exception e) {
//			 TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
	}

	@PostMapping(value = "/deleteAll.do", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> deleteAll(HttpSession session) {
		
		MemberVO vo1 = (MemberVO)session.getAttribute("login");
		
		id = vo1.getId();
		
		try {
			int result = service.deleteAll(id);
			if(result == 1)
				return new ResponseEntity<String>("1" , HttpStatus.OK);
			else
				return new ResponseEntity<String>("2" , HttpStatus.OK);
		} catch (Exception e) {
//			 TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
	}
	
	
	@PostMapping(value = "/addCart.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<String> addCart(CartVO vo, HttpSession session) {
		//vo.setId((String) session.getAttribute("id"));
	//vo.setId((LoginVO)session.getAttribute("login"));
			 MemberVO vo1 = (MemberVO)session.getAttribute("login");
			 vo.setId(vo1.getId());
		try {
			Integer result = service.addCart(vo);
			if(result == 1)
			return new ResponseEntity<String>("100" , HttpStatus.OK);
			else
				return new ResponseEntity<String>("200" , HttpStatus.OK);
		} catch (Exception e) {
//			 TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
	}
	
	@RequestMapping("/searchBook.do")
	@ResponseBody
	public Map<Object, Object> searchBook(@RequestBody long bookNo ,HttpSession session) {
		System.out.println("serchBook");
		
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		MemberVO vo1= (MemberVO) session.getAttribute("login");
		String id = vo1.getId();
		count = service.searchBook(bookNo, id);
		
		
		log.info(count);
		
		System.out.println(count);
		map.put("cnt", count);

		return map;
	}
	
	@RequestMapping("/searchCourse.do")
	@ResponseBody
	public Map<Object, Object> searchCourse(@RequestBody long no ,HttpSession session) {
		System.out.println("serchBook");
		
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		MemberVO vo1= (MemberVO) session.getAttribute("login");
		String id = vo1.getId();
		count = service.searchCourse(no, id);
		
		
		log.info(count);
		
		System.out.println(count);
		map.put("cnt", count);
		
		return map;
	}
	
	
	@PostMapping(value = "/overLabBookInc.do", consumes = "application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public  ResponseEntity<String>overLabBookInc(@RequestBody CartVO vo ,HttpSession session) {
//		@RequestParam(required = false) long bookNo ,@RequestParam long quantity 
		log.info("overLabBookInc.................................");
		log.info(vo);
		
	    MemberVO vo1= (MemberVO) session.getAttribute("login");
		vo.setId(vo1.getId());
		try {
			Integer result = service.overLabBookInc(vo);
			if(result == 1)
			return new ResponseEntity<String>("1" , HttpStatus.OK);
			else
				return new ResponseEntity<String>("2" , HttpStatus.OK);
		} catch (Exception e) {
//			 TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	    	
	    
	}
	
	
	


	
	
		



}






	
	


