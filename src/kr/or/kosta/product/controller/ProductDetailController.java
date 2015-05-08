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
 * /product/view_product ��û�� ���� ���� ��Ʈ�ѷ�
 * @author �����
 *
 */
public class ProductDetailController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : ProductdetailController ����...");
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









