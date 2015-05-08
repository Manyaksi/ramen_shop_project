package kr.or.kosta.member.service;

import java.util.List;

import kr.or.kosta.common.dao.DaoFactory;
import kr.or.kosta.common.dao.DaoFactory.FactoryType;
import kr.or.kosta.member.dao.MemberDao;
import kr.or.kosta.member.domain.Member;
import kr.or.kosta.member.domain.User;

/**
 *  도메인별 비즈니스로직을 제공하는 비지니스객체 
 *   싱글톤패턴 적용
 * @author 김민수
 *
 */

public class MemberService {
	
	private static MemberService instance; 
	
	DaoFactory factory = DaoFactory.getDaoFactory(FactoryType.JDBC);
	
	private MemberService(){}
	
	public static MemberService getInstance(){
		if(instance == null){
			synchronized(MemberService.class){
				instance = new MemberService();
			}
			
		}
		return instance;
		
	}
	
	/**
	 *  도메인별 비즈니스 메소드
	 */
	
	/**
	 *  회원목록 반환
	 */
	
	public void addMember(Member member) throws RuntimeException{
		
	//  로직처리나 Dao 사용 등...{
		try {
			MemberDao dao = (MemberDao) factory.getDao("kr.or.kosta.member.dao.JdbcMemberDao");
			dao.addMember(member);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 *  회원 검사
	 */
	

	public Member isMember(String id) throws RuntimeException{
		Member member = null;
		try {
			MemberDao dao = (MemberDao) factory.getDao("kr.or.kosta.member.dao.JdbcMemberDao");
			member =dao.isMember(id);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return member;
	}
	
	/**
	 * 회원정보 수정
	 */
	
	public void modify(String address, String email, String phonenumber, String id,String passwd) throws RuntimeException{
		try {
			MemberDao dao = (MemberDao) factory.getDao("kr.or.kosta.member.dao.JdbcMemberDao");
			dao.modify(address, email, phonenumber, id,passwd);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	

	
	
	
}
