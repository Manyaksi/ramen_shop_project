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
public class PayAccountController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : PayAccountController 실행...");
		ModelAndView mav = new ModelAndView();
		String id = null;
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie2 : cookies) {
			if(cookie2.getName().equals("loginId")){
				id = cookie2.getValue();
			}
		}
		
		
		OrderService orderService = OrderService.getInstance();
		
		List<Cart> carts = orderService.showCart(id);
		
		//주문 내용 상세보기
		String order_name = request.getParameter("s_name");
		String order_phonenumber = request.getParameter("s_phonenumber");
		String postcode1 = request.getParameter("postcode1");
		String postcode2 = request.getParameter("postcode2");
		String s_address1 = request.getParameter("s_address1");
		String s_address2 = request.getParameter("s_address2");
		String address = "(" + postcode1 + "-" + postcode2 +") "+ s_address1 + " " + s_address2;
		String order_message = request.getParameter("s_message");
		String order_way = request.getParameter("group1");
		String order_deliveryway = request.getParameter("group2");
		int order_price = Integer.parseInt(request.getParameter("sumprice"));
		System.out.println(address);
		System.out.println(order_price);
		Order order = new Order(id, order_way, order_price, address, order_deliveryway, order_message, order_phonenumber, order_name);
		
		// Order 테이블 추가
		orderService.addOrder(order);
		
		System.out.println(carts.size());
		
		int order_number = orderService.selectOrderNumber(id);
		System.out.println(order_number);
		
		// OrderItem 테이블 추가
		int i = 1;
		for (Cart cart : carts) {
			orderService.addOrderItem(cart, i, order_number);
			i++;
		}
		
		orderService.deleteAllCart(id);

		mav.setView("/mypage/mypage.mall");
		//mav.setView("/cart/cart.jsp");
		return mav;
	}

}









