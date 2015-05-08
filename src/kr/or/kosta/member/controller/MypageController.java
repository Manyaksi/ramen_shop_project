package kr.or.kosta.member.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.common.controller.Controller;
import kr.or.kosta.common.controller.ModelAndView;
import kr.or.kosta.order.domain.OrderItem;
import kr.or.kosta.order.service.OrderService;

/**
 *  /user/list ��û�� ���� ���� ��Ʈ�ѷ�
 * @author ��μ�
 *
 */
public class MypageController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : MypageController ����...");
		ModelAndView mav = new ModelAndView();
		
		 Cookie[] cookies = request.getCookies();
	      String userId = null;
	      if(cookies != null){
	         for (Cookie cookie : cookies) {
	            String name = cookie.getName();
	            if (name.equals("loginId")) {
	            	userId = cookie.getValue();
	            }
	         }
	      }
		
		System.out.println(userId);
		
		OrderService orderService = OrderService.getInstance();
		List<OrderItem> orderlist = orderService.orderList(userId);
		
		
		
		mav.addObject("orderlist", orderlist);
		
		mav.setView("/mypage/mypage.jsp");
		return mav;
	}

}









