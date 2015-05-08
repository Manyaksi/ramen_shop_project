package kr.or.kosta.board.domain;

public class Qna {
	private int list_number;
	private String list_title;
	private String list_content;
	private String list_date;
	private String id;
	private int group_no;
	private int step_no;
	private int order_no;
	private int hit_count;
	
	

	
	
	

	public Qna() {
		super();
	}
	



	public Qna(String list_title, String list_content, String list_date,
			String id, int hit_count,int group_no, int order_no, int step_no) {
		super();
		this.list_title = list_title;
		this.list_content = list_content;
		this.list_date = list_date;
		this.id = id;
		this.hit_count = hit_count;
		this.group_no = group_no;
		this.order_no = order_no;
		this.step_no = step_no;
	}




	public Qna(int list_number, String list_title, String list_content,
			String list_date, String id, int group_no, int step_no,
			int order_no, int hit_count) {
		super();
		this.list_number = list_number;
		this.list_title = list_title;
		this.list_content = list_content;
		this.list_date = list_date;
		this.id = id;
		this.group_no = group_no;
		this.step_no = step_no;
		this.order_no = order_no;
		this.hit_count = hit_count;
	}

	

	public int getHit_count() {
		return hit_count;
	}



	public void setHit_count(int hit_count) {
		this.hit_count = hit_count;
	}



	public int getGroup_no() {
		return group_no;
	}



	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}



	public int getStep_no() {
		return step_no;
	}



	public void setStep_no(int step_no) {
		this.step_no = step_no;
	}



	public int getOrder_no() {
		return order_no;
	}



	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}



	public int getList_number() {
		return list_number;
	}

	public void setList_number(int list_number) {
		this.list_number = list_number;
	}

	public String getList_title() {
		return list_title;
	}

	public void setList_title(String list_title) {
		this.list_title = list_title;
	}

	public String getList_content() {
		return list_content;
	}

	public void setList_content(String list_content) {
		this.list_content = list_content;
	}

	public String getList_date() {
		return list_date;
	}

	public void setList_date(String list_date) {
		this.list_date = list_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}



	@Override
	public String toString() {
		return "Qna [list_number=" + list_number + ", list_title=" + list_title
				+ ", list_content=" + list_content + ", list_date=" + list_date
				+ ", id=" + id + ", group_no=" + group_no + ", step_no="
				+ step_no + ", order_no=" + order_no + ", hit_count="
				+ hit_count + "]";
	}



	

	
	
	
	

}
