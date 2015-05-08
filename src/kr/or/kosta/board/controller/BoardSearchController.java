package kr.or.kosta.board.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.board.domain.Qna;
import kr.or.kosta.board.service.BoardService;
import kr.or.kosta.common.controller.Controller;
import kr.or.kosta.common.controller.ModelAndView;
import kr.or.kosta.product.domain.Product;
import kr.or.kosta.product.service.ProductListService;

/**
 *  /user/list ��û�� ���� ���� ��Ʈ�ѷ�
 * @author ��μ�
 *
 */
public class BoardSearchController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : BoardSearchController ����...");
		ModelAndView mav = new ModelAndView();
		
		
		BoardService boardService = BoardService.getInstance(); 
		List<Qna> qnaList= null;
		
		String type = request.getParameter("searchType");
		String value = request.getParameter("searchValue");
		
		System.out.println(type);
		System.out.println(value);
		
		if (type.equals("all")) {
			System.out.println("Ÿ�Ժ� �˻� ����");
			qnaList = boardService.searchProductAll(value);
			
		} else {
			System.out.println("��ü�˻� ����");
			qnaList = boardService.searchProduct(type, value);
			
		}
		
		
		mav.addObject("qnaList", qnaList);
		
		mav.setView("/mypage/mypage3.jsp");
		return mav;
	}

}









