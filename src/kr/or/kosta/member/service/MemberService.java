package kr.or.kosta.member.service;

import java.util.List;

import kr.or.kosta.common.dao.DaoFactory;
import kr.or.kosta.common.dao.DaoFactory.FactoryType;
import kr.or.kosta.member.dao.MemberDao;
import kr.or.kosta.member.domain.Member;
import kr.or.kosta.member.domain.User;

/**
 *  �����κ� ����Ͻ������� �����ϴ� �����Ͻ���ü 
 *   �̱������� ����
 * @author ��μ�
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
	 *  �����κ� ����Ͻ� �޼ҵ�
	 */
	
	/**
	 *  ȸ����� ��ȯ
	 */
	
	public void addMember(Member member) throws RuntimeException{
		
	//  ����ó���� Dao ��� ��...{
		try {
			MemberDao dao = (MemberDao) factory.getDao("kr.or.kosta.member.dao.JdbcMemberDao");
			dao.addMember(member);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 *  ȸ�� �˻�
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
	 * ȸ������ ����
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
