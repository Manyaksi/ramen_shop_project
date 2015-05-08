/*package kr.or.kosta.member.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.common.controller.Controller;
import kr.or.kosta.common.controller.ModelAndView;
import kr.or.kosta.member.domain.User;
import kr.or.kosta.member.service.UserService;

*//**
 *  /user/list 요청에 대한 세부 컨트롤러
 * @author 김민수
 *
 *//*
public class UserListController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		System.out.println("[Debug] : HelloController 실행...");
		ModelAndView mav = new ModelAndView();
		
		UserService userService = UserService.getInstance();
		List<User> list = userService.getUsers();
		
		mav.addObject("list", list);
		
		mav.setView("/user/list.jsp");
		return mav;
	}

}









*/