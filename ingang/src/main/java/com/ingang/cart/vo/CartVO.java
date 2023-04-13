package com.ingang.cart.vo;



import lombok.Data;

@Data
public class CartVO {
	
		private long cartNo;
		private long[] cartNoList;
		private long piNo;
		private String image, id;
		private long bookNo, no;
		private String title, bookName;
		private long price, quantity;
		


}
