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
public class DuplicationController implements Controller {

	   @Override
	   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
	      ModelAndView mav = new ModelAndView();
	      
	      System.out.println("DuplicationController 진입");
	      
	      MemberService memberService = MemberService.getInstance();
	      
	      String data = request.getParameter("id");
	      String result = null;
	      
	      Member member = new Member();
	      member = memberService.isMember(data);
	      
	      if(member==null){
	    	  System.out.println("아이디 없");
	    	  result = "사용가능한 아이디 입니다.";
	      }else{
	    	  System.out.println("아이디 있.");
	    	  result = "동일한 아이디가 존재 합니다.";
	      }
	      
	      mav.addObject("result", result);
	      mav.setView("/ajaxResult/result.jsp");
	      return mav;
	      
	   }

	}











