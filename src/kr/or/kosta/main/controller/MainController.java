package kr.or.kosta.main.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.common.controller.Controller;
import kr.or.kosta.common.controller.ModelAndView;
import kr.or.kosta.product.domain.Product;
import kr.or.kosta.product.service.ProductListService;

/**
 *  /hello 요청에 대한 세부 컨트롤러
 * @author 김민수
 *
 */
public class MainController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : MainController 실행...");
		ModelAndView mav = new ModelAndView();
		
		ProductListService mainRank = ProductListService.getInstance();
		List<Product> ranklist = mainRank.getRank();
		List<Product> newlist = mainRank.getNew();
		
		mav.addObject("mainlist", ranklist);
		mav.addObject("newlist", newlist);
		
		
		mav.setView("/main.jsp");
		return mav;
	}

}









