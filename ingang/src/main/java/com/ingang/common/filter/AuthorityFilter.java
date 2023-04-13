package com.ingang.common.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ingang.member.vo.MemberVO;

@WebFilter("/AuthorityFilter")
public class AuthorityFilter implements Filter {
     
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Map<String, Integer> authMap = new HashMap<>();
	
	/**
   * @see HttpFilter#HttpFilter()
   */
  public AuthorityFilter() {
      super();
      // TODO Auto-generated constructor stub
  }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String uri = req.getRequestURI();
		System.out.println("AuthorityFilter.doFilter().uri - " + uri);
		
		Integer pageGradeNo = authMap.get(uri);
		
		System.out.println("AuthorityFilter.doFilter() - 처리 전 권한처리");
		
		// authMap 안에 uri 데이터가 있는지 확인
		if(pageGradeNo != null) { // authMap 안에 uri 있으므로 권한 처리
			HttpSession session = req.getSession();
			
			MemberVO vo = (MemberVO) session.getAttribute("login");
			
			// 로그인 확인
			if(vo == null) { // 로그인 안되어 있음
				// 오류처리 - 로그인 에러 페이지 이동
				res.sendRedirect("/error/loginError.do");
				return;
			}
			
			// 로그인이 된 경우 관리자 권한 처리
			if(pageGradeNo == 9 && vo.getGradeNo() != 9) {
				// 오류처리 - 권한 에러 페이지 이동
				res.sendRedirect("/error/authError.do");
				return;
			}
			
		} // end fo if

		// pass the request along the filter chain
		chain.doFilter(request, response);
		
		System.out.println("AuthorityFilter.doFilter() - 처리 후 권한처리");
	}

	

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("AuthorityFilter.init() 실행 - 권한에 대한 정보 저장");
		
		// 회원관리 권한 
		authMap.put("/member/logout.do", 1);
		authMap.put("/member/myMenu.do", 1);
		authMap.put("/member/findPwForm.do", 1);
		authMap.put("/member/userView.do", 1);
		authMap.put("/member/userList.do", 9);
		authMap.put("/member/mentoPList.do", 9);
		
		// 강의결제 권한
		authMap.put("/enroll/enroll.do", 1);
		authMap.put("/enroll/enrollList.do", 1);
		authMap.put("/enroll/enrollSuccess.do", 1);
		authMap.put("/enroll/orderList.do", 1);
		authMap.put("/enroll/orderListAll.do", 9);
		authMap.put("/enroll/orderView.do", 1);
		
		
	}

}
