package kr.or.kosta.order.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.common.controller.Controller;
import kr.or.kosta.common.controller.ModelAndView;
import kr.or.kosta.order.domain.Cart;
import kr.or.kosta.order.service.OrderService;

/**
 * /product/view_product ��û�� ���� ���� ��Ʈ�ѷ�
 * @author �����
 *
 */
public class ShoppingBagUpdateController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : ShoppingBagUpdateController ����...");
		ModelAndView mav = new ModelAndView();
		
		
		OrderService orderService = OrderService.getInstance();
		Cart cart = new Cart();
		cart.setId(request.getParameter("id"));
		cart.setProduct_number(Integer.parseInt(request.getParameter("product_number")));
		cart.setShopping_count(Integer.parseInt(request.getParameter("quantity")));

		
		orderService.modifyCart(cart);
		
		mav.setView("/cart/showcart.mall");
		return mav;
	}

}









