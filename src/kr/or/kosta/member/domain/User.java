package kr.or.kosta.member.domain;

/**
 * 업무에 관련된 Domain 클래스
 * @author 김기정
 *
 */
public class User {
	private String id;
	private String name;
	private String passwd;
	
	public User() {
		this(null, null, null);		
	}
	public User(String id, String name, String passwd) {
		this.id = id;
		this.name = name;
		this.passwd = passwd;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", passwd=" + passwd + "]";
	}
	
}
