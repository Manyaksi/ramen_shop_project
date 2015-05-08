package kr.or.kosta.board.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.board.domain.Qna;
import kr.or.kosta.board.domain.Review;
import kr.or.kosta.board.service.BoardService;
import kr.or.kosta.common.controller.Controller;
import kr.or.kosta.common.controller.ModelAndView;

/**
 * /product/view_product 요청에 대한 세부 컨트롤러
 * @author 김순재
 *
 */
public class QnaReadController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : ProductController 실행...");
		ModelAndView mav = new ModelAndView();
		
		int list_number = Integer.parseInt(request.getParameter("list_number")); 
		
		BoardService boardService = BoardService.getInstance();
		boardService.hitcount(list_number);
		Qna qna = boardService.readQna(list_number);
		
		mav.addObject("readqna", qna);
		
		mav.setView("/mypage/mypage5.jsp");
		return mav;
	}

}









