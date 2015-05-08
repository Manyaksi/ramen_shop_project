package kr.or.kosta.common.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * View ���� �� ����
 * @author �����
 *
 */
public class JSPViewResolver implements ViewResolver{
	
	public void execute(HttpServletRequest request, HttpServletResponse response, String uri) throws ServletException, IOException{
		RequestDispatcher dispatcher = null;
		dispatcher = request.getRequestDispatcher(uri);
		dispatcher.forward(request, response);
	}
}