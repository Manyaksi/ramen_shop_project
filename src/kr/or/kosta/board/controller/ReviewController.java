package kr.or.kosta.board.controller;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.board.domain.Review;
import kr.or.kosta.board.service.BoardService;
import kr.or.kosta.common.controller.Controller;
import kr.or.kosta.common.controller.ModelAndView;
import kr.or.kosta.member.domain.Member;
import kr.or.kosta.member.service.MemberService;

/**
 *  /user/list 요청에 대한 세부 컨트롤러
 * @author 김민수
 *
 */
public class ReviewController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : ReviewController 실행...");
		ModelAndView mav = new ModelAndView();
		
		BoardService boardService = BoardService.getInstance();
		
		
		String id = request.getParameter("id");
		int review_satisfy =Integer.parseInt(request.getParameter("score"));
		String content = request.getParameter("content");
		int product_number =Integer.parseInt(request.getParameter("product_number"));
		
		
		System.out.println("프로"+request.getParameter("product_number"));
		System.out.println("star"+review_satisfy);
		System.out.println("content"+content);
		
		
	     System.out.println("아이디"+id);
		
		Review review = new Review();
		review.setId(id);
		review.setReview_satisfy(review_satisfy);
		review.setReview_content(content);
		review.setProduct_number(product_number);
		
		boardService.addReview(review);
		
		
		
		mav.addObject("review", review);
		
		mav.setView("/product/view_product.mall?product_number="+product_number);
		return mav;
	}

}









