package kr.or.kosta.member.domain;

/**
 * 업무에 관련된 Domain 클래스
 * @author 김순재
 *
 */
public class Member {
   private String id;
   private String address;
   private String name;
   private String passwd;
   private String birth;
   private String email;
   private String phonenumber;
   
   private String postcode1;
   private String postcode2;
   private String address_1;
   private String address_2;
   
   
   
   public Member() {
      this(null, null, null, null, null, null, null);
   }

   public Member(String id, String address, String name, String passwd,
         String birth, String email, String phonenumber) {
      super();
      this.id = id;
      this.address = address;
      this.name = name;
      this.passwd = passwd;
      this.birth = birth;
      this.email = email;
      this.phonenumber = phonenumber;
   }
   
   
   
   public Member(String id, String address, String name, String passwd,
		String birth, String email, String phonenumber, String postcode1,
		String postcode2, String address_1, String address_2) {
	super();
	this.id = id;
	this.address = address;
	this.name = name;
	this.passwd = passwd;
	this.birth = birth;
	this.email = email;
	this.phonenumber = phonenumber;
	this.postcode1 = postcode1;
	this.postcode2 = postcode2;
	this.address_1 = address_1;
	this.address_2 = address_2;
}
   
   

public String getPostcode1() {
	return postcode1;
}

public void setPostcode1(String postcode1) {
	this.postcode1 = postcode1;
}

public String getPostcode2() {
	return postcode2;
}

public void setPostcode2(String postcode2) {
	this.postcode2 = postcode2;
}

public String getAddress_1() {
	return address_1;
}

public void setAddress_1(String address_1) {
	this.address_1 = address_1;
}

public String getAddress_2() {
	return address_2;
}

public void setAddress_2(String address_2) {
	this.address_2 = address_2;
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
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getBirth() {
      return birth;
   }
   public void setBirth(String birth) {
      this.birth = birth;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPhonenumber() {
      return phonenumber;
   }
   public void setPhonenumber(String phonenumber) {
      this.phonenumber = phonenumber;
   }

@Override
public String toString() {
	return "Member [id=" + id + ", address=" + address + ", name=" + name
			+ ", passwd=" + passwd + ", birth=" + birth + ", email=" + email
			+ ", phonenumber=" + phonenumber + ", postcode1=" + postcode1
			+ ", postcode2=" + postcode2 + ", address_1=" + address_1
			+ ", address_2=" + address_2 + "]";
}

   


}