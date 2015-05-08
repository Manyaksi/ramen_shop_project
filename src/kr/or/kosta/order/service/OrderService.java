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
 *  도메인별 비즈니스로직을 제공하는 비지니스객체 
 *   싱글톤패턴 적용
 * @author 김민수
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
	 *  장바구니 추가
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
	 * 장바구니 리스트 확인
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
	 * 회원정보 가져오기
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
	 * 장바구니 갯수 변경하기
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
	 * 장바구니 개별 삭제하기
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
	 * 장바구니 모두 삭제하기
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
	 * 주문 추가하기
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
	 * orders의 order_num 얻어오기
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
	 * 주문item 추가
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
	 * 주문item 추가
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
