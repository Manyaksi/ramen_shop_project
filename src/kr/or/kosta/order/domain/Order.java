package kr.or.kosta.order.domain;

/**
 * 주문에 관련된 Domain 클래스
 * @author 김순재
 *
 */
public class Order {
	private String id;
	private String order_way;
	private int order_price;
	private String address;
	private String order_deliveryway;
	private String order_message;
	private String order_phonenumber;
	private String order_name;
	public Order() {

	}
	public Order(String id, String order_way, int order_price, String address,
			String order_deliveryway, String order_message,
			String order_phonenumber, String order_name) {
		super();
		this.id = id;
		this.order_way = order_way;
		this.order_price = order_price;
		this.address = address;
		this.order_deliveryway = order_deliveryway;
		this.order_message = order_message;
		this.order_phonenumber = order_phonenumber;
		this.order_name = order_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrder_way() {
		return order_way;
	}
	public void setOrder_way(String order_way) {
		this.order_way = order_way;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOrder_deliveryway() {
		return order_deliveryway;
	}
	public void setOrder_deliveryway(String order_deliveryway) {
		this.order_deliveryway = order_deliveryway;
	}
	public String getOrder_message() {
		return order_message;
	}
	public void setOrder_message(String order_message) {
		this.order_message = order_message;
	}
	public String getOrder_phonenumber() {
		return order_phonenumber;
	}
	public void setOrder_phonenumber(String order_phonenumber) {
		this.order_phonenumber = order_phonenumber;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", order_way=" + order_way
				+ ", order_price=" + order_price + ", address=" + address
				+ ", order_deliveryway=" + order_deliveryway
				+ ", order_message=" + order_message + ", order_phonenumber="
				+ order_phonenumber + ", order_name=" + order_name + "]";
	}
	
	

}