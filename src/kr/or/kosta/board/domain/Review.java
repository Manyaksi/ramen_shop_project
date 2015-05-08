package kr.or.kosta.board.domain;

public class Review {
	private int review_number;
	private int product_number;
	private String id;
	private int review_satisfy;
	private String review_content;
	private String review_date;
	
	
	public Review(){}
	
	public Review(int review_number, int product_number, String id,
			int review_satisfy, String review_content) {
		super();
		this.review_number = review_number;
		this.product_number = product_number;
		this.id = id;
		this.review_satisfy = review_satisfy;
		this.review_content = review_content;
	}
	
	
	public Review(int review_number, int product_number, String id,
			int review_satisfy, String review_content, String review_date) {
		super();
		this.review_number = review_number;
		this.product_number = product_number;
		this.id = id;
		this.review_satisfy = review_satisfy;
		this.review_content = review_content;
		this.review_date = review_date;
	}
	

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	public int getReview_number() {
		return review_number;
	}
	public void setReview_number(int review_number) {
		this.review_number = review_number;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getReview_satisfy() {
		return review_satisfy;
	}
	public void setReview_satisfy(int review_satisfy) {
		this.review_satisfy = review_satisfy;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	@Override
	public String toString() {
		return "Review [review_number=" + review_number + ", product_number="
				+ product_number + ", id=" + id + ", review_satisfy="
				+ review_satisfy + ", review_content=" + review_content + "]";
	}
	
	
	
	
	
	
	

}
