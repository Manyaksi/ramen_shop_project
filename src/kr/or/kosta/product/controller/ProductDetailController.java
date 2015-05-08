package kr.or.kosta.product.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.board.domain.Review;
import kr.or.kosta.common.controller.Controller;
import kr.or.kosta.common.controller.ModelAndView;
import kr.or.kosta.product.domain.Product;
import kr.or.kosta.product.service.ProductListService;

/**
 * /product/view_product 요청에 대한 세부 컨트롤러
 * @author 김순재
 *
 */
public class ProductDetailController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : ProductdetailController 실행...");
		ModelAndView mav = new ModelAndView();
		
		String product_num = request.getParameter("product_number");
		
		ProductListService listService = ProductListService.getInstance();
		Product detail = listService.showProduct(product_num);
		
		List<Review> reviewList = listService.getReviewList(Integer.parseInt(product_num));
		
		mav.addObject("detail", detail);
		mav.addObject("reviewList", reviewList);
		
		mav.setView("/product/view_product.jsp");
		return mav;
	}

}









