package techblog.entity;

import java.sql.Timestamp;

public class Posts {
	private int id;
	private String title;
	private String content;
	private String code;
	private String links;
	private Timestamp date;
	private int catgory_id;
	private String user_email;
	
	public Posts(int id, String title, String content, String code, String links, Timestamp date, int catgory_id, String user_email) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.code = code;
		this.date = date;
		this.catgory_id = catgory_id;
		this.user_email = user_email;
		this.links = links;
	}

	public Posts(String title, String content, String code, String links, int catgory_id, String user_email) {
		this.title = title;
		this.content = content;
		this.code = code;
		this.catgory_id = catgory_id;
		this.user_email = user_email;
		this.links = links;
	}
	
	public Posts() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getLinks() {
		return links;
	}

	public void setLinks(String links) {
		this.links = links;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public int getCatgory_id() {
		return catgory_id;
	}

	public void setCatgory_id(int catgory_id) {
		this.catgory_id = catgory_id;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
}
