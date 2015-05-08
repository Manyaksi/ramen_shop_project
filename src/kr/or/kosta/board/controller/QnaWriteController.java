package kr.or.kosta.board.controller;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.board.domain.Qna;
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
public class QnaWriteController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : QnaWriteController 실행...");
		ModelAndView mav = new ModelAndView();
		
		BoardService boardService  = BoardService.getInstance();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = null;
		
		 Cookie[] cookies = request.getCookies();
	      
	      if(cookies != null){
	         for (Cookie cookie : cookies) {
	            String name = cookie.getName();
	            if (name.equals("loginId")) {
	            	id = cookie.getValue();
	            }
	         }
	      }
	      
	    Qna qna = new Qna();
	    qna.setList_title(title);
	    qna.setList_content(content);
	    qna.setId(id);
	    
	    boardService.addqna(qna);
		
		
		//mav.addObject("member", member);
		
		mav.setView("/mypage/qna.mall");
		return mav;
	}

}









