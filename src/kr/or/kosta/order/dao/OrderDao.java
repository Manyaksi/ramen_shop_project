package kr.or.kosta.order.dao;

import java.util.List;

import kr.or.kosta.order.domain.Cart;
import kr.or.kosta.order.domain.Order;
import kr.or.kosta.order.domain.OrderItem;


/**
 * 사용자 관련 DB 연동을 위한 기본 규약
 * @author 김기정
 *
 */
public interface OrderDao {
	public void addCart(Cart cart) throws Exception;
	public List<Cart> showCart(String id) throws Exception;
	public boolean isCart(String id, int product_number) throws Exception;
	public List<OrderItem> orderList(String id) throws Exception;
	public void modifyCart(Cart cart) throws Exception;
	public void deleteCart(Cart cart) throws Exception;
	public void deleteAllCart(String id) throws Exception;
	public void addOrder(Order order) throws Exception;
	public int selectOrderNumber(String id) throws Exception;
	public void addOrderItem(Cart cart, int orderitem_number, int order_number) throws Exception;
}
