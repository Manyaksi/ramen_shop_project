package kr.or.kosta.common.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/** ��� ���� ��Ʈ�ѷ� ������Ʈ�鿡 ���� ����޼ҵ� �Ծ� ���� */
public interface Controller {
	/** ���� �Ծ� �޼ҵ� */
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException;
}