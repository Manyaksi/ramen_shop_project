package kr.or.kosta.member.controller;

import javax.servlet.ServletException;
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
public class RegistController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : registController ����...");
		ModelAndView mav = new ModelAndView();
		
		MemberService memberService = MemberService.getInstance();
		
		String yyyy= request.getParameter("yyyy");
		String mm = request.getParameter("mm");
		String dd = request.getParameter("dd");
		
		String birth = yyyy+"/"+mm+"/"+dd;
		
		System.out.println(yyyy+"/"+mm+"/"+dd);
		System.out.println(request.getParameter("id"));
		
		String postcode1 = request.getParameter("postcode1");
		String postcode2 =request.getParameter("postcode2");
		
		String add =request.getParameter("address");
		String detail = request.getParameter("detail");
		
		String address =postcode1+"^"+postcode2+"^"+add+"^"+detail; 
		Member member = new Member();
		member.setId(request.getParameter("id"));
		member.setAddress(address);
		member.setName(request.getParameter("name"));
		member.setPasswd(request.getParameter("passwd"));
		//member.setBirth(request.getParameter("birth"));
		member.setBirth(birth);
		member.setEmail(request.getParameter("email"));
		member.setPhonenumber(request.getParameter("phonenumber"));
		
		
		memberService.addMember(member);
		
		
		mav.addObject("member", member);
		
		mav.setView("/authentication/authentication.jsp");
		return mav;
	}

}









