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
 *  /user/list ��û�� ���� ���� ��Ʈ�ѷ�
 * @author ��μ�
 *
 */
public class SearchController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : SearchController ����...");
		ModelAndView mav = new ModelAndView();
		
		String type = request.getParameter("searchType");
		String value = request.getParameter("searchValue");
		
		
		ProductListService listService = ProductListService.getInstance();
		List<Product> typelist = null;
		
		if (type.equals("product_name") || type.equals("product_company")) {
			System.out.println("Ÿ�Ժ� �˻� ����");
			typelist = listService.searchProduct(type, value);
			
		} else if(type.equals("all")){
			System.out.println("��ü�˻� ����");
			typelist = listService.searchProductAll(value);
			
		}
		
		
		
		
		mav.addObject("typelist", typelist);
		
		mav.setView("/product/product.jsp");
		return mav;
	}

}









