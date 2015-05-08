package kr.or.kosta.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.or.kosta.board.domain.Review;
import kr.or.kosta.common.dao.DaoFactory;
import kr.or.kosta.common.dao.DaoFactory.FactoryType;
import kr.or.kosta.product.domain.Product;

import org.apache.tomcat.jdbc.pool.DataSource;

/**
 * JDB API를 이용한 데이터베이스 영속성 처리 전담 클래스
 * 
 * @author 김기정
 *
 */
public class JdbcProductDao implements ProductDao {

	private DataSource dataSource;

	public JdbcProductDao() {
	}

	public JdbcProductDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	/**
	 * Top4 출력
	 */

	public List<Product> getrank() throws Exception {
		List<Product> products = null;

		String sql = " select product_number, product_division, product_name,product_photo, product_orgprice,"
				+ " product_redprice, product_company, product_explain, product_count"
				+ " from (select *"
				+ " from product"
				+ " order by product_count desc)"
				+ " where rownum  < 5";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			products = new ArrayList<Product>();
			while (rs.next()) {
				int product_number = rs.getInt("product_number");
				String product_division = rs.getString("product_division");
				String product_name = rs.getString("product_name");
				String product_photo = rs.getString("product_photo");
				int product_orgprice = rs.getInt("product_orgprice");
				int product_redprice = rs.getInt("product_redprice");
				String product_company = rs.getString("product_company");
				String product_explain = rs.getString("product_explain");
				int product_count = rs.getInt("product_count");
				
				Product product = new Product(product_number, product_division, product_name,
						product_photo, product_orgprice, product_redprice, product_company, product_explain, product_count);
				products.add(product);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null) 
				con.close();
		}
		return products;
	}
	
	/**
	 *  신상품 목록
	 */
	
	public List<Product> getNew() throws Exception{
		List<Product> products = null;

		String sql = " select product_number, product_division, product_name,product_photo, product_orgprice,"
				+ " product_redprice, product_company, product_explain, product_count"
				+ " from (select *"
				+ " from product"
				+ " order by product_number desc)"
				+ " where rownum  < 5";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			products = new ArrayList<Product>();
			while (rs.next()) {
				int product_number = rs.getInt("product_number");
				String product_division = rs.getString("product_division");
				String product_name = rs.getString("product_name");
				String product_photo = rs.getString("product_photo");
				int product_orgprice = rs.getInt("product_orgprice");
				int product_redprice = rs.getInt("product_redprice");
				String product_company = rs.getString("product_company");
				String product_explain = rs.getString("product_explain");
				int product_count = rs.getInt("product_count");
				
				Product product = new Product(product_number, product_division, product_name,
						product_photo, product_orgprice, product_redprice, product_company, product_explain, product_count);
				products.add(product);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null) 
				con.close();
		}
		return products;
	}
	
	/**
	 *  타입별 전체 리스트
	 */
	
	public List<Product> typeAllList(String type) throws Exception{
		System.out.println("나는 " + type);
		String[] types = type.split("_");
		List<Product> products = null;
		String sql =
				" select product_number, product_division, product_name,product_photo, product_orgprice,"
				+ " product_redprice, product_company, product_explain, product_count"
				+ " FROM PRODUCT"
				+ " WHERE product_division LIKE ?"
				+ " ORDER BY product_number";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			if(types.length == 1){
				pstmt.setString(1, type + "_%");
			}else{
				pstmt.setString(1, type);
			}
			
			
			rs = pstmt.executeQuery();
			
			products = new ArrayList<Product>();

			while (rs.next()) {
				
				int product_number = rs.getInt("product_number");
				String product_division = rs.getString("product_division");
				String product_name = rs.getString("product_name");
				String product_photo = rs.getString("product_photo");
				int product_orgprice = rs.getInt("product_orgprice");
				int product_redprice = rs.getInt("product_redprice");
				String product_company = rs.getString("product_company");
				String product_explain = rs.getString("product_explain");
				int product_count = rs.getInt("product_count");
				
				Product product = new Product(product_number, product_division, product_name, product_photo, product_orgprice,
						product_redprice, product_company, product_explain, product_count);
				products.add(product);
			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return products;
	}
	
	/**
	 *  제품 상세보기
	 */
	
	public Product showProduct(String product_num) throws Exception{
		System.out.println("나는 " + product_num);
		Product product = null;
		String sql =
				" select product_number, product_division, product_name,product_photo, product_orgprice,"
				+ " product_redprice, product_company, product_explain, product_count"
				+ " FROM PRODUCT"
				+ " WHERE product_number = ? ";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product_num);
			
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				
				int product_number = rs.getInt("product_number");
				String product_division = rs.getString("product_division");
				String product_name = rs.getString("product_name");
				String product_photo = rs.getString("product_photo");
				int product_orgprice = rs.getInt("product_orgprice");
				int product_redprice = rs.getInt("product_redprice");
				String product_company = rs.getString("product_company");
				String product_explain = rs.getString("product_explain");
				int product_count = rs.getInt("product_count");
				
				product = new Product(product_number, product_division, product_name, product_photo, product_orgprice,
						product_redprice, product_company, product_explain, product_count);

			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return product;
	}
	
	/**
	 * 상세보기 페이지 리뷰 리스트
	 */
	
	public List<Review> getReviewList(int product_num) throws Exception{
		List<Review> reviews = null;
		String sql =
				" select id, review_content, review_satisfy"
				+ " from review"
				+ " where product_number=?";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, product_num);
			
			
			rs = pstmt.executeQuery();
			
			reviews = new ArrayList<Review>();

			while (rs.next()) {
				
				String id = rs.getString("id");
				String review_content = rs.getString("review_content");
				int review_satisfy = rs.getInt("review_satisfy");
				
				Review review = new Review();
				review.setId(id);;
				review.setReview_content(review_content);
				review.setReview_satisfy(review_satisfy);
				
				reviews.add(review);
			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return reviews;
	}
	
	/**
	 *  타입별 상품 검색
	 */
	
	public List<Product> searchProduct(String searchType,String searchValue)throws Exception{
		List<Product> products = null;

		String sql =" select product_number, product_division, product_name,product_photo, product_orgprice,"
				+ " product_redprice, product_company, product_explain, product_count"
				+ " FROM product"
				+ " WHERE "+searchType+" LIKE ?"
				+ " ORDER BY product_number DESC";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			
				pstmt.setString(1, "%"+searchValue+"%");
			
			
			rs = pstmt.executeQuery();
			
			products = new ArrayList<Product>();

			while (rs.next()) {
				
				int product_number = rs.getInt("product_number");
				String product_division = rs.getString("product_division");
				String product_name = rs.getString("product_name");
				String product_photo = rs.getString("product_photo");
				int product_orgprice = rs.getInt("product_orgprice");
				int product_redprice = rs.getInt("product_redprice");
				String product_company = rs.getString("product_company");
				String product_explain = rs.getString("product_explain");
				int product_count = rs.getInt("product_count");
				
				Product product = new Product(product_number, product_division, product_name, product_photo, product_orgprice,
						product_redprice, product_company, product_explain, product_count);
				products.add(product);
				
			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return products;
	}
	
	/**
	 * 전체 검색
	 */
	
	public List<Product> searchProductAll(String searchValue)throws Exception{
		List<Product> products = null;

		String sql =" select product_number, product_division, product_name,product_photo, product_orgprice,"
				+ " product_redprice, product_company, product_explain, product_count"
				+ " FROM product"
				+ " where product_name LIKE ? or product_company LIKE ?"
				+ " ORDER BY product_number DESC";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			
				pstmt.setString(1, "%"+searchValue+"%");
				pstmt.setString(2, "%"+searchValue+"%");
			
			
			rs = pstmt.executeQuery();
			
			products = new ArrayList<Product>();

			while (rs.next()) {
				
				int product_number = rs.getInt("product_number");
				String product_division = rs.getString("product_division");
				String product_name = rs.getString("product_name");
				String product_photo = rs.getString("product_photo");
				int product_orgprice = rs.getInt("product_orgprice");
				int product_redprice = rs.getInt("product_redprice");
				String product_company = rs.getString("product_company");
				String product_explain = rs.getString("product_explain");
				int product_count = rs.getInt("product_count");
				
				Product product = new Product(product_number, product_division, product_name, product_photo, product_orgprice,
						product_redprice, product_company, product_explain, product_count);
				products.add(product);
				
			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return products;
	}
	
	
	

	public static void main(String[] args) throws Exception{
		DaoFactory factory = DaoFactory.getDaoFactory(FactoryType.JDBC);
		ProductDao dao = (ProductDao) factory.getDao("kr.or.kosta.product.dao.JdbcProductDao");
		
		List<Product> p = dao.searchProductAll("농심");
		for (Product r: p) {
			System.out.println(r);
		}
	}

}

