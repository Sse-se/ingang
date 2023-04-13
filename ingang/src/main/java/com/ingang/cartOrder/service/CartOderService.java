package com.ingang.cartOrder.service;

import java.util.List;

import com.ingang.cart.vo.CartVO;
import com.ingang.cartOrder.vo.CartOrderVO;



public interface CartOderService {
	
	public int bookCartOrder(CartOrderVO vo); // 먼저 시퀀스에서 글번호를 받아서 vo.no에 세팅하게 처리해 주게 한다. selectKey 태그 이용
	
	public int bookCartOrderDetail(CartOrderVO vo);
	
	public int courseCartOrder(CartOrderVO vo); // 먼저 시퀀스에서 글번호를 받아서 vo.no에 세팅하게 처리해 주게 한다. selectKey 태그 이용
	
	public int courseCartOrderDetail(CartOrderVO vo);

	public List<CartVO> getCartList(CartVO vo);
	
	public int orderDelCart(CartOrderVO vo);
	

	

}
