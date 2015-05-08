package kr.or.kosta.test.man;

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
public class GroupAllListController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : GroupAllListController 실행...");
		ModelAndView mav = new ModelAndView();
		
		String type = request.getParameter("division");
		
		System.out.println(type);
		
		ProductListService listService = ProductListService.getInstance();
		List<Product> typelist = listService.typeAllList(type);
		
		mav.addObject("typelist", typelist);
		
		mav.setView("/product/product.jsp");
		return mav;
	}

}









