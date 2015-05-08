package kr.or.kosta.order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.kosta.common.dao.DaoFactory;
import kr.or.kosta.common.dao.DaoFactory.FactoryType;
import kr.or.kosta.order.domain.Cart;
import kr.or.kosta.order.domain.Order;
import kr.or.kosta.order.domain.OrderItem;

import org.apache.tomcat.jdbc.pool.DataSource;

/**
 * JDB API를 이용한 데이터베이스 영속성 처리 전담 클래스
 * @author 김기정
 *
 */
public class JdbcOrderDao implements OrderDao{
	
	private DataSource dataSource;
	
	public JdbcOrderDao(){}
	
	public JdbcOrderDao(DataSource dataSource){
		this.dataSource = dataSource;		
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	/**
	 * 장바구니 추가
	 */
	public void addCart(Cart cart) throws Exception {
		System.out.println(cart);
		String sql = " insert into shoppingbag (id, product_number, shopping_count)"
				+ " values(?, ?, ?)";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart.getId());
			pstmt.setInt(2, cart.getProduct_number());
			pstmt.setInt(3, cart.getShopping_count());

			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			con.rollback();
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}

	/**
	 * 장바구니 제품 보기
	 */
	public List<Cart> showCart(String id) throws Exception {
		System.out.println(id);
		List<Cart> carts = null;
		String sql = " SELECT b.id, b.product_number, b.shopping_count, p.product_name, p.product_photo, p.product_redprice, p.product_company"
				+ " FROM PRODUCT p JOIN SHOPPINGBAG b"
				+ " ON p.product_number = b.product_number"
				+ " WHERE id LIKE ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			carts = new ArrayList<Cart>();

			while (rs.next()) {
				String cartid = rs.getString("id");
				int product_number = rs.getInt("product_number");
				int shopping_count = rs.getInt("shopping_count");
				String product_name = rs.getString("product_name");
				String product_photo = rs.getString("product_photo");
				int product_redprice = rs.getInt("product_redprice");
				String product_company = rs.getString("product_company");

				Cart cart = new Cart(cartid, product_number, shopping_count,
						product_name, product_photo, product_redprice,
						product_company);
				carts.add(cart);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return carts;
	}

	/**
	 * 장바구니에 제품 있니?
	 */
	public boolean isCart(String id, int product_number) throws Exception {
		System.out.println(id);
		String sql = " SELECT product_number"
				+ " FROM shoppingbag"
				+ " WHERE id LIKE ? and product_number = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, product_number);

			rs = pstmt.executeQuery();


			if (rs.next()) {
				return false;
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return true;
	}
	
	/**
	 * 장바구니 갯수 수정하기
	 */
	public void modifyCart(Cart cart) throws Exception {
		System.out.println(cart);
		String sql = " UPDATE shoppingbag" + " SET shopping_count = ? "
				+ " WHERE id= ? and product_number= ?";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cart.getShopping_count());
			pstmt.setString(2, cart.getId());
			pstmt.setInt(3, cart.getProduct_number());

			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			con.rollback();
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}

	/**
	 * 장바구니 개별 삭제하기
	 */
	public void deleteCart(Cart cart) throws Exception {
		System.out.println(cart);
		String sql = " DELETE shoppingbag"
				+ " WHERE id= ? and product_number= ?";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart.getId());
			pstmt.setInt(2, cart.getProduct_number());

			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			con.rollback();
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}

	/**
	 * 장바구니 모두 삭제하기
	 */
	public void deleteAllCart(String id) throws Exception {
		String sql = " DELETE shoppingbag" + " WHERE id= ?";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			con.rollback();
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}

	/**
	 * 주문 추가
	 */
	public void addOrder(Order order) throws Exception {
		System.out.println(order);
		String sql = " insert into orders (order_number, id, order_way, order_price, address, order_deliveryway, order_message, order_phonenumber, order_name)"
				+ " values(order_number_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order.getId());
			pstmt.setString(2, order.getOrder_way());
			pstmt.setInt(3, order.getOrder_price());
			pstmt.setString(4, order.getAddress());
			pstmt.setString(5, order.getOrder_deliveryway());
			pstmt.setString(6, order.getOrder_message());
			pstmt.setString(7, order.getOrder_phonenumber());
			pstmt.setString(8, order.getOrder_name());

			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			con.rollback();
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}

	/**
	 * orders의 order_num 얻어오기
	 */
	public int selectOrderNumber(String id) throws Exception {
		int order_number = 0;

		String sql = " select MAX(order_number) order_number" +
					 " from orders" +
					 " where id= ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();


			if (rs.next()) {
				order_number = rs.getInt("order_number");

			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return order_number;
	}
	
	/**
	 * 주문item 추가
	 */
	/**
	    * 주문item 추가
	    */
	   public void addOrderItem(Cart cart, int orderitem_number, int order_number) throws Exception {
	      System.out.println(cart);
	      String sql = " insert into orderitem (orderitem_number, product_number, orderItem_price, order_number, id, shopping_count)"+
	                " values(?, ?, ?, ?, ?, ?)";
	      
	      String sql2 = " UPDATE product" +
	                 " SET product_count = product_count + 1" +
	                 " WHERE product_number = " + cart.getProduct_number();
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      PreparedStatement pstmt2 = null;

	      try {
	         con = dataSource.getConnection();
	         con.setAutoCommit(false);
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, orderitem_number);
	         pstmt.setInt(2, cart.getProduct_number());
	         pstmt.setInt(3, cart.getProduct_redprice());
	         pstmt.setInt(4, order_number);
	         pstmt.setString(5, cart.getId());
	         pstmt.setInt(6, cart.getShopping_count());

	         pstmt.executeUpdate();
	         pstmt2 = con.prepareStatement(sql2);
	         pstmt2.executeUpdate();
	         
	         con.commit();
	      } catch (SQLException e) {
	         con.rollback();
	         e.printStackTrace();
	      } finally {
	         if (pstmt != null)
	            pstmt.close();
	         if (con != null)
	            con.close();
	      }
	   }
	
	public List<OrderItem> orderList(String id) throws Exception{
		List<OrderItem> orderLists = null;
		String sql = " select i.orderitem_number, i.product_number, i.orderitem_date, i.orderitem_price,i.order_number, id, shopping_count,p.product_name" +
					 " from orderitem i JOIN product p" +
					 " ON p.product_number = i.product_number" +
					 " where i.id LIKE ?" +
					 " order by order_number, orderitem_number ";
					 
		


		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			orderLists = new ArrayList<OrderItem>();
			
			while(rs.next()){
				int orderitem_number = rs.getInt("orderitem_number");
				int product_number = rs.getInt("product_number");
				String orderitem_date = rs.getString("orderitem_date");
				int orderitem_price = rs.getInt("orderitem_price");
				int order_number = rs.getInt("order_number");
				String userId = rs.getString("id");
				int shopping_count = rs.getInt("shopping_count");
				String product_name = rs.getString("product_name");
				
				OrderItem orderitem = new OrderItem(orderitem_number, product_number, orderitem_date, orderitem_price, order_number, userId,
						shopping_count, product_name);
				orderLists.add(orderitem);
			}
		}finally{
			if (rs != null)   rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null)   con.close();
		}
		return orderLists;
	}
	

	
	public static void main(String[] args) throws Exception{
		DaoFactory factory = DaoFactory.getDaoFactory(FactoryType.JDBC);
		OrderDao dao = (OrderDao) factory.getDao("kr.or.kosta.order.dao.JdbcOrderDao");
		List<OrderItem> carts = dao.orderList("bangry");
		for (OrderItem cart : carts) {
			System.out.println(cart);
		}
	}

}








