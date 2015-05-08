package kr.or.kosta.order.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.common.controller.Controller;
import kr.or.kosta.common.controller.ModelAndView;
import kr.or.kosta.member.domain.Member;
import kr.or.kosta.order.domain.Cart;
import kr.or.kosta.order.domain.Order;
import kr.or.kosta.order.service.OrderService;
import kr.or.kosta.product.domain.Product;
import kr.or.kosta.product.service.ProductListService;

/**
 * /product/view_product 요청에 대한 세부 컨트롤러
 * @author 김순재
 *
 */
public class TestController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : TestContrller 실행...");
		ModelAndView mav = new ModelAndView();
		
		Cookie[] cookies = request.getCookies();
	    String UserId = null;
	      if(cookies != null){
	         for (Cookie cookie : cookies) {
	            String name = cookie.getName();
	            if (name.equals("loginId")) {
	            	UserId = cookie.getValue();
	            }
	         }
	      }
		
		
		System.out.println("내가찍은"+request.getParameter("product_num"));
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		
		OrderService oderService = OrderService.getInstance();
		boolean iscart =  oderService.isCart(UserId, product_num);
		String existCart = null;
		if(iscart==false){
			existCart = "이미 장바구니에 해당 상품이 있습니다.";
		}else{
			existCart = "버튼을 눌러 장바구니에 상품을 담으세요.";
		}
		
		
		
		mav.addObject("existCart", existCart);
		mav.setView("/ajaxResult/iscart.jsp");
		return mav;
	}

}









