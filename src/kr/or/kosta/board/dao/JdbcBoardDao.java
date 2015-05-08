package kr.or.kosta.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.kosta.board.domain.Qna;
import kr.or.kosta.board.domain.Review;
import kr.or.kosta.common.dao.DaoFactory;
import kr.or.kosta.common.dao.DaoFactory.FactoryType;
import kr.or.kosta.member.domain.Member;
import kr.or.kosta.product.domain.Product;

import org.apache.tomcat.jdbc.pool.DataSource;

/**
 * JDB API를 이용한 데이터베이스 영속성 처리 전담 클래스
 * 
 * @author 김기정
 *
 */
public class JdbcBoardDao implements BoardDao {

	private DataSource dataSource;

	public JdbcBoardDao() {
	}

	public JdbcBoardDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	/**
	 * review 등록
	 */
	public void addReview(Review review) throws Exception {
		String sql = " insert into review (review_number, product_number, id, review_satisfy, review_content)"
				+ " values(review_number_seq.NEXTVAL,?,?,?,?)";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review.getProduct_number());
			pstmt.setString(2, review.getId());
			pstmt.setInt(3, review.getReview_satisfy());
			pstmt.setString(4, review.getReview_content());
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			con.rollback();
			// throw new Exception("기존 등록된 사용자입니다.");
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}
	
	/**
	 * 글 리스트
	 */

	public List<Qna> Qnalist() throws Exception {
		List<Qna> qnaLists = null;
		String sql = " select list_number, list_title, list_content, list_date, id, group_no, step_no,order_no ,hit_count"
				+ " from list" + " ORDER BY group_no DESC, order_no ASC";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			qnaLists = new ArrayList<Qna>();

			while (rs.next()) {

				int list_number = rs.getInt("list_number");
				String list_title = rs.getString("list_title");
				String list_content = rs.getString("list_content");
				String list_date = rs.getString("list_date");
				String id = rs.getString("id");
				int group_no = rs.getInt("group_no");
				int step_no = rs.getInt("step_no");
				int order_no = rs.getInt("order_no");
				int hit_count = rs.getInt("hit_count");

				Qna qna = new Qna(list_number, list_title, list_content,
						list_date, id, group_no, step_no, order_no, hit_count);
				qnaLists.add(qna);
			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return qnaLists;
	}
	
	/**
	 * 글 작성
	 */

	public void addQna(Qna qna) throws Exception {
		String sql = " insert into list (list_number, list_title, list_content,id,group_no,step_no,order_no)"
				+ " values(list_number_seq.NEXTVAL,?,?,?,list_number_seq.NEXTVAL,0,0)";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qna.getList_title());
			pstmt.setString(2, qna.getList_content());
			pstmt.setString(3, qna.getId());

			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			con.rollback();
			// throw new Exception("기존 등록된 사용자입니다.");
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}
	/**
	 *  댓글 작성
	 */
	
	public void addReqna(Qna qna) throws Exception {
		String sql2 = " UPDATE list" 
				+ " SET order_no = order_no + 1"
				+ " WHERE group_no = "+qna.getGroup_no()+" AND order_no > "+qna.getOrder_no();
		
		String sql = " insert into list (list_number, list_title, list_content,id,group_no,step_no,order_no)"
				+ " values(list_number_seq.NEXTVAL,?,?,?,?,?,"+(qna.getOrder_no()+1)+")";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql2);
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qna.getList_title());
			pstmt.setString(2, qna.getList_content());
			pstmt.setString(3, qna.getId());
			pstmt.setInt(4, qna.getGroup_no());
			pstmt.setInt(5, qna.getStep_no());

			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			con.rollback();
			// throw new Exception("기존 등록된 사용자입니다.");
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}

	/**
	 * 글 읽기
	 */
	public Qna readQna(int list_number) throws Exception {
		System.out.println("나는 " + list_number);
		Qna qna = null;
		String sql = " select id, list_date, hit_count, list_title, list_content,group_no,order_no,step_no"
				+ " from list" + " where list_number =? ";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, list_number);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				String id = rs.getString("id");
				String list_date = rs.getString("list_date");
				int hit_count = rs.getInt("hit_count");
				String list_title = rs.getString("list_title");
				String list_content = rs.getString("list_content");
				int group_no = rs.getInt("group_no");
				int order_no = rs.getInt("order_no");
				int step_no = rs.getInt("step_no");

				qna = new Qna(list_title, list_content, list_date, id,
						hit_count, group_no, order_no, step_no);

			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return qna;
	}

	public void hitcount(int list_number) throws Exception {
		String sql = " update list" + " set hit_count = hit_count+1"
				+ " where list_number=?";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, list_number);

			rs = pstmt.executeQuery();

			if (rs.next()) {

			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}
	
	/**
	 *  타입별 게시글 검색
	 */
	
	public List<Qna> searchBoard(String searchType,String searchValue)throws Exception{
		List<Qna> qnaLists = null;

		String sql =" select list_number, list_title, list_content, list_date, id, group_no, step_no,order_no ,hit_count"
				+ " FROM list"
				+ " WHERE "+searchType+" LIKE ?"
				+ " ORDER BY list_number DESC";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			
				pstmt.setString(1, "%"+searchValue+"%");
			
			
			rs = pstmt.executeQuery();
			
			qnaLists = new ArrayList<Qna>();

			while (rs.next()) {
				
				int list_number = rs.getInt("list_number");
				String list_title = rs.getString("list_title");
				String list_content = rs.getString("list_content");
				String list_date = rs.getString("list_date");
				String id = rs.getString("id");
				int group_no = rs.getInt("group_no");
				int step_no = rs.getInt("step_no");
				int order_no = rs.getInt("order_no");
				int hit_count = rs.getInt("hit_count");

				Qna qna = new Qna(list_number, list_title, list_content,
						list_date, id, group_no, step_no, order_no, hit_count);
				qnaLists.add(qna);
				
			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return qnaLists;
	}
	
	/**
	 * 전체 검색
	 */
	
	public List<Qna> searchBoardAll(String searchValue)throws Exception{
		List<Qna> qnaLists = null;

		String sql =" select list_number, list_title, list_content, list_date, id, group_no, step_no,order_no ,hit_count"
				+ " FROM list"
				+ " where list_title LIKE ? or list_content LIKE ? or id LIKE ?"
				+ "  ORDER BY list_number DESC";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			
				pstmt.setString(1, "%"+searchValue+"%");
				pstmt.setString(2, "%"+searchValue+"%");
				pstmt.setString(3, "%"+searchValue+"%");
			
			
			rs = pstmt.executeQuery();
			
			qnaLists = new ArrayList<Qna>();

			while (rs.next()) {
				
				int list_number = rs.getInt("list_number");
				String list_title = rs.getString("list_title");
				String list_content = rs.getString("list_content");
				String list_date = rs.getString("list_date");
				String id = rs.getString("id");
				int group_no = rs.getInt("group_no");
				int step_no = rs.getInt("step_no");
				int order_no = rs.getInt("order_no");
				int hit_count = rs.getInt("hit_count");

				Qna qna = new Qna(list_number, list_title, list_content,
						list_date, id, group_no, step_no, order_no, hit_count);
				qnaLists.add(qna);
				
			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return qnaLists;
	}
	
	
	
	

	public static void main(String[] args) throws Exception {
		DaoFactory factory = DaoFactory.getDaoFactory(FactoryType.JDBC);
		BoardDao dao = (BoardDao) factory
				.getDao("kr.or.kosta.board.dao.JdbcBoardDao");
		
		List<Qna> q = dao.Qnalist();
		for (Qna qna : q) {
			System.out.println(qna);
		}

	}

}
