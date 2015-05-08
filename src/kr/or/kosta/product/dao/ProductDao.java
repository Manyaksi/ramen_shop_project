package kr.or.kosta.product.dao;

import java.util.List;

import kr.or.kosta.board.domain.Review;
import kr.or.kosta.member.domain.Member;
import kr.or.kosta.product.domain.Product;


/**
 * 사용자 관련 DB 연동을 위한 기본 규약
 * @author 김기정
 *
 */
public interface ProductDao {
	public List<Product> getrank() throws Exception;
	public List<Product> getNew() throws Exception;
	public List<Product> typeAllList(String type) throws Exception;
	public Product showProduct(String product_num) throws Exception; 
	public List<Review> getReviewList(int product_num) throws Exception;
	public List<Product> searchProduct(String searchType,String searchValue) throws Exception;
	public List<Product> searchProductAll(String searchValue)throws Exception;
}
