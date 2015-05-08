package kr.or.kosta.product.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.common.controller.Controller;
import kr.or.kosta.common.controller.ModelAndView;
import kr.or.kosta.product.domain.Product;
import kr.or.kosta.product.service.ProductListService;

/**
 *  /user/list 요청에 대한 세부 컨트롤러
 * @author 김민수
 *
 */
public class SearchController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : SearchController 실행...");
		ModelAndView mav = new ModelAndView();
		
		String type = request.getParameter("searchType");
		String value = request.getParameter("searchValue");
		
		
		ProductListService listService = ProductListService.getInstance();
		List<Product> typelist = null;
		
		if (type.equals("product_name") || type.equals("product_company")) {
			System.out.println("타입별 검색 진입");
			typelist = listService.searchProduct(type, value);
			
		} else if(type.equals("all")){
			System.out.println("전체검색 진입");
			typelist = listService.searchProductAll(value);
			
		}
		
		
		
		
		mav.addObject("typelist", typelist);
		
		mav.setView("/product/product.jsp");
		return mav;
	}

}









