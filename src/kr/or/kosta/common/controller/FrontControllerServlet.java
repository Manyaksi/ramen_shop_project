package kr.or.kosta.common.controller;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * ��� �� Ŭ���̾�Ʈ ����(����) ������ ������ ����Ʈ ��Ʈ�ѷ� ���� ���� ��Ʈ�ѷ�
 * 
 * @author �����
 */
public class FrontControllerServlet extends HttpServlet {

	private ControllerFactory controllerFactory;

	public void init() throws ServletException {
		// ��Ʈ�ѷ� ���� ���� �н�
		String configPath = getInitParameter("controllerMapping");
		controllerFactory = ControllerFactory.getInstance(configPath);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		process(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		process(request, response);
	}

	public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		/** ��� �׼� ��ü���� ���� ��� ó�� */
		// ��� ��û������ �ѱ� ó��
		request.setCharacterEncoding("utf-8");

		// ��û(������ ���) �м�
		String uri = request.getRequestURI();

		// Ȯ���� ���� ���ν�..
		// /appName/hello.do -> /hello
		// /appName/board/list.do -> /board/list
		String applicationName = request.getContextPath();
		uri = uri.substring(applicationName.length(), uri.lastIndexOf("."));
		System.out.println("[Debug] : ��û URI: " + uri);

		Controller controller = null;
		ModelAndView mav = null;

		// ���丮�κ��� �ʿ��� ��Ʈ�ѷ� ������Ʈ �˻�
		controller = controllerFactory.getController(uri);
		ViewResolver viewResolver = new JSPViewResolver();
		// ViewResolver viewResolver = new XXXViewResolver();

		if (controller == null) {
//			response.sendError(HttpServletResponse.SC_NOT_FOUND);
//			return;
			viewResolver.execute(request, response, uri+".jsp");
			return;
		}

		mav = controller.handleRequest(request, response);
		Map<String, Object> map = mav.getMap();
		Set<String> keys = map.keySet();
		for (String key : keys) {
			Object value = map.get(key);
			// JSP(View)�� �����͸� ����� �� �ֵ��� request�� ����
			request.setAttribute(key, value);
		}
		
		
		String viewPath = mav.getView();
		if (viewPath == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		if(viewPath.startsWith("redirect")){// redirect
			String[] tokens = viewPath.split(":");
			response.sendRedirect(tokens[1]);
		}else{//forward
			viewResolver.execute(request, response, viewPath);
		}

		//viewResolver.execute(request, response, viewPath);
	}
}
