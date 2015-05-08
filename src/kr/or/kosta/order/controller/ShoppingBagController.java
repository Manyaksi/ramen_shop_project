package kr.or.kosta.order.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.common.controller.Controller;
import kr.or.kosta.common.controller.ModelAndView;
import kr.or.kosta.order.domain.Cart;
import kr.or.kosta.order.service.OrderService;

/**
 * /product/view_product 요청에 대한 세부 컨트롤러
 * @author 김순재
 *
 */
public class ShoppingBagController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : ShoppingBagController 실행...");
		ModelAndView mav = new ModelAndView();
		
		int product_number = Integer.parseInt(request.getParameter("product_number"));
		int product_count = Integer.parseInt(request.getParameter("shopping_count"));
		
		//int product_num = Integer.parseInt(request.getParameter("product_num"));
		//System.out.println("내가 찍은"+product_num);
		
		OrderService orderService = OrderService.getInstance();
		Cart cart = new Cart();
		cart.setId(request.getParameter("id"));
		cart.setProduct_number(Integer.parseInt(request.getParameter("product_number")));
		cart.setShopping_count(Integer.parseInt(request.getParameter("shopping_count")));
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie2 : cookies) {
			System.out.println(cookie2.getName());
		}
		
		
		orderService.addCart(cart);
		
		mav.addObject("cart", cart);
		
		mav.setView("/product/view_product.mall?product_number="+product_number);
		return mav;
	}

}









