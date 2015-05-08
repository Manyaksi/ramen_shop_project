package kr.or.kosta.test.man;

import java.util.List;

import kr.or.kosta.board.domain.Review;
import kr.or.kosta.common.dao.DaoFactory;
import kr.or.kosta.common.dao.DaoFactory.FactoryType;
import kr.or.kosta.product.dao.ProductDao;
import kr.or.kosta.product.domain.Product;

/**
 *  �����κ� ����Ͻ������� �����ϴ� �����Ͻ���ü 
 *   �̱������� ����
 * @author ��μ�
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
	 *  �����κ� ����Ͻ� �޼ҵ�
	 */
	
	
	
	/**
	 *  ȸ�� �˻�
	 */
	

	public List<Product> getRank() throws RuntimeException{
		
		//  ����ó���� Dao ��� ��...{
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
		
		//  ����ó���� Dao ��� ��...{
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
	 * ���� ����Ʈ
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
