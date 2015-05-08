package kr.or.kosta.board.dao;

import java.util.List;

import kr.or.kosta.board.domain.Qna;
import kr.or.kosta.board.domain.Review;
import kr.or.kosta.member.domain.Member;
import kr.or.kosta.product.domain.Product;


/**
 * 사용자 관련 DB 연동을 위한 기본 규약
 * @author 김기정
 *
 */
public interface BoardDao {
	public void addReview(Review review) throws Exception;
	public List<Qna> Qnalist() throws Exception;
	public void addQna(Qna qna) throws Exception;
	public void addReqna(Qna qna) throws Exception; 
	public Qna readQna(int list_number) throws Exception;
	public void hitcount(int list_number) throws Exception;
	public List<Qna> searchBoard(String searchType,String searchValue) throws Exception;
	public List<Qna> searchBoardAll(String searchValue)throws Exception;
}
