package kr.or.kosta.member.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.common.controller.Controller;
import kr.or.kosta.common.controller.ModelAndView;
import kr.or.kosta.member.domain.Member;
import kr.or.kosta.member.service.MemberService;

/**
 *  /user/list 요청에 대한 세부 컨트롤러
 * @author 김민수
 *
 */
public class ModifyMemberController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : ModifyMemberController 실행...");
		ModelAndView mav = new ModelAndView();
		
		MemberService memberService = MemberService.getInstance();
		
		
		
		
		String postcode1 = request.getParameter("postcode1");
		String postcode2 =request.getParameter("postcode2");
		String add =request.getParameter("address");
		String detail = request.getParameter("detail");
		
		String passwd = request.getParameter("passwd");
		
		String address =postcode1+"^"+postcode2+"^"+add+"^"+detail; 
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		
		
		memberService.modify(address, email, phonenumber, id, passwd);
		
		
		
		mav.setView("/mypage/modify.mall");
		return mav;
	}

}









