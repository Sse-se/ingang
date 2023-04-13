package com.ingang.cart.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.ingang.cart.mapper.CartMapper;
import com.ingang.cart.vo.CartVO;
import com.webjjang.util.PageObject;
import lombok.Setter;

@Service
@Qualifier("cartServiceImpl")
public class CartServiceImpl implements CartService {

	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;
	
	@Override
	public List<CartVO> list(String id) {
		// TODO Auto-generated method stub
	
		
		
		return mapper.list(id);
	}
	
	


	@Override
	public int addCart(CartVO vo) {
		// TODO Auto-generated method stub
		return mapper.addCart(vo);
	}

	@Override
	public int update(CartVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(long cartNo) {
		// TODO Auto-generated method stub
		return mapper.delete(cartNo);
	}




	@Override
	public int searchBook(long bookNo, String id) {
		// TODO Auto-generated method stub
	Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("bookNo", bookNo);
			
		return mapper.searchBook(map);
	}




	@Override
	public int searchCourse(long no, String id) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("no", no);
			
		return mapper.searchCourse(map);
	}




	@Override
	public int overLabBookInc(CartVO vo) {
		// TODO Auto-generated method stub
		
		
		return mapper.overLabBookInc(vo);
	}




	@Override
	public int deleteAll(String id) {
		// TODO Auto-generated method stub
		return mapper.deleteAll(id);
	}

	

}
