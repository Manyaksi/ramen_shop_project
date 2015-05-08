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
public interface ViewResolver{
	public void execute(HttpServletRequest request, HttpServletResponse response, String uri) throws ServletException, IOException;
}
