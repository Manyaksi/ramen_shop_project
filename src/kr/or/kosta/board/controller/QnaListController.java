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
public class QnaListController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : QnaListController ����...");
		ModelAndView mav = new ModelAndView();
		
		
		BoardService boardService = BoardService.getInstance(); 
		List<Qna> qnaList= boardService.qnaList(); 
		
		for (Qna qna : qnaList) {
			System.out.println(qna);
		}
		
		mav.addObject("qnaList", qnaList);
		
		mav.setView("/mypage/mypage3.jsp");
		return mav;
	}

}









