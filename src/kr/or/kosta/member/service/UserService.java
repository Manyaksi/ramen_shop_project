/*package kr.or.kosta.member.service;

import java.util.List;

import kr.or.kosta.common.dao.DaoFactory;
import kr.or.kosta.common.dao.DaoFactory.FactoryType;
import kr.or.kosta.member.dao.UserDao;
import kr.or.kosta.member.domain.User;

*//**
 *  �����κ� ����Ͻ������� �����ϴ� �����Ͻ���ü 
 *   �̱������� ����
 * @author ��μ�
 *
 *//*

public class UserService {
	
	private static UserService instance; 
	
	DaoFactory factory = DaoFactory.getDaoFactory(FactoryType.JDBC);
	
	private UserService(){}
	
	public static UserService getInstance(){
		if(instance == null){
			synchronized(UserService.class){
				instance = new UserService();
			}
			
		}
		return instance;
		
	}
	
	*//**
	 *  �����κ� ����Ͻ� �޼ҵ�
	 *//*
	
	*//**
	 *  ȸ����� ��ȯ
	 *//*
	
	public List<User> getUsers() throws RuntimeException{
		
	//  ����ó���� Dao ��� ��...{
		List<User> list = null;
		try {
			UserDao dao = (UserDao) factory.getDao("kr.or.kosta.user.dao.JdbcUserDao");
			list = dao.getAll();
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return list;
	}

	
	
	
}
*/