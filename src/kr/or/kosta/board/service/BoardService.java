package kr.or.kosta.board.service;

import java.util.List;

import kr.or.kosta.board.dao.BoardDao;
import kr.or.kosta.board.domain.Qna;
import kr.or.kosta.board.domain.Review;
import kr.or.kosta.common.dao.DaoFactory;
import kr.or.kosta.common.dao.DaoFactory.FactoryType;
import kr.or.kosta.member.dao.MemberDao;
import kr.or.kosta.member.domain.Member;
import kr.or.kosta.member.domain.User;
import kr.or.kosta.product.dao.ProductDao;
import kr.or.kosta.product.domain.Product;

/**
 *  �����κ� ����Ͻ������� �����ϴ� �����Ͻ���ü 
 *   �̱������� ����
 * @author ��μ�
 *
 */

public class BoardService {
	
	private static BoardService instance; 
	
	DaoFactory factory = DaoFactory.getDaoFactory(FactoryType.JDBC);
	
	private BoardService(){}
	
	public static BoardService getInstance(){
		if(instance == null){
			synchronized(BoardService.class){
				instance = new BoardService();
			}
			
		}
		return instance;
		
	}
	
	/**
	 *  �����κ� ����Ͻ� �޼ҵ�
	 */
	
	/**
	 *  ���� �߰�
	 */
	
	public void addReview(Review review) throws RuntimeException{
		
	//  ����ó���� Dao ��� ��...{
		try {
			BoardDao dao = (BoardDao) factory.getDao("kr.or.kosta.board.dao.JdbcBoardDao");
			dao.addReview(review);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * qna����Ʈ 
	 */
	public List<Qna> qnaList() throws RuntimeException{
		
		List<Qna> qnaList = null;
		try {
			BoardDao dao = (BoardDao) factory.getDao("kr.or.kosta.board.dao.JdbcBoardDao");
			qnaList = dao.Qnalist();
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
		return qnaList;
	}
	
	/**
	 * qna ���
	 */
	
	public void addqna(Qna qna) throws RuntimeException{
		
	//  ����ó���� Dao ��� ��...{
		try {
			BoardDao dao = (BoardDao) factory.getDao("kr.or.kosta.board.dao.JdbcBoardDao");
			dao.addQna(qna);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * ��� ���
	 */
	
	public void addReqna(Qna qna) throws RuntimeException{
		
		//  ����ó���� Dao ��� ��...{
			try {
				BoardDao dao = (BoardDao) factory.getDao("kr.or.kosta.board.dao.JdbcBoardDao");
				dao.addReqna(qna);
				
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
	
	/**
	 * �� �б�
	 */
	
	public Qna readQna(int list_number) throws RuntimeException{
		Qna qna = null;
		try {
			BoardDao dao = (BoardDao) factory.getDao("kr.or.kosta.board.dao.JdbcBoardDao");
			
			qna = dao.readQna(list_number);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return qna;
	}
	
	/**
	 * ��ȸ�� ����
	 */
	public void hitcount(int list_number) throws RuntimeException{
		try {
			BoardDao dao = (BoardDao) factory.getDao("kr.or.kosta.board.dao.JdbcBoardDao");
			
			dao.hitcount(list_number);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * �Խ��� Ÿ�Ժ� �˻�
	 */

	public List<Qna> searchProduct(String searchType,String searchValue) throws RuntimeException{
		List<Qna> qnaLists = null;
		try {
			BoardDao dao = (BoardDao) factory.getDao("kr.or.kosta.board.dao.JdbcBoardDao");
			qnaLists= dao.searchBoard(searchType, searchValue);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return qnaLists;
	}
	/**
	 * ��ü �˻�
	 */
	
	public List<Qna> searchProductAll(String searchValue) throws RuntimeException{
		List<Qna> qnaLists = null;
		try {
			BoardDao dao = (BoardDao) factory.getDao("kr.or.kosta.board.dao.JdbcBoardDao");
			qnaLists= dao.searchBoardAll(searchValue);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return qnaLists;
	}
	
	

	
	
	
}
