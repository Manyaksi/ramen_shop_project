package kr.or.kosta.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.management.Query;

import kr.or.kosta.common.dao.DaoFactory;
import kr.or.kosta.common.dao.DaoFactory.FactoryType;
import kr.or.kosta.member.domain.Member;

import org.apache.tomcat.jdbc.pool.DataSource;

/**
 * JDB API를 이용한 데이터베이스 영속성 처리 전담 클래스
 * 
 * @author 김기정
 *
 */
public class JdbcMemberDao implements MemberDao {

	private DataSource dataSource;

	public JdbcMemberDao() {
	}

	public JdbcMemberDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	/**
	 * 사용자 등록
	 */
	public void addMember(Member member) throws Exception {
		String sql = " insert into member (id, address, name, passwd, birth, email,phonenumber)"
				+ " values(?,?, ?,?,TO_DATE(?, 'YYYY/MM/DD'),?,?)";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getAddress());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPasswd());
			pstmt.setString(5, member.getBirth());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getPhonenumber());
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
	 * 사용자 조회
	 */
	/*
	 * public User get(String id) throws Exception{ User user = null;
	 * 
	 * String sql = " SELECT id, name, passwd" + " FROM users" +
	 * " WHERE id = ?"; Connection con = null; PreparedStatement pstmt = null;
	 * ResultSet rs = null;
	 * 
	 * try{ con = dataSource.getConnection(); pstmt = con.prepareStatement(sql);
	 * pstmt.setString(1, id); rs = pstmt.executeQuery(); if(rs.next()){ String
	 * uid = rs.getString("id"); String name = rs.getString("name"); String
	 * passwd = rs.getString("passwd"); user = new User(uid, name, passwd); }
	 * 
	 * }finally{ if(rs != null) rs.close(); if(pstmt != null) pstmt.close();
	 * if(con != null) con.close(); }
	 * 
	 * return user; }
	 *//**
	 * 이름으로 사용자 검색
	 */
	/*
	 * public List<User> search(String name) throws Exception{ List<User> users
	 * = null;
	 * 
	 * String sql = " SELECT id, name, passwd" + " FROM users" +
	 * " WHERE name LIKE ?"; Connection con = null; PreparedStatement pstmt =
	 * null; ResultSet rs = null;
	 * 
	 * try{ con = dataSource.getConnection(); pstmt = con.prepareStatement(sql);
	 * pstmt.setString(1, "%" + name + "%"); rs = pstmt.executeQuery(); users =
	 * new ArrayList<User>(); while(rs.next()){ String uid = rs.getString("id");
	 * String uname = rs.getString("name"); String upasswd =
	 * rs.getString("passwd"); User user = new User(uid, uname, upasswd);
	 * users.add(user); } }finally{ if(rs != null) rs.close(); if(pstmt != null)
	 * pstmt.close(); if(con != null) con.close(); } return users; }
	 *//**
	 * 전체 사용자 조회
	 */
	/*
	 * public List<User> getAll() throws Exception{ List<User> users = null;
	 * 
	 * String sql = " SELECT id, name, passwd" + " FROM users";
	 * 
	 * Connection con = null; PreparedStatement pstmt = null; ResultSet rs =
	 * null;
	 * 
	 * try{ con = dataSource.getConnection(); pstmt = con.prepareStatement(sql);
	 * rs = pstmt.executeQuery(); users = new ArrayList<User>();
	 * 
	 * while(rs.next()){ String uid = rs.getString("id"); String name =
	 * rs.getString("name"); String passwd = rs.getString("passwd"); User user =
	 * new User(uid, name, passwd); users.add(user); }
	 * 
	 * }finally{ if(rs != null) rs.close(); if(pstmt != null) pstmt.close();
	 * if(con != null) con.close(); } return users; }
	 */

	/**
	 * 회원 인증
	 */
	public Member isMember(String id) throws Exception {
		Member member = null;

		String sql = " SELECT id, address, name, passwd, birth, email, phonenumber"
				+ " FROM member" + " WHERE id = ? ";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new Member();
				member.setId(rs.getString("id"));
				member.setAddress(rs.getString("address"));
				member.setName(rs.getString("name"));
				member.setPasswd(rs.getString("passwd"));
				member.setBirth(rs.getString("birth"));
				member.setEmail(rs.getString("email"));
				member.setPhonenumber(rs.getString("phonenumber"));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return member;
	}

	public void modify(String address, String email, String phonenumber, String id,String passwd) throws Exception {
		System.out.println("들어가나여");
		String sql = " UPDATE member"
				+ " SET address=?, email=?, phonenumber=? ,passwd=?"
				+ " WHERE  id=? ";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, address);
			pstmt.setString(2, email);
			pstmt.setString(3,phonenumber);
			pstmt.setString(4, passwd);
			pstmt.setString(5, id);
			
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

	public static void main(String[] args) throws Exception {
		DaoFactory factory = DaoFactory.getDaoFactory(FactoryType.JDBC);
		MemberDao dao = (MemberDao) factory
				.getDao("kr.or.kosta.member.dao.JdbcMemberDao");

		String id = "hohoho";
		
		dao.modify("주소", "메일", "전화번호", id,"222");
		System.out.println("완료");

	}

}
