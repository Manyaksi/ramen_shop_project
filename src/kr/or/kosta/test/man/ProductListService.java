package kr.or.kosta.test.man;

import java.util.List;

import kr.or.kosta.board.domain.Review;
import kr.or.kosta.common.dao.DaoFactory;
import kr.or.kosta.common.dao.DaoFactory.FactoryType;
import kr.or.kosta.product.dao.ProductDao;
import kr.or.kosta.product.domain.Product;

/**
 *  도메인별 비즈니스로직을 제공하는 비지니스객체 
 *   싱글톤패턴 적용
 * @author 김민수
 *
 */

public class ProductListService {
	
	private static ProductListService instance; 
	
	DaoFactory factory = DaoFactory.getDaoFactory(FactoryType.JDBC);
	
	private ProductListService(){}
	
	public static ProductListService getInstance(){
		if(instance == null){
			synchronized(ProductListService.class){
				instance = new ProductListService();
			}
			
		}
		return instance;
		
	}
	
	/**
	 *  도메인별 비즈니스 메소드
	 */
	
	
	
	/**
	 *  회원 검사
	 */
	

	public List<Product> getRank() throws RuntimeException{
		
		//  로직처리나 Dao 사용 등...{
			List<Product> products = null;
			try {
				ProductDao dao = (ProductDao) factory.getDao("kr.or.kosta.product.dao.JdbcProductDao");
				products= dao.getrank();
				
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
			return products;
		}
	
	public List<Product> getNew() throws RuntimeException{
		
		//  로직처리나 Dao 사용 등...{
			List<Product> products = null;
			try {
				ProductDao dao = (ProductDao) factory.getDao("kr.or.kosta.product.dao.JdbcProductDao");
				products= dao.getNew();
				
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
			return products;
		}
	
	public List<Product> typeAllList(String type) throws RuntimeException{
		List<Product> products = null;
		try {
			ProductDao dao = (ProductDao) factory.getDao("kr.or.kosta.product.dao.JdbcProductDao");
			products= dao.typeAllList(type);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return products;
	}
	
	public Product showProduct(String product_num) throws RuntimeException{
		Product product = null;
		try {
			ProductDao dao = (ProductDao) factory.getDao("kr.or.kosta.product.dao.JdbcProductDao");
			product= dao.showProduct(product_num);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return product;
	}
	
	/**
	 * 리뷰 리스트
	 */
	
	public List<Review> getReviewList(int product_num) throws RuntimeException{
		List<Review> reviews = null;
		try {
			ProductDao dao = (ProductDao) factory.getDao("kr.or.kosta.product.dao.JdbcProductDao");
			reviews = dao.getReviewList(product_num);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return reviews;
	}

	
	
	
}
