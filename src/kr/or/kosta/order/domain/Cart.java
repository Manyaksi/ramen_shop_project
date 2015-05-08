package kr.or.kosta.order.domain;

/**
 * 장바구니에 관련된 Domain 클래스
 * @author 김순재
 *
 */
public class Cart {
	private String id;
	private int product_number;
	private int shopping_count;
	private String product_name;
	private String product_photo;
	private int product_redprice;
	private String product_company;
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(String id, int product_number, int shopping_count,
			String product_name, String product_photo, int product_redprice,
			String product_company) {
		super();
		this.id = id;
		this.product_number = product_number;
		this.shopping_count = shopping_count;
		this.product_name = product_name;
		this.product_photo = product_photo;
		this.product_redprice = product_redprice;
		this.product_company = product_company;
	}

	public Cart(String id, int product_number, int shopping_count) {
		this.id = id;
		this.product_number = product_number;
		this.shopping_count = shopping_count;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getProduct_number() {
		return product_number;
	}

	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}

	public int getShopping_count() {
		return shopping_count;
	}

	public void setShopping_count(int shopping_count) {
		this.shopping_count = shopping_count;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_photo() {
		return product_photo;
	}

	public void setProduct_photo(String product_photo) {
		this.product_photo = product_photo;
	}

	public int getProduct_redprice() {
		return product_redprice;
	}

	public void setProduct_redprice(int product_redprice) {
		this.product_redprice = product_redprice;
	}

	public String getProduct_company() {
		return product_company;
	}

	public void setProduct_company(String product_company) {
		this.product_company = product_company;
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + ", product_number=" + product_number
				+ ", shopping_count=" + shopping_count + ", product_name="
				+ product_name + ", product_photo=" + product_photo
				+ ", product_redprice=" + product_redprice
				+ ", product_company=" + product_company + "]";
	}

	


}