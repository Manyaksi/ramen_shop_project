package kr.or.kosta.order.domain;

public class OrderItem {
	
	private int orderitem_number;
	private int product_number;
	private String orderitem_date;
	private int orderitem_price;
	private int order_number;
	private String id;
	private int shopping_count;
	private String product_name;
	
	public OrderItem(int orderitem_number, int product_number,
			String orderitem_date, int orderitem_price, int order_number,
			String id, int shopping_count, String product_name) {
		super();
		this.orderitem_number = orderitem_number;
		this.product_number = product_number;
		this.orderitem_date = orderitem_date;
		this.orderitem_price = orderitem_price;
		this.order_number = order_number;
		this.id = id;
		this.shopping_count = shopping_count;
		this.product_name = product_name;
	}
	

	public int getShopping_count() {
		return shopping_count;
	}

	public void setShopping_count(int shopping_count) {
		this.shopping_count = shopping_count;
	}

	public int getOrderitem_number() {
		return orderitem_number;
	}

	public void setOrderitem_number(int orderitem_number) {
		this.orderitem_number = orderitem_number;
	}

	public int getProduct_number() {
		return product_number;
	}

	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}

	public String getOrderitem_date() {
		return orderitem_date;
	}

	public void setOrderitem_date(String orderitem_date) {
		this.orderitem_date = orderitem_date;
	}

	public int getOrderitem_price() {
		return orderitem_price;
	}

	public void setOrderitem_price(int orderitem_price) {
		this.orderitem_price = orderitem_price;
	}

	public int getOrder_number() {
		return order_number;
	}

	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	
	

	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	@Override
	public String toString() {
		return "OrderItem [orderitem_number=" + orderitem_number
				+ ", product_number=" + product_number + ", orderitem_date="
				+ orderitem_date + ", orderitem_price=" + orderitem_price
				+ ", order_number=" + order_number + ", id=" + id
				+ ", shopping_count=" + shopping_count + ", product_name="
				+ product_name + "]";
	}

	
	
	

}
