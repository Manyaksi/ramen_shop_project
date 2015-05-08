package kr.or.kosta.member.dao;

import kr.or.kosta.member.domain.Member;


/**
 * 사용자 관련 DB 연동을 위한 기본 규약
 * @author 김기정
 *
 */
public interface MemberDao {
	public void addMember(Member member) throws Exception;
	public Member isMember(String id) throws Exception;
	public void modify(String address, String email, String phonenumber, String id,String passwd) throws Exception;
	/*public User get(String id) throws Exception;
	public List<User> search(String name) throws Exception;
	public List<User> getAll() throws Exception;
	public User isMember(String id, String passwd) throws Exception;*/
}
