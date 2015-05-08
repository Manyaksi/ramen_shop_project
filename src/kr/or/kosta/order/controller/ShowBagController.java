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
import kr.or.kosta.product.domain.Product;
import kr.or.kosta.product.service.ProductListService;

/**
 * /product/view_product ��û�� ���� ���� ��Ʈ�ѷ�
 * @author �����
 *
 */
public class ShowBagController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : ShoppingBagController ����...");
		ModelAndView mav = new ModelAndView();
		String id = null;
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie2 : cookies) {
			if(cookie2.getName().equals("loginId")){
				id = cookie2.getValue();
			}
		}
		
		//id = request.getParameter("id");
		
		OrderService orderService = OrderService.getInstance();
		
		List<Cart> carts = orderService.showCart(id);
		
//		List<Cart>orderService.addCart(cart);
		
		mav.addObject("carts", carts);

		//mav.setView("/checkout/checkout.jsp");
		mav.setView("/cart/cart.jsp");
		return mav;
	}

}









