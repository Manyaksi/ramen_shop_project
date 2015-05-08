package kr.or.kosta.member.controller;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.common.controller.Controller;
import kr.or.kosta.common.controller.ModelAndView;
import kr.or.kosta.member.domain.Member;
import kr.or.kosta.member.service.MemberService;

/**
 *  /user/list ��û�� ���� ���� ��Ʈ�ѷ�
 * @author ��μ�
 *
 */
public class LoginController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : LoginController ����...");
		ModelAndView mav = new ModelAndView();
		
		MemberService memberService = MemberService.getInstance();
		
		
		String id = request.getParameter("id");

		Member member =  memberService.isMember(id);
		
		System.out.println(member.getId());
		
		if(member != null){
			System.out.println("���� : "+member.getId());
			Cookie loginCookie = new Cookie("loginId", member.getId());
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
			System.out.println(loginCookie.getName());
			System.out.println(loginCookie.getValue());
			
		}
		
		
		mav.setView("redirect:/index.jsp");
		return mav;
	}

}









