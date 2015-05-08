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
import kr.or.kosta.order.service.OrderService;
import kr.or.kosta.product.domain.Product;
import kr.or.kosta.product.service.ProductListService;

/**
 * /product/view_product 요청에 대한 세부 컨트롤러
 * @author 김순재
 *
 */
public class CheckOutListController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : ShoppingBagController 실행...");
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
		
		Member member =  orderService.isMember(id);
	    
	    System.out.println(member.getAddress());
	    String address= member.getAddress();
	    String[] addressTokens = address.split("\\^");
	    System.out.println(addressTokens[0]);
	    System.out.println(addressTokens[1]);
	    System.out.println(addressTokens[2]);
	    System.out.println(addressTokens[3]);
	     
	    member.setPostcode1(addressTokens[0]);
	    member.setPostcode2(addressTokens[1]);
	    member.setAddress_1(addressTokens[2]);
	    member.setAddress_2(addressTokens[3]);
	     
	    System.out.println(member.getAddress_1());
	      
	    mav.addObject("member", member);
		mav.addObject("carts", carts);

		mav.setView("/checkout/checkout.jsp");
		//mav.setView("/cart/cart.jsp");
		return mav;
	}

}









