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
public class LogoutController implements Controller {

	   @Override
	   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
	      ModelAndView mav = new ModelAndView();
	      
	      System.out.println("LogoutController 진입");
	      
	      MemberService memberService = MemberService.getInstance();
	      Cookie[] cookies = request.getCookies();
	      
	      if(cookies != null){
	         for (Cookie cookie : cookies) {
	            String name = cookie.getName();
	            if (name.equals("loginId")) {
	               cookie.setMaxAge(0);
	               cookie.setPath("/");
	               response.addCookie(cookie);
	            }
	         }
	      }
	      
	      mav.setView("redirect:/main.mall");
	      return mav;
	      
	   }

	}











