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
 *  /user/list 요청에 대한 세부 컨트롤러
 * @author 김민수
 *
 */
public class ModifyController implements Controller {

	   @Override
	   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
	      ModelAndView mav = new ModelAndView();
	      
	      System.out.println("ModifyController 진입");
	      
	      MemberService memberService = MemberService.getInstance();
	      
	      Cookie[] cookies = request.getCookies();
	      String userId = null;
	      if(cookies != null){
	         for (Cookie cookie : cookies) {
	            String name = cookie.getName();
	            if (name.equals("loginId")) {
	            	userId = cookie.getValue();
	            }
	         }
	      }
	      
	     Member member =  memberService.isMember(userId);
	     
	     System.out.println(member.getAddress());
	     String address= member.getAddress();
	     String[] addressTokens = address.split("\\^");
	     
	     member.setPostcode1(addressTokens[0]);
	     member.setPostcode2(addressTokens[1]);
	     member.setAddress_1(addressTokens[2]);
	     member.setAddress_2(addressTokens[3]);
	     
	     System.out.println(member.getAddress_1());
	      
	     mav.addObject("member", member);
	      mav.setView("/mypage/mypage2.jsp");
	      return mav;
	      
	   }

	}











