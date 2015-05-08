package kr.or.kosta.product.domain;

/**
 * 업무에 관련된 Domain 클래스
 * @author 김순재
 *
 */
public class Product {
	
	private int product_number;
	private String product_division;
	private String product_name;
	private String product_photo;
	private int product_orgprice;
	private int product_redprice;
	private String product_company;
	private String product_explain;
	private int product_count;
	
	public int getProduct_number() {
		return product_number;
	}

	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}

	public String getProduct_division() {
		return product_division;
	}

	public void setProduct_division(String product_division) {
		this.product_division = product_division;
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

	public int getProduct_orgprice() {
		return product_orgprice;
	}

	public void setProduct_orgprice(int product_orgprice) {
		this.product_orgprice = product_orgprice;
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

	public String getProduct_explain() {
		return product_explain;
	}

	public void setProduct_explain(String product_explain) {
		this.product_explain = product_explain;
	}

	public int getProduct_count() {
		return product_count;
	}

	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}


	public Product(int product_number, String product_division,
			String product_name, String product_photo, int product_orgprice,
			int product_redprice, String product_company,
			String product_explain, int product_count) {
		super();
		this.product_number = product_number;
		this.product_division = product_division;
		this.product_name = product_name;
		this.product_photo = product_photo;
		this.product_orgprice = product_orgprice;
		this.product_redprice = product_redprice;
		this.product_company = product_company;
		this.product_explain = product_explain;
		this.product_count = product_count;
	}

	@Override
	public String toString() {
		return "Product [product_number=" + product_number
				+ ", product_division=" + product_division + ", product_name="
				+ product_name + ", product_photo=" + product_photo
				+ ", product_orgprice=" + product_orgprice
				+ ", product_redprice=" + product_redprice
				+ ", product_company=" + product_company + ", product_explain="
				+ product_explain + ", product_count=" + product_count + "]";
	}
   
   
 


}