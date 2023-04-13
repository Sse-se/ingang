package com.ingang.cartOrder.controller;


import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ingang.cart.vo.CartVO;
import com.ingang.cartOrder.service.CartOderService;
import com.ingang.cartOrder.vo.CartOrderVO;
import com.ingang.member.service.MemberService;
import com.ingang.member.vo.MemberVO;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cartOrder")
@Log4j
public class CartOderController {
	
	

    @Autowired
    @Qualifier("cartOrderServiceImpl")
    private CartOderService service;
    @Autowired
    @Qualifier("memberServiceImpl")
    private MemberService mservice;
    

    @GetMapping("/cartOrder.do")
    public Object cartOrderForm(HttpSession session, Model model,@RequestParam long[] cartNoList) {
        // cartNo[]는 선택된 장바구니 상품 번호 배열입니다.
    	log.info("cartOrder ----------------------------------------------------");
    	
    	
    	
    	MemberVO mvo = (MemberVO)session.getAttribute("login");
    	String id = mvo.getId();
    	
    	log.info(id);
    	
    	CartVO vo = new CartVO();
    	vo.setCartNoList(cartNoList);
    	vo.setId(id);
    	log.info(vo);

    	
        // 선택한 상품 정보를 DB에서 조회하는 기능을 구현하여 VO에 저장하고,
        // model.addAttribute() 메소드를 사용하여 뷰에 전달합니다.
        
       
        model.addAttribute("cart", service.getCartList(vo));
        model.addAttribute("member", mservice.userView(id));

        // 뷰 경로를 반환합니다.
        return "cart/cartOrder";
    }

    @PostMapping("/cartOrder.do")
    public String cartOrder(CartOrderVO vo, HttpSession session, RedirectAttributes rttr) {
        log.info("장바구니 구매 처리................................");

        
        // 구매 정보들을 저장하는 list
        

        // session에서 id를 가져와서 VO에 설정합니다.
        MemberVO member = (MemberVO) session.getAttribute("login");
        
        if(member != null) {
        vo.setId(member.getId());
        }else {
        	log.info("로그인이 하세요.");
        }
        
        log.info(vo);
        log.info(vo.getCartNoList());
        
        if (vo.getBookNoList() != null) {

        	service.bookCartOrder(vo);
        	log.info("교재 주문 처리중...............");
        	service.bookCartOrderDetail(vo);
        	log.info("교재 상세주문 처리중...............");
			
		}
        
        if (vo.getNoList() != null) {
					
        	log.info(vo.getTitleList()[0]);
        	log.info((vo.getTitleList()).length);
        	vo.setCourseTitle((vo.getTitleList())[0]+"외 "+(vo.getTitleList().length -1));
			
			service.courseCartOrder(vo);
			log.info("강의 주문 처리중...............");
			service.courseCartOrderDetail(vo);
			log.info("강의 상세주문 처리중...............");
		}
        
        
        log.info("구매후 장바구니 삭제 처리 ........................");
        service.orderDelCart(vo);
        
        // 구매 완료 메시지를 설정하여 rttr에 추가합니다.
        rttr.addFlashAttribute("msg", "주문이 완료되었습니다.");

        // 뷰 경로를 반환합니다.
        return "redirect:/";
    }
    

}
