package kr.or.kosta.order.service;

import java.util.List;

import kr.or.kosta.common.dao.DaoFactory;
import kr.or.kosta.common.dao.DaoFactory.FactoryType;
import kr.or.kosta.member.dao.MemberDao;
import kr.or.kosta.member.domain.Member;
import kr.or.kosta.order.dao.OrderDao;
import kr.or.kosta.order.domain.Cart;
import kr.or.kosta.order.domain.Order;
import kr.or.kosta.order.domain.OrderItem;

/**
 *  �����κ� ����Ͻ������� �����ϴ� �����Ͻ���ü 
 *   �̱������� ����
 * @author ��μ�
 *
 */

public class OrderService {
	
	private static OrderService instance; 
	
	DaoFactory factory = DaoFactory.getDaoFactory(FactoryType.JDBC);
	
	private OrderService(){}
	
	public static OrderService getInstance(){
		if(instance == null){
			synchronized(OrderService.class){
				instance = new OrderService();
			}
			
		}
		return instance;
		
	}
	

	
	public List<OrderItem> orderList(String id) throws RuntimeException{
		List<OrderItem> orderLists = null;
		try {
			OrderDao dao = (OrderDao) factory.getDao("kr.or.kosta.order.dao.JdbcOrderDao");
			orderLists = dao.orderList(id);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return orderLists;
	}
	
	/**
	 *  ��ٱ��� �߰�
	 */
	

	public void addCart(Cart cart) throws RuntimeException{
		
			try {
				OrderDao dao = (OrderDao) factory.getDao("kr.or.kosta.order.dao.JdbcOrderDao");
				dao.addCart(cart);
				
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
	}
	
	/**
	 * ��ٱ��� ����Ʈ Ȯ��
	 */
	public List<Cart> showCart(String id)  throws RuntimeException{
		List<Cart> carts = null;
		try {
			OrderDao dao = (OrderDao) factory.getDao("kr.or.kosta.order.dao.JdbcOrderDao");
			carts = dao.showCart(id);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return carts;
	}
	
	/**
	 * ȸ������ ��������
	 */
	public Member isMember(String id) throws RuntimeException{
		Member member = null;
		try {
			MemberDao dao = (MemberDao) factory.getDao("kr.or.kosta.member.dao.JdbcMemberDao");
			member =dao.isMember(id);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return member;
	}
	
	/**
	 * ��ٱ��� ���� �����ϱ�
	 */
	public void modifyCart(Cart cart) throws RuntimeException{
		try {
			OrderDao dao = (OrderDao) factory.getDao("kr.or.kosta.order.dao.JdbcOrderDao");
			dao.modifyCart(cart);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * ��ٱ��� ���� �����ϱ�
	 */
	public void deleteCart(Cart cart) {
		try {
			OrderDao dao = (OrderDao) factory.getDao("kr.or.kosta.order.dao.JdbcOrderDao");
			dao.deleteCart(cart);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * ��ٱ��� ��� �����ϱ�
	 */
	public void deleteAllCart(String id) {
		try {
			OrderDao dao = (OrderDao) factory.getDao("kr.or.kosta.order.dao.JdbcOrderDao");
			dao.deleteAllCart(id);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	
	/**
	 * �ֹ� �߰��ϱ�
	 */
	public void addOrder(Order order) {
		try {
			OrderDao dao = (OrderDao) factory.getDao("kr.or.kosta.order.dao.JdbcOrderDao");
			dao.addOrder(order);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * orders�� order_num ������
	 */
	public int selectOrderNumber(String id) {
		int order_num = 0;
		try {
			OrderDao dao = (OrderDao) factory.getDao("kr.or.kosta.order.dao.JdbcOrderDao");
			order_num = dao.selectOrderNumber(id);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return order_num;
	}
	
	/**
	 * �ֹ�item �߰�
	 */
	public void addOrderItem(Cart cart, int orderitem_number, int order_number) {
		try {
			OrderDao dao = (OrderDao) factory.getDao("kr.or.kosta.order.dao.JdbcOrderDao");
			dao.addOrderItem(cart, orderitem_number, order_number);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	

	/**
	 * �ֹ�item �߰�
	 */
	public boolean isCart(String id, int product_number) throws RuntimeException {
		boolean isit = false;
		try {
			OrderDao dao = (OrderDao) factory.getDao("kr.or.kosta.order.dao.JdbcOrderDao");
			isit = dao.isCart(id, product_number);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return isit;
	}
	
	


	
}
