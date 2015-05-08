/*package kr.or.kosta.member.service;

import java.util.List;

import kr.or.kosta.common.dao.DaoFactory;
import kr.or.kosta.common.dao.DaoFactory.FactoryType;
import kr.or.kosta.member.dao.UserDao;
import kr.or.kosta.member.domain.User;

*//**
 *  도메인별 비즈니스로직을 제공하는 비지니스객체 
 *   싱글톤패턴 적용
 * @author 김민수
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
	 *  도메인별 비즈니스 메소드
	 *//*
	
	*//**
	 *  회원목록 반환
	 *//*
	
	public List<User> getUsers() throws RuntimeException{
		
	//  로직처리나 Dao 사용 등...{
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